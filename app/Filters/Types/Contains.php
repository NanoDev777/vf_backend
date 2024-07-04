<?php

namespace App\Filters\Types;

use Illuminate\Database\Eloquent\Builder;

class Contains implements TypeQuery
{
    public function search(Builder $builder, Array $data)
    {
    	if (strpos($data['value'], '-')) {
    		$data['value'] = str_replace("-", " ", $data['value']);
    	}

    	if ($data['field'] == 'number') {
    		$data['value'] = ltrim($data['value'], '0');
    	}

		// if ($data['field'] == 'location') {
		// 	return $builder->where('location', 'like', '%' . $data['value'] . '%');
    	// }

		// if ($data['field'] == 'location') {
		// 	return $builder->where('location', 'regexp', '[[:<:]]'.$data['value'].'[[:>:]]');
    	// }

        return $builder->whereRaw("MATCH ({$data['field']}) AGAINST (? IN BOOLEAN MODE)" , fullTextWildcardsInitEnd($data['value']));
    }
}
