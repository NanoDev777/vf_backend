<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Traits\SecureDelete;

class People extends Model
{
    use SoftDeletes, SecureDelete, HasFactory;

    protected $dates = ['deleted_at'];

    protected $hidden = ['deleted_at'];

    protected $relationships = [
        'patients'
    ];

    protected $fillable = [
        'names', 'surnames', 'ci', 'phone', 'address', 'email', 'user_id', 'city_id'
    ];

    protected $appends = ['fullname'];

    public function getFullnameAttribute()
    {
        $fullname = $this->names." ".$this->surnames;
        return $fullname;
    }

    public function scopeFilter($query, $filters)
    {
        return $filters->apply($query);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function city()
    {
        return $this->belongsTo(City::class);
    }

    public function patients()
    {
        return $this->hasMany(Patient::class);
    }
}
