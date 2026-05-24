-- ============================================================
--  CV Web Sitesi - Veritabanı Dump
--  Teknoloji: MySQL 8.0+
-- ============================================================

CREATE DATABASE IF NOT EXISTS `cv_website`
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_unicode_ci;

USE `cv_website`;

CREATE TABLE `personal_info` (
  `id`         INT UNSIGNED    NOT NULL AUTO_INCREMENT,
  `full_name`  VARCHAR(100)    NOT NULL,
  `title`      VARCHAR(100)    NOT NULL,
  `city`       VARCHAR(100)    NOT NULL,
  `email`      VARCHAR(150)    NOT NULL,
  `phone`      VARCHAR(30)     NOT NULL,
  `linkedin`   VARCHAR(255)        NULL,
  `github`     VARCHAR(255)        NULL,
  `summary`    TEXT                NULL,
  `photo_url`  VARCHAR(255)        NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `education` (
  `id`          INT UNSIGNED  NOT NULL AUTO_INCREMENT,
  `school`      VARCHAR(150)  NOT NULL,
  `department`  VARCHAR(150)  NOT NULL,
  `degree`      VARCHAR(80)   NOT NULL,
  `start_year`  YEAR          NOT NULL,
  `end_year`    YEAR              NULL,
  `gpa`         DECIMAL(3,2)      NULL,
  `description` TEXT              NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `jobs` (
  `id`           INT UNSIGNED  NOT NULL AUTO_INCREMENT,
  `company`      VARCHAR(150)  NOT NULL,
  `position`     VARCHAR(150)  NOT NULL,
  `city`         VARCHAR(100)  NOT NULL,
  `start_date`   DATE          NOT NULL,
  `end_date`     DATE              NULL,
  `description`  TEXT              NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `computer_skills` (
  `id`         INT UNSIGNED   NOT NULL AUTO_INCREMENT,
  `category`   VARCHAR(80)    NOT NULL,
  `skill_name` VARCHAR(100)   NOT NULL,
  `level`      TINYINT UNSIGNED NOT NULL DEFAULT 50,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `hobbies` (
  `id`    INT UNSIGNED  NOT NULL AUTO_INCREMENT,
  `name`  VARCHAR(100)  NOT NULL,
  `icon`  VARCHAR(50)       NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `certificates` (
  `id`           INT UNSIGNED  NOT NULL AUTO_INCREMENT,
  `name`         VARCHAR(200)  NOT NULL,
  `issuer`       VARCHAR(150)  NOT NULL,
  `issue_date`   DATE          NOT NULL,
  `expiry_date`  DATE              NULL,
  `credential_url` VARCHAR(255)    NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================
-- VERİLER
-- ============================================================

INSERT INTO `personal_info`
  (`full_name`, `title`, `city`, `email`, `phone`, `linkedin`, `github`, `summary`, `photo_url`)
VALUES (
  'Ahmet Alperen Arısoy',
  'Siber Güvenlik Analistliği ve Operatörlüğü Öğrencisi',
  'İstanbul',
  'ahmetalperenarisoy@gmail.com',
  '+90 536 712 41 12',
  'https://www.linkedin.com/in/ahmet-alperen-ar%C4%B1soy-0b9b7035b/',
  'https://github.com/ezio-auditore-da-firenzee',
  'Küçüklüğümden beri teknolojinin içinde büyüdüm. Hacking videoları ve etik hacklemeyle tanıştım, bu merak beni siber güvenlik alanına yöneltti. İTÜ Infosec kulübünde başkan yardımcısı olarak görev yaptım.',
  NULL
);

INSERT INTO `education`
  (`school`, `department`, `degree`, `start_year`, `end_year`, `gpa`, `description`)
VALUES
  ('İstanbul Teknik Üniversitesi', 'Siber Güvenlik Analistliği ve Operatörlüğü', 'Ön Lisans', 2024, NULL, NULL, NULL);

INSERT INTO `jobs`
  (`company`, `position`, `city`, `start_date`, `end_date`, `description`)
VALUES
  ('—', 'Henüz iş deneyimi bulunmamaktadır.', 'İstanbul', '2024-01-01', '2024-01-01', NULL);

INSERT INTO `computer_skills`
  (`category`, `skill_name`, `level`)
VALUES
  ('Programlama Dilleri', 'Python', 40);

INSERT INTO `hobbies` (`name`, `icon`) VALUES
  ('Futbol', 'fa-futbol'),
  ('Tenis',  'fa-table-tennis-paddle-ball');

