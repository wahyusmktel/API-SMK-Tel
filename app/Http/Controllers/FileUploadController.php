<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class FileUploadController extends Controller
{
    public function store(Request $request)
    {
        $request->validate([
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        // Simpan gambar di dalam folder 'storage/app/public/images'
        // dan dapatkan path relatifnya.
        $path = $request->file('image')->store('images', 'public');

        // Kembalikan URL lengkap ke gambar yang baru diunggah.
        return response()->json([
            'url' => url(Storage::url($path)) // Gunakan helper url() untuk membuat URL absolut
        ]);
    }
}
