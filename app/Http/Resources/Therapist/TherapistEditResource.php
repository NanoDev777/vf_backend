<?php

namespace App\Http\Resources\Therapist;

use Illuminate\Http\Resources\Json\JsonResource;

class TherapistEditResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'names' => $this->names,
            'surnames' => $this->surnames,
            'ci' => $this->ci,
            'phone' => $this->phone,
            'address' => $this->address,
            'profession' => $this->profession
        ];
    }
}
