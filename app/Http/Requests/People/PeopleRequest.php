<?php

namespace App\Http\Requests\People;

use Illuminate\Foundation\Http\FormRequest;

class PeopleRequest extends FormRequest
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
            'ci' => 'required|max:16|unique:people,ci',
            'phone' => 'required|min:6|max:32',
            'address' => 'nullable|max:128',
            'email' => 'required|email|max:64|unique:people,email',
            'city_id' => 'required|integer',
        ];

        if($this->method() == 'PATCH' || $this->method() == 'PUT') {
            $rules['ci'] .= ',' . $this->people->id;
            $rules['email'] .= ',' . $this->people->id;
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
            'email' => 'correo',
            'address' => 'dirección',
            'city_id' => 'ciudad',
        ];
    }
}
