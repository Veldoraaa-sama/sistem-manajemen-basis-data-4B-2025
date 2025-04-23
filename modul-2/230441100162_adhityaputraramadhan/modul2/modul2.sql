CREATE DATABASE db_akademik;
USE db_akademik;

CREATE TABLE tb_mahasiswa (
    id_mahasiswa INT(5) PRIMARY KEY AUTO_INCREMENT,
    nim VARCHAR(25) NOT NULL,
    nama_mahasiswa VARCHAR(100) NOT NULL,
    tempat_lahir VARCHAR(25),
    tanggal_lahir DATE,
    alamat TEXT,
    email VARCHAR(100),
    jk ENUM('Laki', 'Perempuan'),
    angkatan VARCHAR(4),
    status_mahasiswa ENUM('Aktif', 'Non Aktif', 'Cuti')
);

CREATE TABLE tb_dosen (
    id_dosen INT(5) PRIMARY KEY AUTO_INCREMENT,
    nidn VARCHAR(25),
    nip VARCHAR(25),
    nama_dosen VARCHAR(100),
    email_dosen VARCHAR(100),
    jk ENUM('Laki-laki', 'Perempuan'),
    status_dosen ENUM('ASN', 'P3K', 'Honorer')
);

CREATE TABLE tb_mata_kuliah (
    id_matkul INT(5) PRIMARY KEY AUTO_INCREMENT,
    kode_matkul VARCHAR(10),
    nama_matkul VARCHAR(100),
    sks INT(11),
    ruangan VARCHAR(50),
    jam TIME,
    id_dosen INT(5),
    FOREIGN KEY (id_dosen) REFERENCES tb_dosen(id_dosen)
);

CREATE TABLE tb_krs (
    id_krs INT(5) PRIMARY KEY AUTO_INCREMENT,
    id_mahasiswa INT(5),
    id_matkul INT(5),
    semester VARCHAR(10),
    tahun_akademik VARCHAR(10),
    FOREIGN KEY (id_mahasiswa) REFERENCES tb_mahasiswa(id_mahasiswa),
    FOREIGN KEY (id_matkul) REFERENCES tb_mata_kuliah(id_matkul)
);

INSERT INTO tb_dosen (nidn, nip, nama_dosen, email_dosen, jk, status_dosen) VALUES
('123456789012', NULL, 'Andi Susanto', 'andi.susanto@university.ac.id', 'Laki-laki', 'Honorer'),
('123456789013', '123456', 'Budi Santoso', 'budi.santoso@university.ac.id', 'Laki-laki', 'ASN'),
('123456789014', '123457', 'Cindy Kurnia', 'cindy.kurnia@university.ac.id', 'Perempuan', 'P3K'),
('123456789015', NULL, 'Dewi Rahmawati', 'dewi.rahmawati@university.ac.id', 'Perempuan', 'Honorer'),
('123456789016', '123458', 'Eko Prasetyo', 'eko.prasetyo@university.ac.id', 'Laki-laki', 'ASN'),
('123456789017', NULL, 'Fina Anggriana', 'fina.anggriana@university.ac.id', 'Perempuan', 'Honorer'),
('123456789018', '123459', 'Guntur Wijaya', 'guntur.wijaya@university.ac.id', 'Laki-laki', 'ASN'),
('123456789019', '123460', 'Hani Yulianti', 'hani.yulianti@university.ac.id', 'Perempuan', 'P3K'),
('123456789020', '123461', 'Iwan Setiawan', 'iwan.setiawan@university.ac.id', 'Laki-laki', 'ASN'),
('123456789021', '123462', 'Joko Susilo', 'joko.susilo@university.ac.id', 'Laki-laki', 'ASN'),
('123456789022', NULL, 'Kirana Putri', 'kirana.putri@university.ac.id', 'Perempuan', 'Honorer'),
('123456789023', '123463', 'Lina Marlina', 'lina.marlina@university.ac.id', 'Perempuan', 'P3K'),
('123456789024', '123464', 'Miko Saputra', 'miko.saputra@university.ac.id', 'Laki-laki', 'ASN'),
('123456789025', '123465', 'Nina Amalia', 'nina.amalia@university.ac.id', 'Perempuan', 'P3K'),
('123456789026', '123466', 'Oki Prabowo', 'oki.prabowo@university.ac.id', 'Laki-laki', 'ASN'),
('123456789027', NULL, 'Putri Melati', 'putri.melati@university.ac.id', 'Perempuan', 'Honorer'),
('123456789028', '123467', 'Rudi Hartono', 'rudi.hartono@university.ac.id', 'Laki-laki', 'ASN'),
('123456789029', '123468', 'Sari Indah', 'sari.indah@university.ac.id', 'Perempuan', 'P3K'),
('123456789030', '123469', 'Toni Setyawan', 'toni.setyawan@university.ac.id', 'Laki-laki', 'ASN'),
('123456789031', '123470', 'Umi Farida', 'umi.farida@university.ac.id', 'Perempuan', 'P3K'),
('123456789032', NULL, 'Vina Anjani', 'vina.anjani@university.ac.id', 'Perempuan', 'Honorer'),
('123456789033', '123471', 'Wawan Kurniawan', 'wawan.kurniawan@university.ac.id', 'Laki-laki', 'ASN'),
('123456789034', '123472', 'Yusuf Alif', 'yusuf.alif@university.ac.id', 'Laki-laki', 'ASN'),
('123456789035', '123473', 'Zara Amani', 'zara.amani@university.ac.id', 'Perempuan', 'P3K');

