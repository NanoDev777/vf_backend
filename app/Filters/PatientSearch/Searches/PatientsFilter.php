<?php

namespace App\Filters\PatientSearch\Searches;

class PatientsFilter extends Filter
{
    protected $filterKeys = [
        'names' => 'filterByNames',
    ];

    protected function filterByNames()
    {
        $this->builder = $this->builder->whereRaw("MATCH (names) AGAINST (? IN BOOLEAN MODE)" , fullTextWildcardsInitEnd($this->request->input('value')));
    }
}
