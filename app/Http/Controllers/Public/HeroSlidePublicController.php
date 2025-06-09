<?php

namespace App\Http\Controllers\Public;

use App\Http\Controllers\Controller;
use App\Models\HeroSlide;

class HeroSlidePublicController extends Controller
{
    public function index()
    {
        return response()->json(
            HeroSlide::where('status', true)
                ->orderBy('order')
                ->get()
        );
    }
}
