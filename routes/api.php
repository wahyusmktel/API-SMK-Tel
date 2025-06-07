<?php

use App\Http\Controllers\AboutSectionController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ConfigController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProgramKeahlianController;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::post('/login', [AuthController::class, 'login']);
Route::middleware('auth:sanctum')->post('/logout', [AuthController::class, 'logout']);

Route::middleware('auth:sanctum')->group(function () {
    Route::get('/config', [ConfigController::class, 'show']);
    Route::post('/config', [ConfigController::class, 'store']);

    Route::get('/about', [AboutSectionController::class, 'show']);
    Route::post('/about', [AboutSectionController::class, 'store']);
    Route::post('/upload-about-image', [AboutSectionController::class, 'uploadImage']);

    Route::get('/program-keahlian', [ProgramKeahlianController::class, 'index']);
    Route::post('/program-keahlian', [ProgramKeahlianController::class, 'store']);
    Route::get('/program-keahlian/{id}', [ProgramKeahlianController::class, 'show']);
    Route::put('/program-keahlian/{id}', [ProgramKeahlianController::class, 'update']);
    Route::delete('/program-keahlian/{id}', [ProgramKeahlianController::class, 'destroy']);
});

Route::prefix('public')->group(function () {
    Route::get('/about', [AboutSectionController::class, 'public']);
    // Route publik lainnya
});
