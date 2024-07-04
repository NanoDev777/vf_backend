<?php

namespace App\Http\Resources\Patient;

use Illuminate\Http\Resources\Json\JsonResource;
use Carbon\Carbon;

class PatientResource extends JsonResource
{
    public function toArray($request)
    {
        $courses = [
            1 => 'Nidito',
            2 => 'Pre - Kinder',
            3 => 'Kinder',
            4 => '1º Primaria',
            5 => '2º Primaria',
            6 => '3º Primaria',
            7 => '4º Primaria',
            8 => '5º Primaria',
            9 => '6º Primaria',
            10 => '1º Secundaria',
            11 => '2º Secundaria',
            12 => '3º Secundaria',
            13 => '4º Secundaria',
            14 => '5º Secundaria',
            15 => '6º Secundaria',
        ];

        return [
            'id' => $this->id,
            'names' => $this->names,
            'surnames' => $this->surnames,
            'birthdate' => Carbon::parse($this->birthdate)->format('d/m/Y'),
            'school' => $this->school->name,
            'course' => $courses[$this->course],
            'phone' => $this->phone,
            'email' => $this->email,
        ];
    }
}
