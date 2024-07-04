<?php

namespace App\Http\Controllers\Api\V1;

use App\Models\School;
use Illuminate\Http\Request;
use App\Filters\SchoolSearch\Searches\SchoolsFilter;

class SchoolController extends ApiController
{
    private $school;

    public function __construct(School $school)
    {
        $this->school = $school;
    }

    public function search(SchoolsFilter $filters)
    {
        $schools = $this->school->filter($filters)->get();
        return $this->respond($schools);
    }

    public function store(Request $request)
    {
        $school = $this->school->create([
            'name' => $request->name
        ]);

        return $this->respondCreated($school);
    }
}
