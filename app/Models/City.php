<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class City extends Model
{
    use HasFactory;

    public static function listCities()
    {
        return static::orderBy('id', 'DESC')->select('id', 'description')->get();
    }
}
