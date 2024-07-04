<?php

namespace App\Transformers;
use Carbon\Carbon;

class PatientTransformer extends Transformer
{
    protected $resourceName = 'patients';

    protected $levels = [
        ['title' => 'Nidito', 'value' => 1],
        ['title' => 'Pre - Kinder', 'value' => 2],
        ['title' => 'Kinder', 'value' => 3],
        ['title' => '1º Primaria', 'value' => 4],
        ['title' => '2º Primaria', 'value' => 5],
        ['title' => '3º Primaria', 'value' => 6],
        ['title' => '4º Primaria', 'value' => 7],
        ['title' => '5º Primaria', 'value' => 8],
        ['title' => '6º Primaria', 'value' => 9],
        ['title' => '1º Secundaria', 'value' => 10],
        ['title' => '2º Secundaria', 'value' => 11],
        ['title' => '3º Secundaria', 'value' => 12],
        ['title' => '4º Secundaria', 'value' => 13],
        ['title' => '5º Secundaria', 'value' => 14],
        ['title' => '6º Secundaria', 'value' => 15],
    ];

    public function getTitleByValue($value, $levels) {
        foreach ($levels as $level) {
            if ($level['value'] == $value) {
                return $level['title'];
            }
        }
        return null;
    }

    public function transform($data)
    {
        switch ($data['status']) {
            case 0:
                $status = "INACTIVO";
                break;
            case 1:
                $status = "ACTIVO";
                break;
            default:
                $status = "INACTIVO";
        };

        return [
            'id' => $data['id'],
            'names' => $data['names'],
            'surnames' => $data['surnames'],
            'birthdate' => Carbon::parse($data['birthdate'])->format('d/m/Y'),
            'school' => $data['school']['name'],
            'course' => $this->getTitleByValue($data['course'], $this->levels),
            'phone' => $data['phone'],
            'status' => $status,
        ];
    }

    public function listTransform($data)
    {
        switch ($data['status']) {
            case 0:
                $status = "INACTIVO";
                break;
            case 1:
                $status = "ACTIVO";
                break;
            default:
                $status = "INACTIVO";
        };

        return [
            'names' => $data['names'],
            'surnames' => $data['surnames'],
            'birthdate' => Carbon::parse($data['birthdate'])->format('d/m/Y'),
            'school' => $data['school']['name'],
            'course' => $this->getTitleByValue($data['course'], $this->levels),
            'phone' => $data['phone'],
            'parent' => $data['people']['fullname'],
            'status' => $status,
        ];
    }
}
