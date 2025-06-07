<?php

namespace App\Http\Controllers;

use App\Models\AboutSection;
use Illuminate\Http\Request;

class AboutSectionController extends Controller
{
    public function show()
    {
        return AboutSection::first();
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'judul' => 'required|string',
            'deskripsi_1' => 'nullable|string',
            'deskripsi_2' => 'nullable|string',
            'gambar_urls' => 'nullable|array',
            'gambar_urls.*' => 'url',
        ]);

        $section = AboutSection::first();
        if ($section) {
            $section->update($data);
        } else {
            $section = AboutSection::create($data);
        }

        return response()->json([
            'message' => 'Tentang sekolah berhasil disimpan.',
            'data' => $section,
        ]);
    }

    public function uploadImage(Request $request)
    {
        $request->validate([
            'image' => 'required|image|mimes:jpg,jpeg,png,webp|max:2048',
        ]);

        $file = $request->file('image');
        $path = $file->store('about-images', 'public');

        return response()->json([
            'url' => asset('storage/' . $path)
        ]);
    }

    public function public()
    {
        $about = AboutSection::first();
        return response()->json($about);
    }
}
