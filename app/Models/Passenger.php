<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Passenger extends Model
{
    use HasFactory;

    protected $fillable = ['first_name', 'last_name', 'birth_date', 'document_number'];

    public function booking()
    {
        return $this->belongsTo(Booking::class);
    }
}
