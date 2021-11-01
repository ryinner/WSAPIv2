<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Booking extends Model
{
    use HasFactory;

    public function from()
    {
        return $this->hasOne(Flight::class, 'id', 'flight_from');
    }

    public function to()
    {
        return $this->hasOne(Flight::class, 'id', 'flight_back');
    }

    public function passanger()
    {
        return $this->hasMany(Passenger::class);
    }
}
