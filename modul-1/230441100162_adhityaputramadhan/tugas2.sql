CREATE DATABASE cars;
USE cars;

CREATE TABLE mobil (
    id_mobil INT AUTO_INCREMENT PRIMARY KEY,
    merek VARCHAR(50),
    tipe VARCHAR(50),
    tahun YEAR,
    plat_nomor VARCHAR(15) UNIQUE,
    STATUS ENUM('tersedia', 'disewa') DEFAULT 'tersedia',
    harga_per_hari DECIMAL(10,2)
);

CREATE TABLE pelanggan (
    id_pelanggan INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100),
    no_ktp VARCHAR(20) UNIQUE,
    no_telp VARCHAR(15),
    alamat TEXT
);


CREATE TABLE karyawan (
    id_karyawan INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100),
    posisi VARCHAR(50),
    no_telp VARCHAR(15)
);

CREATE TABLE perawatan (
    id_perawatan INT AUTO_INCREMENT PRIMARY KEY,
    id_mobil INT,
    tanggal DATE,
    jenis VARCHAR(100),
    biaya DECIMAL(10,2),
    FOREIGN KEY (id_mobil) REFERENCES mobil(id_mobil)
);

CREATE TABLE transaksi (
    id_transaksi INT AUTO_INCREMENT PRIMARY KEY,
    id_mobil INT,
    id_pelanggan INT,
    id_karyawan INT,
    tanggal_sewa DATE,
    tanggal_kembali DATE,
    total_bayar DECIMAL(10,2),
    STATUS ENUM('berlangsung', 'selesai') DEFAULT 'berlangsung',
    FOREIGN KEY (id_mobil) REFERENCES mobil(id_mobil),
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan),
    FOREIGN KEY (id_karyawan) REFERENCES karyawan(id_karyawan)
);

INSERT INTO mobil (merek, tipe, tahun, plat_nomor, STATUS, harga_per_hari) VALUES
('Toyota', 'Avanza', 2020, 'B1234XYZ', 'tersedia', 350000),
('Honda', 'Brio', 2021, 'D5678ABC', 'disewa', 300000),
('Suzuki', 'Ertiga', 2019, 'F9101DEF', 'tersedia', 325000);

INSERT INTO pelanggan (nama, no_ktp, no_telp, alamat) VALUES
('Ahmad Setiawan', '3201010111223333', '081234567890', 'Jl. Mawar No. 10, Bandung'),
('Rina Lestari', '3201010111224444', '082345678901', 'Jl. Melati No. 20, Jakarta');

INSERT INTO karyawan (nama, posisi, no_telp) VALUES
('Budi Santoso', 'Admin', '081122334455'),
('Sari Wulandari', 'CS', '082233445566');

INSERT INTO transaksi (id_mobil, id_pelanggan, tanggal_sewa, tanggal_kembali, total_bayar, STATUS) VALUES
(2, 1, '2025-04-01', '2025-04-05', 1200000, 'selesai'),
(1, 2, '2025-04-10', '2025-04-15', 1750000, 'berlangsung');

INSERT INTO perawatan (id_mobil, tanggal, jenis, biaya) VALUES
(3, '2025-03-15', 'Ganti Oli', 250000),
(1, '2025-02-10', 'Servis Rutin', 500000);

-- no 1
DELIMITER //

CREATE PROCEDURE UpdateDataMaster(
    IN p_id INT,
    IN p_nilai_baru DECIMAL(10,2),
    OUT p_status VARCHAR(100)
)
BEGIN
    DECLARE v_exists INT;

    SELECT COUNT(*) INTO v_exists FROM mobil WHERE id_mobil = p_id;

    IF v_exists > 0 THEN
        UPDATE mobil SET harga_per_hari = p_nilai_baru WHERE id_mobil = p_id;
        SET p_status = 'Update berhasil';
    ELSE
        SET p_status = 'Data tidak ditemukan';
    END IF;
END //

DELIMITER ;
-- Misalnya ingin update harga mobil id = 1 jadi 500000
SET @id := 1;
SET @nilai_baru := 500000;
SET @status := '';

CALL UpdateDataMaster(@id, @nilai_baru, @status);
SELECT @status AS status_update;

SELECT * FROM mobil;

-- no 2
DELIMITER //

CREATE PROCEDURE CountTransaksi(OUT total INT)
BEGIN
    SELECT COUNT(*) INTO total FROM transaksi;
END //

DELIMITER ;
CALL CountTransaksi(@total);
SELECT @total;	

SELECT * FROM transaksi;


-- 3
DELIMITER //

CREATE PROCEDURE GetDataMasterByID(
    IN p_id INT,
    OUT p_merek VARCHAR(50),
    OUT p_tipe VARCHAR(50),
    OUT p_harga DECIMAL(10,2)
)
BEGIN
    SELECT merek, tipe, harga_per_hari 
    INTO p_merek, p_tipe, p_harga
    FROM mobil
    WHERE id_mobil = p_id;
END //

DELIMITER ;
-- Ambil data mobil berdasarkan ID = 1
SET @id := 1;
SET @merek := '';
SET @tipe := '';
SET @harga := 0;

CALL GetDataMasterByID(@id, @merek, @tipe, @harga);
SELECT @merek AS merek, @tipe AS tipe, @harga AS harga_per_hari;

SELECT * FROM GetDataMasterByID;

-- 4
DELIMITER //

CREATE PROCEDURE UpdateFieldTransaksi(
    IN p_id INT,
    INOUT p_tanggal_kembali DATE,
    INOUT p_total_bayar DECIMAL(10,2)
)
BEGIN
    DECLARE v_tanggal_kembali DATE;
    DECLARE v_total_bayar DECIMAL(10,2);

    SELECT tanggal_kembali, total_bayar INTO v_tanggal_kembali, v_total_bayar
    FROM transaksi WHERE id_transaksi = p_id;

    IF p_tanggal_kembali IS NULL THEN
        SET p_tanggal_kembali = v_tanggal_kembali;
    END IF;

    IF p_total_bayar IS NULL THEN
        SET p_total_bayar = v_total_bayar;
    END IF;

    UPDATE transaksi
    SET tanggal_kembali = p_tanggal_kembali, total_bayar = p_total_bayar
    WHERE id_transaksi = p_id;
END //

DELIMITER ;


-- Misalnya update tanggal_kembali dan total_bayar untuk id_transaksi = 1
SET @id := 1;
SET @field1 := '2025-04-10';  -- tanggal_kembali
SET @field2 := 1400000;       -- total_bayar

CALL UpdateFieldTransaksi(@id, @field1, @field2);
SELECT @field1 AS tanggal_kembali, @field2 AS total_bayar;
SELECT * FROM UpdateFieldTransaksi;