INSERT INTO tb_mahasiswa (nim, nama_mahasiswa, tempat_lahir, tanggal_lahir, alamat, email, jk, angkatan, status_mahasiswa) VALUES
('210441100001', 'Andi Setiawan', 'Kota Malang', '2002-01-15', 'Kab. Malang, Jawa Timur', 'andi.setiawan@example.com', 'Laki', '2021', 'Aktif'),
('210441100002', 'Budi Santoso', 'Kota Batu', '2002-02-20', 'Kab. Malang, Jawa Timur', 'budi.santoso@example.com', 'Laki', '2021', 'Aktif'),
('210441100003', 'Cindy Kurnia', 'Kota Surabaya', '2002-03-10', 'Kota Surabaya, Jawa Timur', 'cindy.kurnia@example.com', 'Perempuan', '2021', 'Aktif'),
('210441100004', 'Dewi Rahmawati', 'Kab. Pasuruan', '2002-04-12', 'Kab. Pasuruan, Jawa Timur', 'dewi.rahmawati@example.com', 'Perempuan', '2021', 'Aktif'),
('210441100005', 'Eko Prasetyo', 'Kota Probolinggo', '2002-05-05', 'Kota Probolinggo, Jawa Timur', 'eko.prasetyo@example.com', 'Laki', '2021', 'Aktif'),
('210441100006', 'Fina Anggriana', 'Kab. Sidoarjo', '2002-06-18', 'Kab. Sidoarjo, Jawa Timur', 'fina.anggriana@example.com', 'Perempuan', '2021', 'Aktif'),
('210441100007', 'Guntur Wijaya', 'Kota Malang', '2002-07-22', 'Kab. Malang, Jawa Timur', 'guntur.wijaya@example.com', 'Laki', '2021', 'Aktif'),
('210441100008', 'Hani Yulianti', 'Kota Surabaya', '2002-08-30', 'Kota Surabaya, Jawa Timur', 'hani.yulianti@example.com', 'Perempuan', '2021', 'Aktif'),
('210441100009', 'Iwan Setiawan', 'Kab. Jombang', '2002-09-14', 'Kab. Jombang, Jawa Timur', 'iwan.setiawan@example.com', 'Laki', '2021', 'Aktif'),
('210441100010', 'Joko Susilo', 'Kab. Mojokerto', '2002-10-25', 'Kab. Mojokerto, Jawa Timur', 'joko.susilo@example.com', 'Laki', '2021', 'Aktif'),
('210441100011', 'Kirana Putri', 'Kota Pasuruan', '2002-11-11', 'Kota Pasuruan, Jawa Timur', 'kirana.putri@example.com', 'Perempuan', '2021', 'Aktif'),
('210441100012', 'Lina Marlina', 'Kab. Gresik', '2002-12-05', 'Kab. Gresik, Jawa Timur', 'lina.marlina@example.com', 'Perempuan', '2021', 'Aktif'),
('210441100013', 'Miko Saputra', 'Kota Mojokerto', '2003-01-20', 'Kota Mojokerto, Jawa Timur', 'miko.saputra@example.com', 'Laki', '2021', 'Aktif'),
('210441100014', 'Nina Amalia', 'Kab. Lamongan', '2003-02-18', 'Kab. Lamongan, Jawa Timur', 'nina.amalia@example.com', 'Perempuan', '2021', 'Aktif'),
('210441100015', 'Oki Prabowo', 'Kota Surabaya', '2003-03-22', 'Kota Surabaya, Jawa Timur', 'oki.prabowo@example.com', 'Laki', '2021', 'Aktif'),
('210441100016', 'Putri Melati', 'Kab. Sidoarjo', '2003-04-14', 'Kab. Sidoarjo, Jawa Timur', 'putri.melati@example.com', 'Perempuan', '2021', 'Aktif'),
('210441100017', 'Rudi Hartono', 'Kota Malang', '2003-05-30', 'Kab. Malang, Jawa Timur', 'rudi.hartono@example.com', 'Laki', '2021', 'Aktif'),
('210441100018', 'Sari Indah', 'Kab. Pasuruan', '2003-06-12', 'Kab. Pasuruan, Jawa Timur', 'sari.indah@example.com', 'Perempuan', '2021', 'Aktif'),
('210441100019', 'Toni Setyawan', 'Kota Probolinggo', '2003-07-25', 'Kota Probolinggo, Jawa Timur', 'toni.setyawan@example.com', 'Laki', '2021', 'Aktif'),
('210441100020', 'Umi Farida', 'Kab. Jombang', '2003-08-10', 'Kab. Jombang, Jawa Timur', 'umi.farida@example.com', 'Perempuan', '2021', 'Aktif'),
('210441100061', 'Vina Anjani', 'Kab. Mojokerto', '2004-01-15', 'Kab. Mojokerto, Jawa Timur', 'vina.anjani@example.com', 'Perempuan', '2021', 'Cuti'),
('210441100062', 'Wawan Kurniawan', 'Kota Malang', '2004-02-20', 'Kab. Malang, Jawa Timur', 'wawan.kurniawan@example.com', 'Laki', '2021', 'Aktif'),
-- Tambahkan data non aktif dan cuti
('210441100063', 'Yusuf Alif', 'Kota Surabaya', '2004-03-10', 'Kota Surabaya, Jawa Timur', 'yusuf.alif@example.com', 'Laki', '2021', 'Non Aktif'),
('210441100064', 'Zara Amani', 'Kab. Pasuruan', '2004-04-12', 'Kab. Pasuruan, Jawa Timur', 'zara.amani@example.com', 'Perempuan', '2021', 'Cuti');

