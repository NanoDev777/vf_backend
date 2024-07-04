<?php

namespace App\Services;

use App\Models\Patient;
use Illuminate\Http\Request;
use App\Exports\PdfExport;
use App\Exports\Excel\PatientsExport;
use App\Transformers\PatientTransformer;

class PatientService
{
    protected $transformer;

    public function __construct(PatientTransformer $transformer)
    {
        $this->transformer = $transformer;
    }

    // public function singlePdfDownload(Patient $patient)
    // {
    //     $patient = $this->transformer->item($patient);
    //     $export = new PdfExport('pdf.patient', ['patient' => $patient['patient']]);
    //     return $export->setMargin(2,2,2,2)->legal()->download();
    // }

    public function manyPdfDownload(Request $request)
    {
        if (empty($request->patient)) {
            $patients = $this->transformer->collection(Patient::desc()->get());
        } else {
            $patients = $this->transformer->collection(Patient::in($request->patient)->get());
        }

        $export = new PdfExport('pdf.patient-list', $patients);
        return $export->options()->legal()->landscape()->download();
    }

    public function manyExcelDownload(Request $request)
    {
        if (empty($request->patient)) {
            $patients = $this->transformer->collection2(Patient::desc()->get());
        } else {
            $patients = $this->transformer->collection2(Patient::in($request->patient)->get());
        }

        return (new PatientsExport($patients))->download('patients.xlsx');
    }
}
