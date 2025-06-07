<?php

namespace App\Http\Controllers;

use App\Models\ProgramKeahlian;
use Illuminate\Http\Request;

class ProgramKeahlianController extends Controller
{
    public function index()
    {
        return response()->json(ProgramKeahlian::all());
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'judul_program_keahlian' => 'required|string|max:255',
            'sub_judul' => 'nullable|string',
            'icon' => 'nullable|string',
            'deskripsi' => 'nullable|string',
            'yang_dipelajari' => 'nullable|string',
            'prospek_karir' => 'nullable|string',
            'warna_header' => 'nullable|string',
        ]);

        $program = ProgramKeahlian::create($validated);
        return response()->json($program, 201);
    }

    public function show($id)
    {
        $program = ProgramKeahlian::findOrFail($id);
        return response()->json($program);
    }

    public function update(Request $request, $id)
    {
        $program = ProgramKeahlian::findOrFail($id);

        $validated = $request->validate([
            'judul_program_keahlian' => 'sometimes|required|string|max:255',
            'sub_judul' => 'nullable|string',
            'icon' => 'nullable|string',
            'deskripsi' => 'nullable|string',
            'yang_dipelajari' => 'nullable|string',
            'prospek_karir' => 'nullable|string',
            'warna_header' => 'nullable|string',
            'status' => 'boolean',
        ]);

        $program->update($validated);
        return response()->json($program);
    }

    public function destroy($id)
    {
        $program = ProgramKeahlian::findOrFail($id);
        $program->delete();

        return response()->json(['message' => 'Berhasil dihapus']);
    }

    // ✅ Endpoint Publik
    public function publik()
    {
        return response()->json(
            ProgramKeahlian::where('status', true)->get()
        );
    }
}
