<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Profession extends Model
{
    use HasFactory;

    public static function listProfessions()
    {
        return static::orderBy('id', 'DESC')->select('id', 'name')->get();
    }
}
