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
        Schema::create('beritas', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->string('judul');
            $table->string('slug')->unique(); // URL-friendly, penting untuk SEO
            $table->longText('konten'); // Untuk menyimpan isi artikel (HTML dari editor)
            $table->string('gambar_utama')->nullable(); // URL gambar utama artikel
            $table->enum('status', ['published', 'draft'])->default('draft');

            // Kolom untuk SEO
            $table->string('meta_judul')->nullable();
            $table->text('meta_deskripsi')->nullable();
            $table->string('tags')->nullable(); // Simpan sebagai comma-separated string

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('beritas');
    }
};
