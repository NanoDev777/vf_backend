<?php

namespace App\Http\Resources\People;

use Illuminate\Http\Resources\Json\JsonResource;

class PeopleEditResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'names' => $this->names,
            'surnames' => $this->surnames,
            'ci' => $this->ci,
            'email' => $this->email,
            'phone' => $this->phone,
            'address' => $this->address,
            'city' => $this->city,
        ];
    }
}
