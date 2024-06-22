-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2024 at 08:00 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skripsi`
--

-- --------------------------------------------------------

--
-- Table structure for table `civitas_akademik`
--

CREATE TABLE `civitas_akademik` (
  `ID_Tendik` int(11) NOT NULL,
  `Nama_Tendik` varchar(255) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Alamat` varchar(255) DEFAULT NULL,
  `Prod_ID_Prodi` int(11) DEFAULT NULL,
  `User_ID_User` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `NIP` int(11) NOT NULL,
  `Nama_Dosen` varchar(255) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Alamat` varchar(255) DEFAULT NULL,
  `Prod_ID_Prodi` int(11) DEFAULT NULL,
  `User_ID_User` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enroll_user`
--

CREATE TABLE `enroll_user` (
  `ID_Enroll_User` int(11) NOT NULL,
  `Label` int(11) DEFAULT NULL,
  `Nama_Role` varchar(255) DEFAULT NULL,
  `Deskripsi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_bimbingan`
--

CREATE TABLE `jadwal_bimbingan` (
  `ID_Bimbingan` int(11) NOT NULL,
  `Kartu_Bimbingan` blob DEFAULT NULL,
  `Waktu` datetime DEFAULT NULL,
  `Skripsi_ID_Skripsi` int(11) DEFAULT NULL,
  `Dosen_NIP_1` int(11) DEFAULT NULL,
  `Dosen_NIP_2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_sidang`
--

CREATE TABLE `jadwal_sidang` (
  `ID_Jadwal_Sidang` int(11) NOT NULL,
  `Sesi` int(11) DEFAULT NULL,
  `Waktu` date DEFAULT NULL,
  `Tempat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `NIM` int(11) NOT NULL,
  `Nama` varchar(255) DEFAULT NULL,
  `Angkatan` int(11) DEFAULT NULL,
  `Prod_ID_Prodi` int(11) DEFAULT NULL,
  `IPK` decimal(4,2) DEFAULT NULL,
  `Jumlah_SKS` int(11) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Alamat` varchar(255) DEFAULT NULL,
  `User_ID_User` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa_lulus`
--

CREATE TABLE `mahasiswa_lulus` (
  `ID_Mahasiswa_Lulus` int(11) NOT NULL,
  `Semhas_ID_Semhas` int(11) DEFAULT NULL,
  `Mahasiswa_NIM` int(11) DEFAULT NULL,
  `Sempro_ID_Sempro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `matkul`
--

CREATE TABLE `matkul` (
  `Kode_MK` int(11) NOT NULL,
  `Nama_MK` varchar(255) DEFAULT NULL,
  `SKS` int(11) DEFAULT NULL,
  `Sesi` int(11) DEFAULT NULL,
  `Hari` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mk_terambil`
--

CREATE TABLE `mk_terambil` (
  `ID_MK_Terambil` int(11) NOT NULL,
  `Mahasiswa_NIM` int(11) DEFAULT NULL,
  `Matkul_Kode_MK` int(11) DEFAULT NULL,
  `Grade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pendaftaran_semhas`
--

CREATE TABLE `pendaftaran_semhas` (
  `ID_Pendaftaran_Semhas` int(11) NOT NULL,
  `NIM` int(11) DEFAULT NULL,
  `ID_Sempro` int(11) DEFAULT NULL,
  `Waktu_Daftar` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pendaftaran_sempro`
--

CREATE TABLE `pendaftaran_sempro` (
  `ID_Pendaftaran_Sempro` int(11) NOT NULL,
  `Tanggal_Daftar_Sempro` date DEFAULT NULL,
  `Mahasiswa_NIM` int(11) DEFAULT NULL,
  `Surat_Persetujuan_Dospem` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prodi`
--

CREATE TABLE `prodi` (
  `ID_Prodi` int(11) NOT NULL,
  `Nama_Prodi` varchar(255) DEFAULT NULL,
  `Jenjang` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `semhas`
--

CREATE TABLE `semhas` (
  `ID_Semhas` int(11) NOT NULL,
  `Pendaftaran_Semhas_ID_Pendaftaran_Semhas` int(11) DEFAULT NULL,
  `Mahasiswa_NIM` int(11) DEFAULT NULL,
  `Sempro_ID_Sempro` int(11) DEFAULT NULL,
  `Jadwal_Sidang_ID_Jadwal_Sidang` int(11) DEFAULT NULL,
  `Dosen_NIP_1` int(11) DEFAULT NULL,
  `Dosen_NIP_2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sempro`
--

CREATE TABLE `sempro` (
  `ID_Sempro` int(11) NOT NULL,
  `Mahasiswa_NIM` int(11) DEFAULT NULL,
  `Pendaftaran_Sempro_ID_Pendaftaran_Sempro` int(11) DEFAULT NULL,
  `Jadwal_Sidang_ID_Jadwal_Sidang` int(11) DEFAULT NULL,
  `Dosen_NIP_1` int(11) DEFAULT NULL,
  `Dosen_NIP_2` int(11) DEFAULT NULL,
  `Status_Bimbingan` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `skripsi`
--

CREATE TABLE `skripsi` (
  `ID_Skripsi` int(11) NOT NULL,
  `Judul_Skripsi` varchar(255) DEFAULT NULL,
  `Mahasiswa_NIM` int(11) DEFAULT NULL,
  `Label` int(11) DEFAULT NULL,
  `KET` text DEFAULT NULL,
  `Dosen_NIP_1` int(11) DEFAULT NULL,
  `Dosen_NIP_2` int(11) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `Verifikasi` varchar(50) DEFAULT NULL,
  `MK_Terambil_ID_MK_Terambil` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID_User` int(11) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Pass` varchar(255) NOT NULL,
  `Enroll_User_ID_Enroll_User` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `civitas_akademik`
--
ALTER TABLE `civitas_akademik`
  ADD PRIMARY KEY (`ID_Tendik`),
  ADD KEY `Prod_ID_Prodi` (`Prod_ID_Prodi`),
  ADD KEY `User_ID_User` (`User_ID_User`);

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`NIP`),
  ADD KEY `Prod_ID_Prodi` (`Prod_ID_Prodi`),
  ADD KEY `User_ID_User` (`User_ID_User`);

--
-- Indexes for table `enroll_user`
--
ALTER TABLE `enroll_user`
  ADD PRIMARY KEY (`ID_Enroll_User`);

--
-- Indexes for table `jadwal_bimbingan`
--
ALTER TABLE `jadwal_bimbingan`
  ADD PRIMARY KEY (`ID_Bimbingan`),
  ADD KEY `Skripsi_ID_Skripsi` (`Skripsi_ID_Skripsi`),
  ADD KEY `Dosen_NIP_1` (`Dosen_NIP_1`),
  ADD KEY `Dosen_NIP_2` (`Dosen_NIP_2`);

--
-- Indexes for table `jadwal_sidang`
--
ALTER TABLE `jadwal_sidang`
  ADD PRIMARY KEY (`ID_Jadwal_Sidang`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`NIM`),
  ADD KEY `Prod_ID_Prodi` (`Prod_ID_Prodi`),
  ADD KEY `User_ID_User` (`User_ID_User`);

--
-- Indexes for table `mahasiswa_lulus`
--
ALTER TABLE `mahasiswa_lulus`
  ADD PRIMARY KEY (`ID_Mahasiswa_Lulus`),
  ADD KEY `Semhas_ID_Semhas` (`Semhas_ID_Semhas`),
  ADD KEY `Mahasiswa_NIM` (`Mahasiswa_NIM`),
  ADD KEY `Sempro_ID_Sempro` (`Sempro_ID_Sempro`);

--
-- Indexes for table `matkul`
--
ALTER TABLE `matkul`
  ADD PRIMARY KEY (`Kode_MK`);

--
-- Indexes for table `mk_terambil`
--
ALTER TABLE `mk_terambil`
  ADD PRIMARY KEY (`ID_MK_Terambil`),
  ADD KEY `Mahasiswa_NIM` (`Mahasiswa_NIM`),
  ADD KEY `Matkul_Kode_MK` (`Matkul_Kode_MK`);

--
-- Indexes for table `pendaftaran_semhas`
--
ALTER TABLE `pendaftaran_semhas`
  ADD PRIMARY KEY (`ID_Pendaftaran_Semhas`),
  ADD KEY `NIM` (`NIM`),
  ADD KEY `ID_Sempro` (`ID_Sempro`);

--
-- Indexes for table `pendaftaran_sempro`
--
ALTER TABLE `pendaftaran_sempro`
  ADD PRIMARY KEY (`ID_Pendaftaran_Sempro`),
  ADD KEY `Mahasiswa_NIM` (`Mahasiswa_NIM`);

--
-- Indexes for table `prodi`
--
ALTER TABLE `prodi`
  ADD PRIMARY KEY (`ID_Prodi`);

--
-- Indexes for table `semhas`
--
ALTER TABLE `semhas`
  ADD PRIMARY KEY (`ID_Semhas`),
  ADD KEY `Mahasiswa_NIM` (`Mahasiswa_NIM`),
  ADD KEY `Sempro_ID_Sempro` (`Sempro_ID_Sempro`),
  ADD KEY `Jadwal_Sidang_ID_Jadwal_Sidang` (`Jadwal_Sidang_ID_Jadwal_Sidang`),
  ADD KEY `Dosen_NIP_1` (`Dosen_NIP_1`),
  ADD KEY `Dosen_NIP_2` (`Dosen_NIP_2`),
  ADD KEY `Pendaftaran_Semhas_ID_Pendaftaran_Semhas` (`Pendaftaran_Semhas_ID_Pendaftaran_Semhas`);

--
-- Indexes for table `sempro`
--
ALTER TABLE `sempro`
  ADD PRIMARY KEY (`ID_Sempro`),
  ADD KEY `Mahasiswa_NIM` (`Mahasiswa_NIM`),
  ADD KEY `Jadwal_Sidang_ID_Jadwal_Sidang` (`Jadwal_Sidang_ID_Jadwal_Sidang`),
  ADD KEY `Dosen_NIP_1` (`Dosen_NIP_1`),
  ADD KEY `Dosen_NIP_2` (`Dosen_NIP_2`),
  ADD KEY `Pendaftaran_Sempro_ID_Pendaftaran_Sempro` (`Pendaftaran_Sempro_ID_Pendaftaran_Sempro`);

--
-- Indexes for table `skripsi`
--
ALTER TABLE `skripsi`
  ADD PRIMARY KEY (`ID_Skripsi`),
  ADD KEY `Mahasiswa_NIM` (`Mahasiswa_NIM`),
  ADD KEY `Dosen_NIP_1` (`Dosen_NIP_1`),
  ADD KEY `Dosen_NIP_2` (`Dosen_NIP_2`),
  ADD KEY `MK_Terambil_ID_MK_Terambil` (`MK_Terambil_ID_MK_Terambil`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID_User`),
  ADD KEY `Enroll_User_ID_Enroll_User` (`Enroll_User_ID_Enroll_User`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `civitas_akademik`
--
ALTER TABLE `civitas_akademik`
  MODIFY `ID_Tendik` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enroll_user`
--
ALTER TABLE `enroll_user`
  MODIFY `ID_Enroll_User` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jadwal_bimbingan`
--
ALTER TABLE `jadwal_bimbingan`
  MODIFY `ID_Bimbingan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jadwal_sidang`
--
ALTER TABLE `jadwal_sidang`
  MODIFY `ID_Jadwal_Sidang` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mahasiswa_lulus`
--
ALTER TABLE `mahasiswa_lulus`
  MODIFY `ID_Mahasiswa_Lulus` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mk_terambil`
--
ALTER TABLE `mk_terambil`
  MODIFY `ID_MK_Terambil` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pendaftaran_semhas`
--
ALTER TABLE `pendaftaran_semhas`
  MODIFY `ID_Pendaftaran_Semhas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pendaftaran_sempro`
--
ALTER TABLE `pendaftaran_sempro`
  MODIFY `ID_Pendaftaran_Sempro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prodi`
--
ALTER TABLE `prodi`
  MODIFY `ID_Prodi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `semhas`
--
ALTER TABLE `semhas`
  MODIFY `ID_Semhas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sempro`
--
ALTER TABLE `sempro`
  MODIFY `ID_Sempro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `skripsi`
--
ALTER TABLE `skripsi`
  MODIFY `ID_Skripsi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `ID_User` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `civitas_akademik`
--
ALTER TABLE `civitas_akademik`
  ADD CONSTRAINT `civitas_akademik_ibfk_1` FOREIGN KEY (`Prod_ID_Prodi`) REFERENCES `prodi` (`ID_Prodi`),
  ADD CONSTRAINT `civitas_akademik_ibfk_2` FOREIGN KEY (`User_ID_User`) REFERENCES `user` (`ID_User`);

--
-- Constraints for table `dosen`
--
ALTER TABLE `dosen`
  ADD CONSTRAINT `dosen_ibfk_1` FOREIGN KEY (`Prod_ID_Prodi`) REFERENCES `prodi` (`ID_Prodi`),
  ADD CONSTRAINT `dosen_ibfk_2` FOREIGN KEY (`User_ID_User`) REFERENCES `user` (`ID_User`);

--
-- Constraints for table `jadwal_bimbingan`
--
ALTER TABLE `jadwal_bimbingan`
  ADD CONSTRAINT `jadwal_bimbingan_ibfk_1` FOREIGN KEY (`Skripsi_ID_Skripsi`) REFERENCES `skripsi` (`ID_Skripsi`),
  ADD CONSTRAINT `jadwal_bimbingan_ibfk_2` FOREIGN KEY (`Dosen_NIP_1`) REFERENCES `dosen` (`NIP`),
  ADD CONSTRAINT `jadwal_bimbingan_ibfk_3` FOREIGN KEY (`Dosen_NIP_2`) REFERENCES `dosen` (`NIP`);

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`Prod_ID_Prodi`) REFERENCES `prodi` (`ID_Prodi`),
  ADD CONSTRAINT `mahasiswa_ibfk_2` FOREIGN KEY (`User_ID_User`) REFERENCES `user` (`ID_User`);

--
-- Constraints for table `mahasiswa_lulus`
--
ALTER TABLE `mahasiswa_lulus`
  ADD CONSTRAINT `mahasiswa_lulus_ibfk_1` FOREIGN KEY (`Semhas_ID_Semhas`) REFERENCES `semhas` (`ID_Semhas`),
  ADD CONSTRAINT `mahasiswa_lulus_ibfk_2` FOREIGN KEY (`Mahasiswa_NIM`) REFERENCES `mahasiswa` (`NIM`),
  ADD CONSTRAINT `mahasiswa_lulus_ibfk_3` FOREIGN KEY (`Sempro_ID_Sempro`) REFERENCES `sempro` (`ID_Sempro`);

--
-- Constraints for table `mk_terambil`
--
ALTER TABLE `mk_terambil`
  ADD CONSTRAINT `mk_terambil_ibfk_1` FOREIGN KEY (`Mahasiswa_NIM`) REFERENCES `mahasiswa` (`NIM`),
  ADD CONSTRAINT `mk_terambil_ibfk_2` FOREIGN KEY (`Matkul_Kode_MK`) REFERENCES `matkul` (`Kode_MK`);

--
-- Constraints for table `pendaftaran_semhas`
--
ALTER TABLE `pendaftaran_semhas`
  ADD CONSTRAINT `pendaftaran_semhas_ibfk_1` FOREIGN KEY (`NIM`) REFERENCES `mahasiswa` (`NIM`),
  ADD CONSTRAINT `pendaftaran_semhas_ibfk_2` FOREIGN KEY (`ID_Sempro`) REFERENCES `sempro` (`ID_Sempro`);

--
-- Constraints for table `pendaftaran_sempro`
--
ALTER TABLE `pendaftaran_sempro`
  ADD CONSTRAINT `pendaftaran_sempro_ibfk_1` FOREIGN KEY (`Mahasiswa_NIM`) REFERENCES `mahasiswa` (`NIM`);

--
-- Constraints for table `semhas`
--
ALTER TABLE `semhas`
  ADD CONSTRAINT `semhas_ibfk_1` FOREIGN KEY (`Mahasiswa_NIM`) REFERENCES `mahasiswa` (`NIM`),
  ADD CONSTRAINT `semhas_ibfk_2` FOREIGN KEY (`Sempro_ID_Sempro`) REFERENCES `sempro` (`ID_Sempro`),
  ADD CONSTRAINT `semhas_ibfk_3` FOREIGN KEY (`Jadwal_Sidang_ID_Jadwal_Sidang`) REFERENCES `jadwal_sidang` (`ID_Jadwal_Sidang`),
  ADD CONSTRAINT `semhas_ibfk_4` FOREIGN KEY (`Dosen_NIP_1`) REFERENCES `dosen` (`NIP`),
  ADD CONSTRAINT `semhas_ibfk_5` FOREIGN KEY (`Dosen_NIP_2`) REFERENCES `dosen` (`NIP`),
  ADD CONSTRAINT `semhas_ibfk_6` FOREIGN KEY (`Pendaftaran_Semhas_ID_Pendaftaran_Semhas`) REFERENCES `pendaftaran_semhas` (`ID_Pendaftaran_Semhas`);

--
-- Constraints for table `sempro`
--
ALTER TABLE `sempro`
  ADD CONSTRAINT `sempro_ibfk_1` FOREIGN KEY (`Mahasiswa_NIM`) REFERENCES `mahasiswa` (`NIM`),
  ADD CONSTRAINT `sempro_ibfk_2` FOREIGN KEY (`Jadwal_Sidang_ID_Jadwal_Sidang`) REFERENCES `jadwal_sidang` (`ID_Jadwal_Sidang`),
  ADD CONSTRAINT `sempro_ibfk_3` FOREIGN KEY (`Dosen_NIP_1`) REFERENCES `dosen` (`NIP`),
  ADD CONSTRAINT `sempro_ibfk_4` FOREIGN KEY (`Dosen_NIP_2`) REFERENCES `dosen` (`NIP`),
  ADD CONSTRAINT `sempro_ibfk_5` FOREIGN KEY (`Pendaftaran_Sempro_ID_Pendaftaran_Sempro`) REFERENCES `pendaftaran_sempro` (`ID_Pendaftaran_Sempro`);

--
-- Constraints for table `skripsi`
--
ALTER TABLE `skripsi`
  ADD CONSTRAINT `skripsi_ibfk_1` FOREIGN KEY (`Mahasiswa_NIM`) REFERENCES `mahasiswa` (`NIM`),
  ADD CONSTRAINT `skripsi_ibfk_2` FOREIGN KEY (`Dosen_NIP_1`) REFERENCES `dosen` (`NIP`),
  ADD CONSTRAINT `skripsi_ibfk_3` FOREIGN KEY (`Dosen_NIP_2`) REFERENCES `dosen` (`NIP`),
  ADD CONSTRAINT `skripsi_ibfk_4` FOREIGN KEY (`MK_Terambil_ID_MK_Terambil`) REFERENCES `mk_terambil` (`ID_MK_Terambil`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`Enroll_User_ID_Enroll_User`) REFERENCES `enroll_user` (`ID_Enroll_User`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
