<?php

namespace App\Http\Controllers;

use App\Models\Config;
use Illuminate\Http\Request;

class ConfigController extends Controller
{
    public function show()
    {
        return Config::first();
    }

    public function store(Request $request)
    {
        $request->validate([
            'nama_sekolah' => 'required',
            'alamat' => 'required',
            'email' => 'nullable|email',
        ]);

        $config = Config::first();

        if ($config) {
            $config->update($request->all());
        } else {
            $config = Config::create($request->all());
        }

        return response()->json([
            'message' => 'Pengaturan berhasil disimpan.',
            'data' => $config,
        ]);
    }
}
