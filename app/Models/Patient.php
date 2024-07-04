<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Traits\SecureDelete;

class Patient extends Model
{
    use SoftDeletes, SecureDelete, HasFactory;

    protected $dates = ['deleted_at'];

    protected $hidden = ['deleted_at'];

    protected $relationships = [
        'services'
    ];

    protected $fillable = [
        'names', 'surnames', 'birthdate', 'course', 'phone', 'email', 'status', 'school_id', 'people_id'
    ];

    protected $appends = ['fullname'];

    public function getFullnameAttribute()
    {
        $fullname = $this->names." ".$this->surnames;
        return $fullname;
    }

    public function scopeDesc($query)
    {
        return $query->orderBy('id', 'DESC');
    }

    public function scopeIn($query, $patients)
    {
        return $query->whereIn('id', $patients);
    }

    public function school()
    {
        return $this->belongsTo(School::class);
    }

    public function people()
    {
        return $this->belongsTo(People::class);
    }

    public function services()
    {
        return $this->hasMany(Service::class);
    }
}
