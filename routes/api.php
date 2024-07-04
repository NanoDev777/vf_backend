<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\V1\AuthController;
use App\Http\Controllers\Api\V1\UserController;
use App\Http\Controllers\Api\V1\PeopleController;
use App\Http\Controllers\Api\V1\CityController;
use App\Http\Controllers\Api\V1\ProfessionController;
use App\Http\Controllers\Api\V1\PatientController;
use App\Http\Controllers\Api\V1\TherapistController;
use App\Http\Controllers\Api\V1\SchoolController;

Route::prefix('v1')->group(function () {
    Route::post('login', [AuthController::class, 'login']);
    Route::post('register', [AuthController::class, 'register']);

    Route::group(['middleware' => ['auth:sanctum']], function() {

        //Listas
        Route::get('cities/listing', [CityController::class, 'listing']);
        Route::get('professions/listing', [ProfessionController::class, 'listing']);

        Route::post('logout', [AuthController::class, 'logout']);
        Route::get('users', [UserController::class, 'index']);
        Route::post('upload/avatar', [UserController::class, 'uploadAvatar']);

        //Tutores
        Route::get('people', [PeopleController::class, 'index']);
        Route::get('people/search', [PeopleController::class, 'search']);
        Route::post('people', [PeopleController::class, 'store']);
        Route::get('people/{people}/edit', [PeopleController::class, 'edit']);
        Route::put('people/{people}', [PeopleController::class, 'update']);
        Route::delete('people', [PeopleController::class, 'destroy']);

        //Pacientes
        Route::get('patients', [PatientController::class, 'index']);
        Route::post('patients', [PatientController::class, 'store']);
        Route::get('patients/{patient}/edit', [PatientController::class, 'edit']);
        Route::put('patients/{patient}', [PatientController::class, 'update']);
        Route::delete('patients', [PatientController::class, 'destroy']);
        Route::post('patients/list-pdf', [PatientController::class, 'listPdf']);
        Route::post('patients/list-excel', [PatientController::class, 'listExcel']);

        //Terapistas
        Route::get('therapists', [TherapistController::class, 'index']);
        Route::post('therapists', [TherapistController::class, 'store']);
        Route::get('therapists/{therapist}/edit', [TherapistController::class, 'edit']);
        Route::put('therapists/{therapist}', [TherapistController::class, 'update']);
        Route::delete('therapists', [TherapistController::class, 'destroy']);

        //Colegios
        Route::get('schools/search', [SchoolController::class, 'search']);
        Route::post('schools', [SchoolController::class, 'store']);
    });
});
