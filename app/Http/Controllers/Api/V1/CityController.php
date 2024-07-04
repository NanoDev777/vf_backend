<?php

namespace App\Http\Controllers\Api\V1;

use App\Models\City;
use Illuminate\Http\Request;

class CityController extends ApiController
{
    private $city;

    public function __construct(City $city)
    {
        $this->city = $city;
    }

    public function listing()
    {
        $cities = $this->city->listCities();
        return $this->respond($cities);
    }
}
