<?php
// ============================================================
//  data.php — Tüm CV verilerini JSON olarak döndürür
//  Kullanım: fetch('data.php') ile index.html'den çağrılır
// ============================================================

require_once 'config.php';

header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Origin: *');

$db = getDB();

// ---- Genel Bilgiler ----------------------------------------
$personal = $db->query('SELECT * FROM personal_info LIMIT 1')->fetch();

// ---- Eğitim (yeniden eskiye) --------------------------------
$education = $db->query(
    'SELECT * FROM education ORDER BY start_year DESC'
)->fetchAll();

// ---- İş Deneyimi — ödeve uygun sorgu ----------------------
$jobs = $db->query(
    'SELECT * FROM jobs ORDER BY id DESC'
)->fetchAll();

// ---- Bilgisayar Becerileri ---------------------------------
$skills = $db->query(
    'SELECT * FROM computer_skills ORDER BY category, level DESC'
)->fetchAll();

// Kategori bazlı grupla
$skillsGrouped = [];
foreach ($skills as $s) {
    $skillsGrouped[$s['category']][] = $s;
}

// ---- Hobiler -----------------------------------------------
$hobbies = $db->query('SELECT * FROM hobbies ORDER BY id')->fetchAll();

// ---- Sertifikalar (tarih azalan) ---------------------------
$certificates = $db->query(
    'SELECT * FROM certificates ORDER BY issue_date DESC'
)->fetchAll();

// ---- Yanıt -------------------------------------------------
echo json_encode([
    'personal'     => $personal,
    'education'    => $education,
    'jobs'         => $jobs,
    'skills'       => $skillsGrouped,
    'hobbies'      => $hobbies,
    'certificates' => $certificates,
], JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
