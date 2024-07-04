<?php

namespace App\Http\Controllers\Api\V1;

use App\Models\Patient;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Requests\Patient\PatientRequest;
use App\Filters\PatientSearch\PatientSearch;
use App\Http\Resources\Patient\PatientCollection;
use App\Http\Resources\Patient\PatientEditResource;
use App\Services\PatientService;

class PatientController extends ApiController
{
    private $patient;
    private $service;

    public function __construct(Patient $patient, PatientService $service)
    {
        $this->patient = $patient;
        $this->service = $service;
    }

    public function index(Request $request)
    {
        if ($request->filled('filter.filters')) {
            return new PatientCollection(PatientSearch::apply($request, $this->patient));
        }

        $patients = PatientSearch::checkSortFilter($request, $this->patient->newQuery());

        return new PatientCollection($patients->paginate($request->per_page));
    }

    public function store(PatientRequest $request)
    {
        DB::beginTransaction();

        try {
            $patient = $this->patient->create([
                'names' => $request->names,
                'surnames' => $request->surnames,
                'birthdate' => $request->birthdate,
                'course' => $request->course,
                'phone' => $request->phone,
                'email' => $request->email,
                'school_id' => $request->school_id,
                'people_id' => $request->people_id,
            ]);

            DB::commit();
        } catch (\Exception $e) {
            DB::rollback();
            return $this->respondInternalError();
        }

        return $this->respondCreated($patient);
    }

    public function edit(Patient $patient)
    {
        return new PatientEditResource($patient);
    }

    public function update(PatientRequest $request, Patient $patient)
    {
        DB::beginTransaction();

        try {
            $patient->update([
                'names' => $request->names,
                'surnames' => $request->surnames,
                'birthdate' => $request->birthdate,
                'course' => $request->course,
                'phone' => $request->phone,
                'email' => $request->email,
                'school_id' => $request->school_id,
                'people_id' => $request->people_id,
            ]);

            DB::commit();
        } catch (\Exception $e) {
            DB::rollback();
            return $this->respondInternalError();
        }

        return $this->respondUpdated($patient);
    }

    public function destroy(Request $request)
    {
        try {
            $data = [];
            $patients = $this->patient->find($request->patients);
            foreach ($patients as $patient) {
                $model = $patient->secureDelete();
                if ($model) {
                    $data[] = $patient;
                }
            }
        } catch (Exception $e) {
            return $this->respondInternalError();
        }
        return $this->respondDeleted($data);
    }

    public function listPdf(Request $request)
    {
        return $this->service->manyPdfDownload($request);
    }

    public function listExcel(Request $request)
    {
        return $this->service->manyExcelDownload($request);
    }
}
