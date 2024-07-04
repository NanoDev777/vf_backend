<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Traits\SecureDelete;

class Service extends Model
{
    use SoftDeletes, SecureDelete, HasFactory;

    protected $dates = ['deleted_at'];

    protected $hidden = ['deleted_at'];

    public function patient()
    {
        return $this->belongsTo(Patient::class);
    }
}
