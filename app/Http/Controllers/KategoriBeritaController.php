<?php

namespace App\Http\Controllers;

use App\Models\KategoriBerita;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class KategoriBeritaController extends Controller
{
    /**
     * Menampilkan semua kategori.
     */
    public function index()
    {
        return response()->json(KategoriBerita::orderBy('nama_kategori')->get());
    }

    /**
     * Menyimpan kategori baru.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'nama_kategori' => 'required|string|max:255|unique:kategori_beritas,nama_kategori',
        ]);

        $validated['slug'] = Str::slug($validated['nama_kategori']);

        $kategori = KategoriBerita::create($validated);
        return response()->json($kategori, 201);
    }

    /**
     * Memperbarui kategori yang ada.
     */
    public function update(Request $request, $id)
    {
        $kategori = KategoriBerita::findOrFail($id);

        $validated = $request->validate([
            'nama_kategori' => 'required|string|max:255|unique:kategori_beritas,nama_kategori,' . $kategori->id,
        ]);

        $validated['slug'] = Str::slug($validated['nama_kategori']);

        $kategori->update($validated);
        return response()->json($kategori);
    }

    /**
     * Menghapus kategori.
     */
    public function destroy($id)
    {
        $kategori = KategoriBerita::findOrFail($id);

        // Pastikan tidak ada berita yang menggunakan kategori ini sebelum menghapus jika diperlukan
        // if ($kategori->beritas()->count() > 0) {
        //     return response()->json(['message' => 'Kategori tidak dapat dihapus karena masih digunakan oleh berita.'], 409);
        // }

        $kategori->delete();
        return response()->json(['message' => 'Kategori berhasil dihapus']);
    }
}
