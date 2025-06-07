<?php

namespace Database\Seeders;

use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // User::factory(10)->create();

        User::create([
            'id' => Str::uuid(),
            'name' => 'Admin SMK',
            'email' => 'admin@smktelkomlampung.sch.id',
            'password' => Hash::make('admin123'), // password bisa kamu ubah
        ]);
    }
}
