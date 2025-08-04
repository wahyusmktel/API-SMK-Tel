<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class Berita extends Model
{
    use HasFactory;

    protected $table = 'beritas';
    public $incrementing = false;
    protected $keyType = 'string';

    protected $fillable = [
        'judul',
        'slug',
        'konten',
        'gambar_utama',
        'status',
        'meta_judul',
        'meta_deskripsi',
        'tags',
        'kategori_berita_id',
        'user_id',
    ];

    // Otomatis membuat UUID saat data baru dibuat
    protected static function booted(): void
    {
        static::creating(function ($model) {
            $model->id = (string) Str::uuid();
        });
    }

    public function kategori()
    {
        return $this->belongsTo(KategoriBerita::class, 'kategori_berita_id');
    }

    public function author()
    {
        // 'author' adalah nama relasi, 'user_id' adalah foreign key
        return $this->belongsTo(User::class, 'user_id');
    }

    /**
     * Mendefinisikan relasi: satu Berita 'memiliki banyak' Komentar.
     */
    public function comments()
    {
        return $this->hasMany(Comment::class);
    }
}
