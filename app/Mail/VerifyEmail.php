<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class VerifyEmail extends Mailable
{
    use Queueable, SerializesModels;

    // Variabel untuk menyimpan URL verifikasi
    public $verificationUrl;

    /**
     * Buat instansi baru mailable.
     *
     * @param string $verificationUrl
     * @return void
     */
    public function __construct($verificationUrl)
    {
        $this->verificationUrl = $verificationUrl; // Menyimpan URL verifikasi
    }

    /**
     * Tentukan tampilan email yang akan dikirim.
     *
     * @return \Illuminate\View\View
     */
    public function build()
    {
        return $this->subject('Verifikasi Email Anda') // Subjek email
            ->view('emails.verify') // Tampilan email (harus dibuat di folder resources/views/emails)
            ->with([
                'verificationUrl' => $this->verificationUrl, // Mengirimkan URL verifikasi ke tampilan
            ]);
    }
}