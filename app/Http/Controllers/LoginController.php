<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class LoginController extends Controller
{
    public function login(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'phone'             => 'required|integer',
            'password'          => 'required|string',
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

            $user = User::where('phone', $request->phone)->first();

            if ($user && $request->password == $user->password) {
                
                $_SESSION['token'] = $user->api_token;

                return response()->json([ 
                    'data' => [
                        'token' => $user->api_token
                    ]
                ]);    

            } else {

                return response()->json([
                    'error' => [
                        'code'      => 401,
                        'message'   => "Unauthorized",
                        "errors"    => [
                            "phone"     => ["phone or password incorrect"]
                        ]
                    ]
                ],401, ['application/json']);

            }

        }
    }
}
