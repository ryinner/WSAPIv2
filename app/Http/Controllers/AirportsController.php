<?php

namespace App\Http\Controllers;

use App\Models\Airport;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class AirportsController extends Controller
{
    public function tour(Request $request)
    {

        $validator = Validator::make($request->all(),[
            'query'   => 'required|string'
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
            $query = $request->get('query');
            $airport = Airport::select('country','city')->where('country', $query)->orWhere('city', 'LIKE', '%'.$query.'%')->orWhere('iata', $query)->get();
            
            return response()->json([
                'data' => [
                    'items' => $airport
                ]
            ]);
        }

    }
}