INSERT INTO tb_mata_kuliah (kode_matkul, nama_matkul, sks, ruangan, jam, id_dosen) VALUES
('PM101', 'Pemrograman Dasar', 3, 'LAB BIS', '08:00:00', 1),
('PM102', 'Pemrograman Lanjut', 3, 'LAB TI', '10:00:00', 2),
('PM103', 'Algoritma dan Pemrograman', 3, 'LAB Programming', '14:00:00', 1),
('PM104', 'Basis Data', 3, 'LAB BIS', '09:00:00', 3),
('PM105', 'Rekayasa Perangkat Lunak', 3, 'LAB TI', '11:00:00', 2),
('PM106', 'Pemrograman Web', 3, 'LAB Programming', '13:00:00', 1),
('PM107', 'Pengembangan Aplikasi Mobile', 3, 'LAB BIS', '15:00:00', 3),
('PM108', 'Keamanan Sistem', 3, 'LAB TI', '16:00:00', 2),
('PM109', 'Pemrograman Game', 3, 'LAB Programming', '17:00:00', 1),
('PM110', 'Kecerdasan Buatan', 3, 'LAB BIS', '18:00:00', 3);

INSERT INTO tb_krs (id_mahasiswa, id_matkul, semester, tahun_akademik) VALUES
(1, 1, 'Ganjil', '2023/2024'),
(1, 2, 'Ganjil', '2023/2024'),
(1, 3, 'Ganjil', '2023/2024'),
(1, 4, 'Ganjil', '2023/2024'),
(1, 5, 'Ganjil', '2023/2024'),
(1, 6, 'Ganjil', '2023/2024'),
(1, 7, 'Ganjil', '2023/2024'),
(1, 8, 'Ganjil', '2023/2024'),
(1, 9, 'Ganjil', '2023/2024'),
(1, 10, 'Ganjil', '2023/2024'),

(2, 1, 'Ganjil', '2023/2024'),
(2, 2, 'Ganjil', '2023/2024'),
(2, 3, 'Ganjil', '2023/2024'),
(2, 4, 'Ganjil', '2023/2024'),
(2, 5, 'Ganjil', '2023/2024'),
(2, 6, 'Ganjil', '2023/2024'),
(2, 7, 'Ganjil', '2023/2024'),
(2, 8, 'Ganjil', '2023/2024'),
(2, 9, 'Ganjil', '2023/2024'),
(2, 10, 'Ganjil', '2023/2024'),

(3, 1, 'Ganjil', '2023/2024'),
(3, 2, 'Ganjil', '2023/2024'),
(3, 3, 'Ganjil', '2023/2024'),
(3, 4, 'Ganjil', '2023/2024'),
(3, 5, 'Ganjil', '2023/2024'),
(3, 6, 'Ganjil', '2023/2024'),
(3, 7, 'Ganjil', '2023/2024'),
(3, 8, 'Ganjil', '2023/2024'),
(3, 9, 'Ganjil', '2023/2024'),
(3, 10, 'Ganjil', '2023/2024'),

