<?php

namespace App\Http\Controllers;

use App\Models\Berita;
use App\Models\Comment;
use Illuminate\Http\Request;

class CommentController extends Controller
{
    /**
     * Mengambil semua komentar untuk sebuah berita.
     */
    public function index($berita_id)
    {
        // Ambil hanya komentar utama (yang tidak punya parent_id)
        // dan muat relasi 'replies' secara rekursif
        $comments = Comment::where('berita_id', $berita_id)
            ->whereNull('parent_id')
            ->where('is_approved', true)
            ->with('replies')
            ->orderBy('created_at', 'desc')
            ->get();

        return response()->json($comments);
    }

    /**
     * Menyimpan komentar baru.
     */
    public function store(Request $request, $berita_id)
    {
        $request->validate([
            'nama' => 'required|string|max:255',
            'email' => 'required|email|max:255',
            'konten' => 'required|string',
            'parent_id' => 'nullable|exists:comments,id',
        ]);

        // Pastikan berita ada sebelum menyimpan komentar
        $berita = Berita::findOrFail($berita_id);

        $comment = $berita->comments()->create([
            'nama' => $request->nama,
            'email' => $request->email,
            'konten' => $request->konten,
            'parent_id' => $request->parent_id,
        ]);

        return response()->json($comment, 201);
    }

    /**
     * Menambahkan suka ke sebuah komentar.
     */
    public function like($comment_id)
    {
        $comment = Comment::findOrFail($comment_id);
        $comment->increment('likes'); // Menambah 1 ke kolom likes
        return response()->json($comment);
    }
}
