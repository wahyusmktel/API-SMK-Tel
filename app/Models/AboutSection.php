<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class AboutSection extends Model
{
    protected $keyType = 'string';
    public $incrementing = false;

    protected static function booted(): void
    {
        static::creating(function ($model) {
            $model->id = (string) Str::uuid();
        });
    }

    protected $fillable = [
        'judul',
        'deskripsi_1',
        'deskripsi_2',
        'gambar_urls'
    ];

    protected $casts = [
        'gambar_urls' => 'array',
    ];
}
