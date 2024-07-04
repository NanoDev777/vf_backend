<?php

namespace App\Http\Controllers\Api\V1;

use App\Models\Therapist;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Requests\Therapist\TherapistRequest;
use App\Filters\TherapistSearch\TherapistSearch;
use App\Http\Resources\Therapist\TherapistCollection;
use App\Http\Resources\Therapist\TherapistEditResource;

class TherapistController extends ApiController
{
    private $therapist;

    public function __construct(Therapist $therapist)
    {
        $this->therapist = $therapist;
    }

    public function index(Request $request)
    {
        if ($request->filled('filter.filters')) {
            return new TherapistCollection(TherapistSearch::apply($request, $this->therapist));
        }

        $therapists = TherapistSearch::checkSortFilter($request, $this->therapist->newQuery());

        return new TherapistCollection($therapists->paginate($request->per_page));
    }

    public function store(TherapistRequest $request)
    {
        DB::beginTransaction();

        try {
            $user = User::create([
                'name' => $request->ci,
                'email' => $request->email,
                'password' => $request->ci
            ]);

            if ($user) {
                $therapist = $this->therapist->create([
                    'names' => $request->names,
                    'surnames' => $request->surnames,
                    'ci' => $request->ci,
                    'phone' => $request->phone,
                    'address' => $request->address,
                    'user_id' => $request->user_id,
                    'profession_id' => $request->profession_id,
                ]);
            }

            DB::commit();
        } catch (\Exception $e) {
            DB::rollback();
            return $this->respondInternalError();
        }

        return $this->respondCreated($therapist);
    }

    public function edit(Therapist $therapist)
    {
        return new TherapistEditResource($therapist);
    }

    public function update(TherapistRequest $request, Therapist $therapist)
    {
        DB::beginTransaction();

        try {
            $therapist->update([
                'names' => $request->names,
                'surnames' => $request->surnames,
                'ci' => $request->ci,
                'phone' => $request->phone,
                'address' => $request->address,
                'profession_id' => $request->profession_id,
            ]);

            DB::commit();
        } catch (\Exception $e) {
            DB::rollback();
            return $this->respondInternalError();
        }

        return $this->respondUpdated($therapist);
    }

    public function destroy(Request $request)
    {
        try {
            $data = [];
            $therapists = $this->therapist->find($request->therapists);
            foreach ($therapists as $therapist) {
                $model = $therapist->secureDelete();
                if ($model) {
                    $data[] = $therapist;
                }
            }
        } catch (Exception $e) {
            return $this->respondInternalError();
        }
        return $this->respondDeleted($data);
    }
}
