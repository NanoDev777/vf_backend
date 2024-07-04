<?php

namespace App\Http\Controllers\Api\V1;

use App\Models\People;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Requests\People\PeopleRequest;
use App\Filters\PeopleSearch\PeopleSearch;
use App\Http\Resources\People\PeopleCollection;
use App\Http\Resources\People\PeopleEditResource;
use App\Filters\PeopleSearch\Searches\PeoplesFilter;

class PeopleController extends ApiController
{
    private $people;

    public function __construct(People $people)
    {
        $this->people = $people;
    }

    public function index(Request $request)
    {
        if ($request->filled('filter.filters')) {
            return new PeopleCollection(PeopleSearch::apply($request, $this->people));
        }

        $peoples = PeopleSearch::checkSortFilter($request, $this->people->newQuery());

        return new PeopleCollection($peoples->paginate($request->per_page));
    }

    public function search(PeoplesFilter $filters)
    {
        $peoples = $this->people->filter($filters)->get();
        return $this->respond($peoples);
    }

    public function store(PeopleRequest $request)
    {
        DB::beginTransaction();

        try {
            $user = User::create([
                'name' => $request->ci,
                'email' => $request->email,
                'password' => $request->ci
            ]);

            if ($user) {
                $people = $this->people->create([
                    'names' => $request->names,
                    'surnames' => $request->surnames,
                    'ci' => $request->ci,
                    'address' => $request->address,
                    'phone' => $request->phone,
                    'email' => $request->email,
                    'user_id' => $user->id,
                    'city_id' => $request->city_id,
                ]);
            }

            DB::commit();
        } catch (\Exception $e) {
            DB::rollback();
            return $this->respondInternalError();
        }

        return $this->respondCreated($people);
    }

    public function edit(People $people)
    {
        return new PeopleEditResource($people);
    }

    public function update(PeopleRequest $request, People $people)
    {
        DB::beginTransaction();

        try {
            $people->update([
                'names' => $request->names,
                'surnames' => $request->surnames,
                'ci' => $request->ci,
                'address' => $request->address,
                'phone' => $request->phone,
                'email' => $request->email,
                'city_id' => $request->city_id,
            ]);

            DB::commit();
        } catch (\Exception $e) {
            DB::rollback();
            return $this->respondInternalError();
        }

        return $this->respondUpdated($people);
    }

    public function destroy(Request $request)
    {
        try {
            $data = [];
            $peoples = $this->people->find($request->people);
            foreach ($peoples as $people) {
                $model = $people->secureDelete();
                if ($model) {
                    $data[] = $people;
                }
            }
        } catch (Exception $e) {
            return $this->respondInternalError();
        }
        return $this->respondDeleted($data);
    }
}
