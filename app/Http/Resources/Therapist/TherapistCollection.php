<?php

namespace App\Http\Resources\Therapist;

use Illuminate\Http\Resources\Json\ResourceCollection;
use App\Http\Resources\Therapist\TherapistResource;

class TherapistCollection extends ResourceCollection
{
    public function toArray($request)
    {
        return [
            'data' => $this->collection->transform(function($therapist){
                return new TherapistResource($therapist);
            }),
        ];
    }
}
