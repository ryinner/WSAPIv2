<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class RegisterController extends Controller
{
    public function register(Request $request)
    {
        
        // return var_dump($request->all());

        $validator = Validator::make($request->all(),[
            'first_name'        => 'required|string',
            'last_name'         => 'required|string',
            'phone'             => 'required|unique:users|numeric',
            'document_number'   => 'required|numeric',
            'password'          => 'required|string',
        ]);

        if ($validator->fails()) {

            return [
                'error' => [
                    'code' => 422,
                    'message' => 'Validation error',
                    'errors' => $validator->errors()
                ]
            ];

        } else {

            $user = new User($request->all());
            $user->api_token = rand();
            $user->save();
            return [
                    'data'=> [
                        'token' => $user->api_token,
                    ],
            ];

        }

    }
}
