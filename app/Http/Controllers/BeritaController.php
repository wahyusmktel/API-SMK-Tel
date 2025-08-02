<?php

namespace App\Http\Controllers;

use App\Models\Berita;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class BeritaController extends Controller
{
    // Mengambil semua berita (untuk admin)
    public function index()
    {
        return response()->json(Berita::orderBy('created_at', 'desc')->get());
    }

    // Menyimpan berita baru
    public function store(Request $request)
    {
        $validated = $request->validate([
            'judul' => 'required|string|max:255',
            'konten' => 'required|string',
            'gambar_utama' => 'nullable|url',
            'status' => 'required|in:published,draft',
            'meta_judul' => 'nullable|string|max:255',
            'meta_deskripsi' => 'nullable|string|max:160',
            'tags' => 'nullable|string',
        ]);

        // Membuat slug unik dari judul
        $validated['slug'] = Str::slug($validated['judul']) . '-' . uniqid();

        $berita = Berita::create($validated);
        return response()->json($berita, 201);
    }

    // Menampilkan satu berita
    public function show($id)
    {
        $berita = Berita::findOrFail($id);
        return response()->json($berita);
    }

    // Memperbarui berita
    public function update(Request $request, $id)
    {
        $berita = Berita::findOrFail($id);

        $validated = $request->validate([
            'judul' => 'sometimes|required|string|max:255',
            'konten' => 'sometimes|required|string',
            'gambar_utama' => 'nullable|url',
            'status' => 'sometimes|required|in:published,draft',
            'meta_judul' => 'nullable|string|max:255',
            'meta_deskripsi' => 'nullable|string|max:160',
            'tags' => 'nullable|string',
        ]);

        // Jika judul diubah, buat slug baru
        if ($request->has('judul')) {
            $validated['slug'] = Str::slug($validated['judul']) . '-' . $berita->id;
        }

        $berita->update($validated);
        return response()->json($berita);
    }

    // Menghapus berita
    public function destroy($id)
    {
        $berita = Berita::findOrFail($id);
        $berita->delete();

        return response()->json(['message' => 'Berita berhasil dihapus']);
    }

    // Endpoint untuk publik (hanya menampilkan berita yang published)
    public function publik()
    {
        return response()->json(
            Berita::where('status', 'published')->orderBy('created_at', 'desc')->get()
        );
    }
}
