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
    ];

    // Otomatis membuat UUID saat data baru dibuat
    protected static function booted(): void
    {
        static::creating(function ($model) {
            $model->id = (string) Str::uuid();
        });
    }
}
