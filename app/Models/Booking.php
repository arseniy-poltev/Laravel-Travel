<?php

namespace App\Models;

use App\User;
use Backpack\CRUD\CrudTrait;
use Illuminate\Database\Eloquent\Model;

class Booking extends Model
{
    use CrudTrait;

    protected $fillable = ['user_id', 'holiday_id', 'start_date', 'end_date'];

    protected $table = 'booking';

    public function user()
    {
        return $this->belongsTo(BackpackUser::class);
    }

    public function holiday()
    {
        return $this->belongsTo(Holidays::class, 'holiday_id', 'id');
    }
}
