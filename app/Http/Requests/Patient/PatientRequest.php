<?php

namespace App\Http\Requests\Patient;

use Illuminate\Foundation\Http\FormRequest;

class PatientRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        $rules = [
            'names' => 'required|max:64',
            'surnames' => 'required|max:64',
            'birthdate' => 'required|date_format:Y-m-d',
            'course' => 'required|max:32',
            'phone' => 'nullable|min:6|max:32',
            'email' => 'nullable|email|max:64|unique:patients,email',
            'school_id' => 'required|integer',
            'people_id' => 'required|integer',
        ];

        if($this->method() == 'PATCH' || $this->method() == 'PUT') {
            $rules['email'] .= ',' . $this->patient->id;
        }

        return $rules;
    }

    public function attributes()
    {
        return [
            'names' => 'nombres',
            'surnames' => 'apellidos',
            'birthdate' => 'fecha nacimiento',
            'course' => 'curso',
            'phone' => 'teléfono',
            'email' => 'correo',
            'school_id' => 'colegio',
            'people_id' => 'tutor',
        ];
    }
}
