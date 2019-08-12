<?php

namespace App\Models;

use Backpack\CRUD\CrudTrait;
use Illuminate\Database\Eloquent\Model;

class Locations extends Model
{
    use CrudTrait;

    protected $table = 'locations';
    protected $fillable = ['name'];

    public function holiday()
    {
        return $this->hasMany('App\Models\Holidays');
    }
}