(4, 1, 'Ganjil', '2023/2024'),
(4, 2, 'Ganjil', '2023/2024'),
(4, 3, 'Ganjil', '2023/2024'),
(4, 4, 'Ganjil', '2023/2024'),
(4, 5, 'Ganjil', '2023/2024'),
(4, 6, 'Ganjil', '2023/2024'),
(4, 7, 'Ganjil', '2023/2024'),
(4, 8, 'Ganjil', '2023/2024'),
(4, 9, 'Ganjil', '2023/2024'),
(4, 10, 'Ganjil', '2023/2024'),

(5, 1, 'Ganjil', '2023/2024'),
(5, 2, 'Ganjil', '2023/2024'),
(5, 3, 'Ganjil', '2023/2024'),
(5, 4, 'Ganjil', '2023/2024'),
(5, 5, 'Ganjil', '2023/2024'),
(5, 6, 'Ganjil', '2023/2024'),
(5, 7, 'Ganjil', '2023/2024'),
(5, 8, 'Ganjil', '2023/2024'),
(5, 9, 'Ganjil', '2023/2024'),
(5, 10, 'Ganjil', '2023/2024'),

(6, 1, 'Ganjil', '2023/2024'),
(6, 2, 'Ganjil', '2023/2024'),
(6, 3, 'Ganjil', '2023/2024'),
(6, 4, 'Ganjil', '2023/2024'),
(6, 5, 'Ganjil', '2023/2024'),
(6, 6, 'Ganjil', '2023/2024'),
(6, 7, 'Ganjil', '2023/2024'),
(6, 8, 'Ganjil', '2023/2024'),
(6, 9, 'Ganjil', '2023/2024'),
(6, 10, 'Ganjil', '2023/2024'),

(7, 1, 'Ganjil', '2023/2024'),
(7, 2, 'Ganjil', '2023/2024'),
(7, 3, 'Ganjil', '2023/2024'),
(7, 4, 'Ganjil', '2023/2024'),
(7, 5, 'Ganjil', '2023/2024'),
(7, 6, 'Ganjil', '2023/2024'),
(7, 7, 'Ganjil', '2023/2024'),
(7, 8, 'Ganjil', '2023/2024'),
(7, 9, 'Ganjil', '2023/2024'),
(7, 10, 'Ganjil', '2023/2024'),

(8, 1, 'Ganjil', '2023/2024'),
(8, 2, 'Ganjil', '2023/2024'),
(8, 3, 'Ganjil', '2023/2024'),
(8, 4, 'Ganjil', '2023/2024'),
(8, 5, 'Ganjil', '2023/2024'),
(8, 6, 'Ganjil', '2023/2024'),
(8, 7, 'Ganjil', '2023/2024'),
(8, 8, 'Ganjil', '2023/2024'),
(8, 9, 'Ganjil', '2023/2024'),
(8, 10, 'Ganjil', '2023/2024'),

(9, 1, 'Ganjil', '2023/2024'),
(9, 2, 'Ganjil', '2023/2024'),
(9, 3, 'Ganjil', '2023/2024'),
(9, 4, 'Ganjil', '2023/2024'),
(9, 5, 'Ganjil', '2023/2024'),
(9, 6, 'Ganjil', '2023/2024'),
(9, 7, 'Ganjil', '2023/2024'),
(9, 8, 'Ganjil', '2023/2024'),
(9, 9, 'Ganjil', '2023/2024'),
(9, 10, 'Ganjil', '2023/2024'),

(10, 1, 'Ganjil', '2023/2024'),
(10, 2, 'Ganjil', '2023/2024'),
(10, 3, 'Ganjil', '2023/2024');

SELECT * FROM tb_mahasiswa;

DROP VIEW IF EXISTS view_krs_mahasiswa;

CREATE VIEW view_krs_mahasiswa AS
SELECT 
    mhs.nim,
    mhs.nama_mahasiswa,
    mhs.angkatan,
    mk.kode_matkul,
    mk.nama_matkul,
    mk.sks,
    dsn.nama_dosen,
    krs.semester,
    krs.tahun_akademik
FROM tb_krs krs
JOIN tb_mahasiswa mhs ON krs.id_mahasiswa = mhs.id_mahasiswa
JOIN tb_mata_kuliah mk ON krs.id_matkul = mk.id_matkul
JOIN tb_dosen dsn ON mk.id_dosen = dsn.id_dosen;

SELECT * FROM view_krs_mahasiswa;

