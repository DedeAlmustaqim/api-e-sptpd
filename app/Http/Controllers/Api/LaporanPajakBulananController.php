<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class LaporanPajakBulananController extends Controller
{
    public function index()
    {
        $laporan = DB::table('laporan_pajak_bulanan')->where('user_id', Auth::id())->get();
        return response()->json([
            'success' => true,
            'message' => 'Data laporan berhasil diambil',
            'data' => $laporan
        ]);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'bulan' => 'required|integer|min:1|max:12',
            'tahun' => 'required|integer|min:2000|max:2100',
            'dasar_pengenaan' => 'required|numeric',

        ]);

        // Ambil user ID saat ini
        $userId = Auth::id();

        // Ambil NPWPD dari tabel wajib_pajak
        $wajibPajak = DB::table('wajib_pajak')->where('user_id', $userId)->first();

        if (!$wajibPajak) {
            return response()->json([
                'success' => false,
                'message' => 'Data wajib pajak tidak ditemukan untuk pengguna ini'
            ], 404);
        }

        // Tambahkan user_id dan npwpd secara otomatis
        $validated['user_id'] = $userId;
        $validated['npwpd'] = $wajibPajak->npwpd;

        $exist = DB::table('laporan_pajak_bulanan')->where('user_id', $userId)
            ->where('bulan', $validated['bulan'])
            ->where('tahun', $validated['tahun'])
            ->exists();

        if ($exist) {
            return response()->json([
                'success' => false,
                'message' => 'Laporan pajak bulan dan tahun sudah ada'
            ], 409);
        }

        $laporan = DB::table('laporan_pajak_bulanan')->insert($validated);

        return response()->json([
            'success' => true,
            'message' => 'Laporan pajak berhasil disimpan',
            'data' => $laporan
        ], 201);
    }

    public function update(Request $request, $id)
    {
        $laporan = DB::table('laporan_pajak_bulanan')->where('id', $id)->first();

        if (!$laporan) {
            return response()->json([
                'success' => false,
                'message' => 'Laporan tidak ditemukan'
            ], 404);
        }

        $validated = $request->validate([
            'bulan' => 'sometimes|required|integer|min:1|max:12',
            'tahun' => 'sometimes|required|integer|min:2000|max:2100',
            'dasar_pengenaan' => 'sometimes|required|numeric',

        ]);

        $laporan->update($validated);

        return response()->json([
            'success' => true,
            'message' => 'Laporan berhasil diperbarui',
            'data' => $laporan
        ]);
    }

    public function destroy($id)
    {
        $laporan = DB::table('laporan_pajak_bulanan')->where('id', $id)->firts();

        if (!$laporan) {
            return response()->json([
                'success' => false,
                'message' => 'Laporan tidak ditemukan'
            ], 404);
        }

        $laporan->delete();

        return response()->json([
            'success' => true,
            'message' => 'Laporan berhasil dihapus'
        ]);
    }


    
   
}