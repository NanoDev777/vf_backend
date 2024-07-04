<?php

namespace App\Http\Resources\People;

use Illuminate\Http\Resources\Json\ResourceCollection;
use App\Http\Resources\People\PeopleResource;

class PeopleCollection extends ResourceCollection
{
    public function toArray($request)
    {
        return [
            'data' => $this->collection->transform(function($people){
                return new PeopleResource($people);
            }),
        ];
    }
}
