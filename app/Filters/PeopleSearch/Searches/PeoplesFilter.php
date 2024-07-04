<?php

namespace App\Filters\PeopleSearch\Searches;

class PeoplesFilter extends Filter
{
    protected $filterKeys = [
        'names' => 'filterByNames',
    ];

    protected function filterByNames()
    {
        $this->builder = $this->builder->whereRaw("MATCH (names, surnames) AGAINST (? IN BOOLEAN MODE)" , fullTextWildcardsInitEnd($this->request->input('value')));
    }
}
