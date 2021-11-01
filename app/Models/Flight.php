<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Flight extends Model
{
    use HasFactory;

    public function from()
    {
        return $this->hasOne(Airport::class, 'id', 'from_id');
    }

    public function to()
    {
        return $this->hasOne(Airport::class, 'id', 'to_id');
    }

    public function booking()
    {
        return $this->belongsTo(Booking::class, 'id', 'flight_from');
    }

}
