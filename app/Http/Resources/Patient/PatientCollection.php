<?php

namespace App\Http\Resources\Patient;

use Illuminate\Http\Resources\Json\ResourceCollection;
use App\Http\Resources\Patient\PatientResource;

class PatientCollection extends ResourceCollection
{
    public function toArray($request)
    {
        return [
            'data' => $this->collection->transform(function($patient){
                return new PatientResource($patient);
            }),
        ];
    }
}
