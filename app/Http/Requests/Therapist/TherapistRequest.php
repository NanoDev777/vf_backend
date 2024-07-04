<?php

namespace App\Http\Requests\Therapist;

use Illuminate\Foundation\Http\FormRequest;

class TherapistRequest extends FormRequest
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
            'ci' => 'required|max:16|unique:therapists,ci',
            'phone' => 'required|min:6|max:32',
            'address' => 'nullable|max:128',
            'profession_id' => 'required|integer',
        ];

        if($this->method() == 'PATCH' || $this->method() == 'PUT') {
            $rules['ci'] .= ',' . $this->therapist->id;
        }

        return $rules;
    }

    public function attributes()
    {
        return [
            'names' => 'nombres',
            'surnames' => 'apellidos',
            'ci' => 'ci',
            'phone' => 'teléfono',
            'address' => 'dirección',
            'profession_id' => 'profesión',
        ];
    }
}
