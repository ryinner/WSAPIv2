<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\FlightController;
use App\Http\Controllers\BookingController;
use App\Http\Controllers\AirportsController;
use App\Http\Controllers\RegisterController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/register', [RegisterController::class, 'register']);

Route::post('/login', [LoginController::class, 'login']);

Route::get('/tour', [AirportsController::class, 'tour']);

Route::get('/flight', [FlightController::class, 'flight']);

Route::post('/booking', [BookingController::class, 'booking']);

Route::get('/booking/{code}', [BookingController::class, 'showBooking']);

Route::get('/user/booking', [UserController::class, 'showUserBooking']);

Route::get('/user', [UserController::class, 'user']);