<?php

namespace App\Http\Controllers;

use App\Models\Booking;
use App\Models\Passenger;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class BookingController extends Controller
{
    public function booking(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'tour_id'                    => 'required|integer|exists:flights,id',
            'tourists'                   => 'required|array',
            'tourists.*.first_name'      => 'required|string',
            'tourists.*.last_name'       => 'required|string',
            'tourists.*.birth_date'      => 'required|date',
            'tourists.*.document_number' => 'required|numeric|regex:/^([0-9.]{10})+$/',
        ]);

        if ($validator->fails()) {
            
            return response()->json([
                'error' => [
                    'code' => 422,
                    'message' => 'Validation error',
                    'errors' => $validator->errors()
                ]
            ], 422,  ['application/json']);

        } else {

            $booking = Booking::where('flight_from',$request->tour_id)->withCount('passanger')->having('passanger_count', '>=', 8)->first();

            if (!empty($booking)) {
                
                return response()->json([
                    'error' => [
                        'code' => 421,
                        'message' => 'Too much peoples',
                        'errors' => "[Count: Too much peoples]"
                    ]
                ], 421,  ['application/json']);

            } else {

                $code = $this->createCode(5);
                $booking = new Booking;
                $booking->flight_from = $request->tour_id;
                $booking->date_from = $request->date_from;
                $booking->code = $code;
                $booking->save();

                $tourists = $request->tourists;
                
                for ($i=0;$i<count($tourists);$i++) {
                    array_push($tourists[$i],['booking_id' => $booking->id]);
                }

                $booking->passanger()->createMany($tourists);

                return response()->json([
                    'data' => [
                        'booking_id' => $booking->id,
                    ]
                ]);

            }

        }

    }

    public function createCode(int $count)
    {
        $code = '';

        for ($i=0;$i<$count;$i++) {
            $code .= rand(0,9);
        }

        return $code;
    }
}
