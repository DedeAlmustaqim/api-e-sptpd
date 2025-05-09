<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class WajibPajakController extends Controller
{
    public function lengkapiWP(Request $request)
    {
        $validated = $request->validate([
            'npwpd' => 'required',
            'nama_wajib_pajak' => 'required',
            'alamat_wajib_pajak' => 'required',
            'niop' => 'required',
            'nama_objek_usaha' => 'required',
            'alamat_objek_usaha' => 'required',
            'klasifikasi_usaha' => 'required',
        ]);

        DB::table('wajib_pajak')->insert([
            'user_id' => auth()->user()->id,
            'npwpd' => $validated['npwpd'],
            'nama_wajib_pajak' => $validated['nama_wajib_pajak'],
            'alamat_wajib_pajak' => $validated['alamat_wajib_pajak'],
            'niop' => $validated['niop'],
            'nama_objek_usaha' => $validated['nama_objek_usaha'],
            'alamat_objek_usaha' => $validated['alamat_objek_usaha'],
            'klasifikasi_usaha' => $validated['klasifikasi_usaha'],
        ]);

        return response()->json([
            'message' => 'Data Wajib Pajak berhasil dilengkapi.',

        ]);
    }
}