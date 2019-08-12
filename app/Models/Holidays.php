<?php

namespace App\Models;

use App\User;
use Backpack\CRUD\CrudTrait;
use Illuminate\Database\Eloquent\Model;

class Holidays extends Model
{
    use CrudTrait;

    protected $table = 'holidays';
    protected $fillable = ['name', 'location_id', 'city', 'hotel', 'wifi', 'car_rental'];

    public function location()
    {
        return $this->belongsTo('App\Models\Locations');
    }

    public function users()
    {
        return $this->belongsToMany(BackpackUser::class, 'booking', 'holiday_id', 'user_id');
    }

    public function books()
    {
        return $this->hasMany(Booking::class, 'holiday_id', 'id');
    }
}
