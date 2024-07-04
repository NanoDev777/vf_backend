<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Traits\SecureDelete;


class Therapist extends Model
{
    use SoftDeletes, SecureDelete, HasFactory;

    protected $dates = ['deleted_at'];

    protected $hidden = ['deleted_at'];

    protected $relationships = [
        'services'
    ];

    protected $fillable = [
        'names', 'surnames', 'ci', 'phone', 'address', 'status', 'user_id', 'profession_id'
    ];

    protected $appends = ['fullname'];

    public function getFullnameAttribute()
    {
        $fullname = $this->names." ".$this->surnames;
        return $fullname;
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function profession()
    {
        return $this->belongsTo(Profession::class);
    }

    public function services()
    {
        return $this->hasMany(Service::class);
    }
}
