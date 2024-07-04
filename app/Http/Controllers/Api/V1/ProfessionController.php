<?php

namespace App\Http\Controllers\Api\V1;

use App\Models\Profession;
use Illuminate\Http\Request;

class ProfessionController extends ApiController
{
    private $profession;

    public function __construct(Profession $profession)
    {
        $this->profession = $profession;
    }

    public function listing()
    {
        $professions = $this->profession->listProfessions();
        return $this->respond($professions);
    }
}
