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
            'first_name' => 'required',
            'last_name ' => 'required',
            'phone' => 'required|unique:users',
            'document_number' => 'required|integer',
            'password  ' => 'required',
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
            return [
                    'data'=> [
                        'token' => $user->api_token,
                    ],
            ];

        }

    }
}
