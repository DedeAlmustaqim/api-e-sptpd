<!-- resources/views/emails/verify.blade.php -->

<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Verifikasi Email</title>
</head>

<body>
    <h1>Terima Kasih Telah Mendaftar!</h1>
    <p>Untuk menyelesaikan proses pendaftaran, silakan klik tautan di bawah ini untuk memverifikasi email Anda:</p>
    <p>
        <a href="{{ $verificationUrl }}">Verifikasi Email Saya</a>
    </p>
    <p>Jika Anda tidak merasa mendaftar, Anda dapat mengabaikan email ini.</p>
</body>

</html>
