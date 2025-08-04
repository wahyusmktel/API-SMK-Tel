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
        Schema::create('comments', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->foreignUuid('berita_id')->constrained('beritas')->onDelete('cascade');
            $table->foreignUuid('parent_id')->nullable()->constrained('comments')->onDelete('cascade');
            $table->string('nama');
            $table->string('email');
            $table->text('konten');
            $table->boolean('is_approved')->default(true); // Defaultnya langsung tampil
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('comments');
    }
};
