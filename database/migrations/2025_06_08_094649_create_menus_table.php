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
        Schema::create('menus', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->string('name');
            $table->string('slug')->unique(); // contoh: /profile, /news
            $table->string('icon')->nullable(); // untuk lucide-react icon
            $table->foreignUuid('parent_id')->nullable()->constrained('menus')->onDelete('cascade'); // mendukung submenu
            $table->integer('order')->default(0);
            $table->boolean('status')->default(true); // aktif/tidak
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('menus');
    }
};
