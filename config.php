<?php
// ============================================================
//  config.php — Veritabanı Bağlantı Ayarları
// ============================================================

define('DB_HOST', 'localhost');
define('DB_USER', 'root');        // Kendi kullanıcı adınızı girin
define('DB_PASS', '');            // Kendi şifrenizi girin
define('DB_NAME', 'cv_website');
define('DB_CHARSET', 'utf8mb4');

// PDO bağlantısı
function getDB(): PDO {
    static $pdo = null;
    if ($pdo === null) {
        $dsn = sprintf(
            'mysql:host=%s;dbname=%s;charset=%s',
            DB_HOST, DB_NAME, DB_CHARSET
        );
        $options = [
            PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES   => false,
        ];
        try {
            $pdo = new PDO($dsn, DB_USER, DB_PASS, $options);
        } catch (PDOException $e) {
            die(json_encode(['error' => 'Veritabanı bağlantı hatası: ' . $e->getMessage()]));
        }
    }
    return $pdo;
}
