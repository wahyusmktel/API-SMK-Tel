<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('about_sections', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->text('judul');
            $table->longText('deskripsi_1')->nullable();
            $table->longText('deskripsi_2')->nullable();
            $table->json('gambar_urls')->nullable(); // simpan array gambar dalam format JSON
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('about_sections');
    }
};
