<?php

namespace App\Http\Controllers;

use App\Models\Berita;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;

class BeritaController extends Controller
{
    /**
     * Mengambil semua berita, termasuk data kategorinya.
     */
    public function index()
    {
        // Menggunakan with('kategori') untuk mengambil data relasi
        return response()->json(Berita::with(['kategori', 'author'])->orderBy('created_at', 'desc')->get());
    }

    /**
     * Menyimpan berita baru.
     */
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
            // Menambahkan validasi untuk kategori
            'kategori_berita_id' => 'nullable|exists:kategori_beritas,id',
        ]);

        $validated['user_id'] = Auth::id();
        $validated['slug'] = Str::slug($validated['judul']) . '-' . uniqid();

        $berita = Berita::create($validated);
        // Memuat relasi kategori setelah dibuat
        $berita->load('kategori', 'author');
        return response()->json($berita, 201);
    }

    /**
     * Menampilkan satu berita.
     */
    public function show($id)
    {
        $berita = Berita::with('kategori', 'author')->findOrFail($id);
        return response()->json($berita);
    }

    /**
     * Memperbarui berita.
     */
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
            // Menambahkan validasi untuk kategori
            'kategori_berita_id' => 'nullable|exists:kategori_beritas,id',
        ]);

        if ($request->has('judul') && $berita->judul !== $request->judul) {
            $validated['slug'] = Str::slug($validated['judul']) . '-' . $berita->id;
        }

        $berita->update($validated);
        $berita->load('kategori', 'author');
        return response()->json($berita);
    }

    /**
     * Menghapus berita.
     */
    public function destroy($id)
    {
        $berita = Berita::findOrFail($id);
        $berita->delete();

        return response()->json(['message' => 'Berita berhasil dihapus']);
    }

    /**
     * Endpoint untuk publik.
     */
    public function publik()
    {
        return response()->json(
            Berita::with('kategori', 'author')->where('status', 'published')->orderBy('created_at', 'desc')->get()
        );
    }
}
