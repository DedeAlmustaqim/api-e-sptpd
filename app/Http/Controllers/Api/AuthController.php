<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Facades\Mail;
use App\Mail\VerifyEmail;
use Illuminate\Auth\Events\Verified;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        $credentials = $request->validate([
            'email' => ['required', 'email'], //fungok@yahoo.com
            'password' => ['required'], //UNqGw6b4ZH
        ]);

        if (!Auth::attempt($credentials)) {
            return response()->json(['message' => 'Login gagal'], 401);
        }

        $user = Auth::user();
        $token = $user->createToken('api-token')->plainTextToken;

        return response()->json([
            'user' => $user,
            'token' => $token,
        ]);
    }
    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();

        return response()->json(['message' => 'Logout berhasil']);
    }
    public function user(Request $request)
    {
        return response()->json($request->user());
    }


    public function register(Request $request)
    {
        // Validasi data yang diterima dari request
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:6',
        ]);

        // Buat user tanpa langsung login
        $user = User::create([
            'name' => $validated['name'],
            'email' => $validated['email'],
            'password' => Hash::make($validated['password']),
            'email_verified_at' => null, // Pastikan email belum diverifikasi
        ]);

        // Generate link verifikasi
        $verificationUrl = URL::temporarySignedRoute(
            'verification.verify', // Definisikan route untuk verifikasi
            now()->addMinutes(60),  // Link berlaku selama 1 jam
            ['id' => $user->id]
        );

        // Kirim email verifikasi
        Mail::to($user->email)->send(new VerifyEmail($verificationUrl)); // Pastikan Anda membuat Mailable VerifyEmail

        return response()->json([
            'message' => 'Registrasi berhasil. Silakan cek email Anda untuk verifikasi.',
        ]);
    }

    public function verify(Request $request, $id)
    {
        $user = User::findOrFail($id);

        // Cek apakah URL yang diklik valid
        if (!$request->hasValidSignature()) {
            return response()->json(['message' => 'Link verifikasi tidak valid atau sudah kadaluarsa.'], 400);
        }

        // Jika email sudah diverifikasi
        if ($user->hasVerifiedEmail()) {
            return response()->json(['message' => 'Email sudah diverifikasi.'], 400);
        }

        $user->markEmailAsVerified();
        event(new Verified($user));

        return response()->json(['message' => 'Email berhasil diverifikasi.']);
    }
}