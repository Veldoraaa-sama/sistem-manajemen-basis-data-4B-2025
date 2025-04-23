CREATE DATABASE perkuliahan;

USE perkuliahan;

CREATE TABLE mahasiswa (
  nim CHAR(12) PRIMARY KEY,
  nama VARCHAR(30) NOT NULL,
  tanggal_lahir DATE,
  alamat TEXT,
  email VARCHAR(30) UNIQUE
);

CREATE TABLE dosen (
  nidn CHAR(12) PRIMARY KEY,
  nama VARCHAR(30) NOT NULL,
  email VARCHAR(30) UNIQUE,
  departemen VARCHAR(20),
  jenis_kelamin ENUM('L', 'P'),
  STATUS ENUM('Aktif', 'Tidak Aktif', 'Pensiun') DEFAULT 'Aktif'
);

CREATE TABLE mata_kuliah (
  kode_mk CHAR(10) PRIMARY KEY,
  nama_mk VARCHAR(30) NOT NULL,
  sks TINYINT UNSIGNED NOT NULL, 
  nidn CHAR(12),
  ruangan VARCHAR(10),
  jam_kuliah TIME,
  CONSTRAINT fk_dosen FOREIGN KEY (nidn) REFERENCES dosen(nidn)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);

CREATE TABLE krs (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nim CHAR(12) NOT NULL,
  kode_mk CHAR(10) NOT NULL,
  semester TINYINT UNSIGNED NOT NULL,
  tahun_ajaran VARCHAR(9) NOT NULL,
  tgl_pengisian DATE,
  STATUS ENUM('Disetujui', 'Ditolak', 'Diproses', 'Diterima') DEFAULT 'Diproses',
  
  FOREIGN KEY (nim) REFERENCES mahasiswa(nim)
    ON DELETE CASCADE ON UPDATE CASCADE,

  FOREIGN KEY (kode_mk) REFERENCES mata_kuliah(kode_mk)
    ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO dosen (nidn, nama, email, departemen, jenis_kelamin, STATUS) VALUES
('198710100001', 'Dr. Firmansyah Adi Saputra', 'andi.saputra@univ.ac.id', 'Sistem Informasi', 'L', 'Aktif'),
('198710100002', 'Dr. Budi Santoso', 'budi.santoso@univ.ac.id', 'Sistem Informasi', 'L', 'Aktif'),
('198710100003', 'Dr. Citra Maharani', 'citra.maharani@univ.ac.id', 'Teknik Komputer', 'P', 'Aktif'),
('198710100004', 'Drs. Dedi Gunawan', 'dedi.gunawan@univ.ac.id', 'Teknik Elektro', 'L', 'Pensiun'),
('198710100005', 'Dr. Evi Lestari', 'evi.lestari@univ.ac.id', 'Teknik Informatika', 'P', 'Aktif'),
('198710100006', 'Ir. Farid Hidayat', 'farid.hidayat@univ.ac.id', 'Sistem Informasi', 'L', 'Tidak Aktif'),
('198710100007', 'Dr. Gina Salsabila', 'gina.salsabila@univ.ac.id', 'Teknik Komputer', 'P', 'Aktif'),
('198710100008', 'Dr. Hendra Pratama', 'hendra.pratama@univ.ac.id', 'Teknik Elektro', 'L', 'Aktif'),
('198710100009', 'Dra. Indah Wulandari', 'indah.wulandari@univ.ac.id', 'Teknik Informatika', 'P', 'Aktif'),
('198710100010', 'Drs. Joko Suseno', 'joko.suseno@univ.ac.id', 'Sistem Informasi', 'L', 'Pensiun');

INSERT INTO mahasiswa (nim, nama, tanggal_lahir, alamat, email) VALUES
('220101000011', 'Sadewa buana', '2001-06-10', 'Jl. Garuda Raya No.88, Bogor', 'sadewaBuana@email.com'),
('220101000012', 'Ariq Suky wijaya', '2001-08-15', 'Jl. Melati No.5, Bandung', 'SukyJanay@email.com'),
('220101000013', 'Lestari Mnawu', '2003-01-22', 'Jl. Kenanga No.12, Surabaya', 'citra.lestari@email.com'),
('220101000014', 'Ayu Tiara', '2002-11-30', 'Jl. Dahlia No.3, Semarang', 'dewi.ayu@email.com'),
('220101000015', 'Eko', '2000-07-19', 'Jl. Anggrek No.9, Yogyakarta', 'eko.nugroho@email.com'),
('220101000016', 'Fitri Darmayanti', '2001-02-28', 'Jl. Cemara No.4, Medan', 'fitri.handayani@email.com'),
('220101000017', 'Gilang Ramadhan', '2003-04-17', 'Jl. Merpati No.7, Bekasi', 'gilang.ramadhan@email.com'),
('220101000018', 'Hana Nuraini', '2002-09-25', 'Jl. Elang No.10, Depok', 'hana.nuraini@email.com'),
('220101000019', 'Irfan Maulana', '2000-12-05', 'Jl. Rajawali No.2, Malang', 'irfan.maulana@email.com'),
('220101000020', 'Wahyu Alif', '2001-06-09', 'Jl. Garuda No.6, Bogor', 'WahyuAlif@email.com');

INSERT INTO mata_kuliah (kode_mk, nama_mk, sks, nidn, ruangan, jam_kuliah) VALUES
('IF111', 'Jaringan Komputer', 3, '198710100003', 'R111', '08:00:00'),
('IF112', 'Keamanan Informasi', 3, '198710100004', 'R112', '09:30:00'),
('IF113', 'Kecerdasan Buatan', 3, '198710100005', 'R113', '11:00:00'),
('IF114', 'Pemrograman Mobile', 3, '198710100006', 'R114', '13:00:00'),
('IF115', 'Big Data', 3, '198710100007', 'R115', '14:30:00'),
('IF116', 'Data Mining', 3, '198710100008', 'R116', '10:30:00'),
('IF117', 'Etika Profesi TI', 2, '198710100009', 'R117', '12:00:00'),
('IF118', 'Manajemen Sistem Informasi', 3, '198710100010', 'R118', '15:00:00'),
('IF119', 'Pemrograman Game', 3, '198710100001', 'R119', '09:00:00'),
('IF120', 'Teknologi Cloud', 2, '198710100002', 'R120', '07:30:00');

INSERT INTO krs (nim, kode_mk, semester, tahun_ajaran, tgl_pengisian, STATUS) VALUES
('220101000011', 'IF111', 2, '2024/2025', '2025-04-06', 'Diproses'),
('220101000012', 'IF112', 2, '2024/2025', '2025-04-06', 'Disetujui'),
('220101000013', 'IF113', 4, '2024/2025', '2025-04-06', 'Disetujui'),
('220101000014', 'IF114', 6, '2024/2025', '2025-04-06', 'Ditolak'),
('220101000015', 'IF116', 1, '2024/2025', '2025-04-06', 'Diproses');

SELECT * FROM mahasiswa;

RENAME TABLE mahasiswa TO mahasiwa;

UPDATE mahasiswa
SET nama = 'Rudi Hartono', email = 'rudi@email.com'
WHERE nim = '123456789012';

DROP TABLE mahasiswa;

ALTER TABLE krs DROP COLUMN ;

ALTER TABLE mahasiswa ADD nama VARCHAR(30) NOT NULL;

DELETE FROM mahasiswa WHERE nim = '220101000011';