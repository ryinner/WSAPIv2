<?php

namespace App\Http\Controllers;

use App\Models\Booking;
use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function showUserBooking(Request $request)
    {
        $bearer = $request->bearerToken();
        $user = User::where('api_token',$bearer)->first();

        if (empty($user)) {

            return response()->json([
                'error' => [
                    'code' => 401,
                    'message' => 'Unauthorized'
                ]
            ], 401);

        } else {

            $bookings = Booking::whereHas('passanger', function ($query) use ($user) {
                $query->where('document_number', '=' ,$user->document_number);
            })->get();
    
            $bookingsParsed = [];
    
            foreach($bookings as $booking) {
                $flight = $booking->from;
                $passanger = $booking->passanger;
                $parsedPassangers = [];
    
                foreach ($passanger as $value) {
                    $parsedPassangers[] = [
                        'id'              => $value['id'],
                        'first_name'      => $value['first_name'],
                        'last_name'       => $value['last_name'],
                        'birth_date'      => $value['birth_date'],
                        'document_number' => $value['document_number'],
                    ];
                }
    
                $bookingsParsed[] = [
                                        'id'   => $booking->id,
                                        'name' => $flight->from->city . '-' . $flight->to->city,
                                        'from' => [
                                            'country' => $flight->from->country,
                                            'city'    => $flight->from->city,
                                        ],
                                        'to' => [
                                            'city'    => $flight->to->city,
                                            'airport' => $flight->to->airport,
                                        ],
                                        'start_date' => [
                                            'date'   => $flight->booking->date_from,
                                            'time'   => $flight->time_from,
                                        ],
                                        'end_date'   => [
                                            'date'   => $flight->booking->date_back,
                                            'time'   => $flight->time_to,
                                        ],
                                        'cost'  => $flight->cost,
                                        'tourists' => $parsedPassangers
                                    ]
                                ;
            }
    
            return response()->json([
                "data" => $bookingsParsed
            ]);
        }

    }

    public function user(Request $request)
    {
        $bearer = $request->bearerToken();
        $user = User::where('api_token',$bearer)->first();

        if (empty($user)) {

            return response()->json([
                'error' => [
                    'code' => 401,
                    'message' => 'Unauthorized'
                ]
            ], 401);

        } else {

            return response()->json([
                'first_name'      => $user->first_name,
                'last_name'       => $user->last_name,
                'phone'           => $user->phone,
                'document_number' => $user->document_number
            ]);

        }
    }
}
