<?php

namespace App\Http\Controllers;

use App\Models\Flight;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;

class FlightController extends Controller
{
    public function flight(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'from'       => 'required|integer|exists:flights,from_id',
            'to'         => 'required|integer|exists:flights,to_id',
            'date1'      => 'required|date|exists:bookings,date_from',
            'date2'      => 'required|date|exists:bookings,date_back',
            'passengers' => 'required|integer|between:1,8'
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

            $flight = Flight::where('from_id', $request->from)->where('to_id', $request->to)->with('booking')->whereHas('booking', function ($query) use ($request) {
                $query->where('date_from', $request->date1)->where('date_back', $request->date2);
            })->first();
            return response()->json(
                [
                    'data' => [
                        'id' => $flight->id,
                        'name' => $flight->from->city.'-'.$flight->to->city,
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
                        'cost'  => $flight->cost
                    ]
                ]
            );
        }


    }
    
}
