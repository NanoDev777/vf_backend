<?php

namespace App\Http\Resources\Patient;

use Illuminate\Http\Resources\Json\JsonResource;

class PatientEditResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'names' => $this->names,
            'surnames' => $this->surnames,
            'birthdate' => $this->birthdate,
            'course' => $this->course,
            'phone' => $this->phone,
            'email' => $this->email,
            'school' => $this->school,
            'people' => $this->people,
        ];
    }
}
