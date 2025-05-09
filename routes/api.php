<?php

use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\LaporanPajakBulananController;
use App\Http\Controllers\Api\WajibPajakController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


Route::post('/login', [AuthController::class, 'login']);
Route::post('/register', [AuthController::class, 'register']);
Route::middleware('auth:sanctum')->group(function () {
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::get('/user', [AuthController::class, 'user']);
    Route::post('/lengkapi-wp', [WajibPajakController::class, 'lengkapiWP']);
    Route::get('/laporan-pajak', [LaporanPajakBulananController::class, 'index']);
    Route::post('/laporan-pajak', [LaporanPajakBulananController::class, 'store']);
    Route::get('/laporan-pajak/{id}', [LaporanPajakBulananController::class, 'show']);
    Route::put('/laporan-pajak/{id}', [LaporanPajakBulananController::class, 'update']);
    Route::delete('/laporan-pajak/{id}', [LaporanPajakBulananController::class, 'destroy']);
});



Route::get('email/verify/{id}', [AuthController::class, 'verify'])->name('verification.verify');
