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
        Schema::table('beritas', function (Blueprint $table) {
            $table->uuid('kategori_berita_id')->nullable()->after('id');

            $table->foreign('kategori_berita_id')
                ->references('id')
                ->on('kategori_beritas')
                ->onDelete('set null'); // Jika kategori dihapus, kolom ini jadi null
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('beritas', function (Blueprint $table) {
            $table->dropForeign(['kategori_berita_id']);
            $table->dropColumn('kategori_berita_id');
        });
    }
};
