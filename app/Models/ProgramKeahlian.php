<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Support\Str;

class ProgramKeahlian extends Model
{
    use HasFactory;

    protected $table = 'program_keahlians';

    public $incrementing = false;
    protected $keyType = 'string';

    protected $fillable = [
        'id',
        'judul_program_keahlian',
        'sub_judul',
        'icon',
        'deskripsi',
        'yang_dipelajari',
        'prospek_karir',
        'warna_header',
        'status',
    ];

    protected static function booted(): void
    {
        static::creating(function ($model) {
            $model->id = (string) Str::uuid();
        });
    }
}
