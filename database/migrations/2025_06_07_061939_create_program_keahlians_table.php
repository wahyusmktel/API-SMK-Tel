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
        Schema::create('program_keahlians', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->string('judul_program_keahlian');
            $table->string('sub_judul')->nullable();
            $table->string('icon_url')->nullable();
            $table->text('deskripsi')->nullable();
            $table->text('yang_dipelajari')->nullable();
            $table->text('prospek_karir')->nullable();
            $table->string('warna_header')->nullable();
            $table->boolean('status')->default(true);
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('program_keahlians');
    }
};
