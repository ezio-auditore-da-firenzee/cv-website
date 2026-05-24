# 📄 CV Web Sitesi

PHP + MySQL ile geliştirilmiş dinamik CV web sitesi.  
Tüm içerik veritabanından çekilir; sayfa hiçbir zaman hard-coded veri içermez.

---

## 🗂️ Proje Yapısı

```
cv-website/
├── index.html        # Ana sayfa (HTML + CSS + JS — tek dosya frontend)
├── data.php          # API: veritabanından JSON döndürür
├── config.php        # Veritabanı bağlantı ayarları
├── db/
│   └── cv_database.sql   # Veritabanı dump (tablo tanımları + örnek veriler)
├── docs/
│   └── db_diagram.md     # Veritabanı diyagramı (Mermaid)
└── README.md
```

---

## ⚙️ Kurulum

### 1. Gereksinimler
| Bileşen | Sürüm |
|---------|-------|
| PHP | 8.0+ |
| MySQL | 5.7+ / 8.0 |
| Web Sunucu | Apache / Nginx / PHP Built-in |

### 2. Veritabanını Oluşturun

```bash
mysql -u root -p < db/cv_database.sql
```

veya phpMyAdmin → **Import** → `cv_database.sql` seçin.

### 3. Bağlantı Ayarları

`config.php` dosyasını düzenleyin:

```php
define('DB_HOST', 'localhost');
define('DB_USER', 'root');     // MySQL kullanıcı adınız
define('DB_PASS', '');         // MySQL şifreniz
define('DB_NAME', 'cv_website');
```

### 4. Sunucuyu Başlatın

**PHP Built-in sunucu (geliştirme için):**
```bash
cd cv-website
php -S localhost:8000
# → http://localhost:8000 adresini açın
```

**Apache/XAMPP kullanıyorsanız:**  
Klasörü `htdocs/cv-website/` içine kopyalayın, `http://localhost/cv-website/` adresine gidin.

---

## 🗃️ Veritabanı Tabloları

| Tablo | İçerik |
|-------|--------|
| `personal_info` | Ad, şehir, e-posta, telefon, özet |
| `education` | Okul, bölüm, derece, yıllar |
| `jobs` | Şirket, pozisyon, tarih aralığı |
| `computer_skills` | Beceri adı, kategori, seviye (%) |
| `hobbies` | Hobi adı ve ikonu |
| `certificates` | Sertifika adı, kurum, tarih |

### Anahtar Sorgu (ödevde belirtilen)

```sql
SELECT * FROM jobs ORDER BY id DESC
```

Bu sorgu `data.php` içinde kullanılır; en son iş deneyimi en üstte gösterilir.

---

## 🖥️ Kullanılan Teknolojiler

- **Backend:** PHP 8 (PDO)
- **Veritabanı:** MySQL 8
- **Frontend:** HTML5, CSS3 (CSS Variables, Grid, Flexbox), Vanilla JavaScript (Fetch API)
- **Font:** Playfair Display + DM Sans (Google Fonts)
- **İkon:** Font Awesome 6

---

## ✏️ Kendi Bilgilerinizi Girin

Örnek veriler `db/cv_database.sql` içindeki `INSERT` satırlarını düzenleyerek değiştirilebilir.  
Tekrar import edin veya doğrudan MySQL'den güncelleyin:

```sql
UPDATE personal_info SET full_name='Adınız Soyadınız', city='Şehir' WHERE id=1;
```
