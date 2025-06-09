<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void {
        Schema::create('hero_slides', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->string('title');
            $table->string('subtitle')->nullable();
            $table->string('image'); // path gambar
            $table->integer('order')->default(0); // urutan slide
            $table->boolean('status')->default(true); // aktif / nonaktif
            $table->timestamps();
        });
    }

    public function down(): void {
        Schema::dropIfExists('hero_slides');
    }
};
