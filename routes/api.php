<?php

use App\Http\Controllers\AboutSectionController;
use App\Http\Controllers\Admin\HeroSlideController;
use App\Http\Controllers\Admin\MenuController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ConfigController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProgramKeahlianController;
use App\Http\Controllers\Public\HeroSlidePublicController;
use App\Http\Controllers\BeritaController;
use App\Http\Controllers\FileUploadController;
use App\Http\Controllers\KategoriBeritaController;

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

    // == TAMBAHKAN ROUTE DI BAWAH INI ==
    Route::get('/berita', [BeritaController::class, 'index']);
    Route::post('/berita', [BeritaController::class, 'store']);
    Route::get('/berita/{id}', [BeritaController::class, 'show']);
    Route::post('/berita/{id}', [BeritaController::class, 'update']); // Gunakan POST untuk update karena form data
    Route::delete('/berita/{id}', [BeritaController::class, 'destroy']);

    // Route untuk Kategori Berita
    Route::get('/kategori-berita', [KategoriBeritaController::class, 'index']);
    Route::post('/kategori-berita', [KategoriBeritaController::class, 'store']);
    Route::put('/kategori-berita/{id}', [KategoriBeritaController::class, 'update']);
    Route::delete('/kategori-berita/{id}', [KategoriBeritaController::class, 'destroy']);

    Route::post('/upload-image', [FileUploadController::class, 'store']);
});

// Admin
Route::middleware(['auth:sanctum'])->group(function () {
    Route::get('/hero-slides', [HeroSlideController::class, 'index']);
    Route::post('/hero-slides', [HeroSlideController::class, 'store']);
    Route::put('/hero-slides/{id}', [HeroSlideController::class, 'update']);
    Route::delete('/hero-slides/{id}', [HeroSlideController::class, 'destroy']);
});

Route::prefix('public')->group(function () {
    Route::get('/about', [AboutSectionController::class, 'public']);
    Route::get('/program-keahlian', [ProgramKeahlianController::class, 'publik']);
    Route::get('/hero-slides', [HeroSlidePublicController::class, 'index']);
    // Route publik lainnya

    // == TAMBAHKAN ROUTE PUBLIK DI BAWAH INI ==
    Route::get('/berita', [BeritaController::class, 'publik']);

    Route::get('/berita/{slug}', [BeritaController::class, 'showBySlug']);
    Route::get('/berita/{slug}/related', [BeritaController::class, 'getRelated']);
});


Route::prefix('admin')->middleware('auth:sanctum')->group(function () {
    Route::get('/menus', [MenuController::class, 'index']);
    Route::post('/menus', [MenuController::class, 'store']);
    Route::post('/menus/{id}', [MenuController::class, 'update']); // menggunakan _method PUT
    Route::delete('/menus/{id}', [MenuController::class, 'destroy']);
});

// Endpoint publik (tanpa middleware)
Route::get('/public/menus', function () {
    return \App\Models\Menu::with('children')->whereNull('parent_id')->orderBy('order')->get();
});
