<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\HeroSlide;

class HeroSlideController extends Controller
{
    public function index()
    {
        return response()->json(HeroSlide::orderBy('order')->get());
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'title' => 'required|string|max:255',
            'subtitle' => 'nullable|string|max:255',
            'image' => 'required|image|mimes:jpeg,png,jpg,webp|max:2048',
            'order' => 'nullable|integer',
            'status' => 'boolean',
        ]);

        if ($request->hasFile('image')) {
            $path = $request->file('image')->store('hero-slides', 'public');
            $data['image'] = asset('storage/' . $path);
        }

        $hero = HeroSlide::create($data);
        return response()->json($hero, 201);
    }

    public function update(Request $request, $id)
    {
        $hero = HeroSlide::findOrFail($id);

        $data = $request->validate([
            'title' => 'required|string|max:255',
            'subtitle' => 'nullable|string|max:255',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,webp|max:2048',
            'order' => 'nullable|integer',
            'status' => 'boolean',
        ]);

        if ($request->hasFile('image')) {
            $path = $request->file('image')->store('hero-slides', 'public');
            $data['image'] = asset('storage/' . $path);
        }

        $hero->update($data);
        return response()->json($hero);
    }

    public function destroy($id)
    {
        HeroSlide::destroy($id);
        return response()->json(['message' => 'Slide deleted']);
    }
}
