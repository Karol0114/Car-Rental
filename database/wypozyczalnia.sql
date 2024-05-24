-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 24, 2024 at 05:09 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wypozyczalnia`
--

-- --------------------------------------------------------

--
-- Table structure for table `adresy`
--

CREATE TABLE `adresy` (
  `ID_adresu` int(11) NOT NULL,
  `miasto` text NOT NULL,
  `ulica` text NOT NULL,
  `numer` text NOT NULL,
  `kod_pocztowy` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `adresy`
--

INSERT INTO `adresy` (`ID_adresu`, `miasto`, `ulica`, `numer`, `kod_pocztowy`) VALUES
(1, 'Piekary Śląskie', 'Jesienna', '20', '41-943'),
(2, 'Katowice', 'Piękna', '10/2', '41-500');

-- --------------------------------------------------------

--
-- Table structure for table `historia_napraw_i_usterek`
--

CREATE TABLE `historia_napraw_i_usterek` (
  `ID_naprawy` int(11) NOT NULL,
  `ID_pojazdu` int(11) NOT NULL,
  `ID_pracownika` int(11) NOT NULL,
  `opis_usterki` text NOT NULL,
  `data_usterki` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `data_naprawy` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `klienci`
--

CREATE TABLE `klienci` (
  `ID_klienta` int(11) NOT NULL,
  `pesel` varchar(11) NOT NULL,
  `ID_adresu` int(11) NOT NULL,
  `imie` text NOT NULL,
  `nazwisko` text NOT NULL,
  `od_kiedy_prawo_jazdy` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `klienci`
--

INSERT INTO `klienci` (`ID_klienta`, `pesel`, `ID_adresu`, `imie`, `nazwisko`, `od_kiedy_prawo_jazdy`) VALUES
(4, '000000123', 1, 'Oscar', 'Czempiel', '2024-05-01');

-- --------------------------------------------------------

--
-- Table structure for table `pojazdy`
--

CREATE TABLE `pojazdy` (
  `ID_pojazdu` int(11) NOT NULL,
  `numer_rejestracyjny` varchar(10) NOT NULL,
  `kategoria` varchar(15) NOT NULL,
  `zdjecie` text NOT NULL,
  `marka` text NOT NULL,
  `model` text NOT NULL,
  `rok_produkcji` int(5) NOT NULL,
  `pojemnosc_silnika` float NOT NULL,
  `KM` int(11) NOT NULL,
  `skrzynia_biegow` varchar(20) NOT NULL,
  `rodzaj_paliwa` text NOT NULL,
  `ubezpieczenie` date NOT NULL,
  `przeglad` date NOT NULL,
  `ilosc_drzwi` int(11) NOT NULL,
  `ilosc_siedzen` int(3) NOT NULL,
  `cena_za_dobe` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `pojazdy`
--

INSERT INTO `pojazdy` (`ID_pojazdu`, `numer_rejestracyjny`, `kategoria`, `zdjecie`, `marka`, `model`, `rok_produkcji`, `pojemnosc_silnika`, `KM`, `skrzynia_biegow`, `rodzaj_paliwa`, `ubezpieczenie`, `przeglad`, `ilosc_drzwi`, `ilosc_siedzen`, `cena_za_dobe`) VALUES
(6, 'AUD123456', 'SUV', 'assets/images/audi_q8.png', 'Audi', 'Q8', 2019, 4, 507, 'Automatyczna', 'Diesel', '2019-01-01', '2019-01-01', 5, 5, 500),
(7, 'MBZ654321', 'SUV', 'assets/images/mercedes.png', 'Mercedes-Benz', 'GLC 300 e 4-Matic', 2021, 2, 211, 'Automatyczna', 'Hybryda', '2021-01-01', '2021-01-01', 5, 5, 250),
(8, 'POR987654', 'Sportowe', 'assets/images/Porsche_panamera.png', 'Porsche', 'Panamera', 2012, 3.6, 300, 'Automatyczna', 'Benzyna', '2012-01-01', '2012-01-01', 5, 4, 300),
(9, 'FER123789', 'Sportowe', 'assets/images/ferrari.png', 'Ferrari', '458 Italia', 2015, 4.5, 569, 'Automatyczna', 'Benzyna', '2015-01-01', '2015-01-01', 2, 2, 5000),
(10, 'BMW456123', 'Luksusowe', 'assets/images/bmw_m4.png', 'BMW', 'M4', 2017, 3, 431, 'Automatyczna', 'Benzyna', '2017-01-01', '2017-01-01', 2, 4, 300),
(11, 'AUD789456', 'Luksusowe', 'assets/images/audi_a7.png', 'Audi', 'A7', 2018, 3, 286, 'Automatyczna', 'Diesel', '2018-01-01', '2018-01-01', 5, 5, 280),
(12, 'MBZ321654', 'Kombi', 'assets/images/mercedes_cla.png', 'Mercedes-Benz', 'CLA', 2019, 2, 190, 'Automatyczna', 'Diesel', '2019-01-01', '2019-01-01', 5, 5, 190),
(13, 'VW987321', 'Kombi', 'assets/images/passat.png', 'Volkswagen', 'Passat', 2015, 1.8, 180, 'Automatyczna', 'Benzyna', '2015-01-01', '2015-01-01', 5, 5, 180),
(14, 'FIA654321', 'Nasze perełki', 'assets/images/maluch.jpg', 'Fiat', '126', 2000, 0.6, 211, 'Manualna', 'Benzyna', '2000-01-01', '2000-01-01', 2, 4, 10000),
(15, 'FIA321654', 'Nasze perełki', 'assets/images/multipla.jpg', 'Fiat', 'Multipla', 1999, 1.6, 103, 'Manualna', 'Benzyna', '1999-01-01', '1999-01-01', 5, 5, 15000);

-- --------------------------------------------------------

--
-- Table structure for table `pracownicy`
--

CREATE TABLE `pracownicy` (
  `ID_pracownika` int(11) NOT NULL,
  `pesel` varchar(11) NOT NULL,
  `ID_adresu` int(11) NOT NULL,
  `imie` text NOT NULL,
  `nazwisko` text NOT NULL,
  `stanowisko` text NOT NULL,
  `pensja` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `pracownicy`
--

INSERT INTO `pracownicy` (`ID_pracownika`, `pesel`, `ID_adresu`, `imie`, `nazwisko`, `stanowisko`, `pensja`) VALUES
(3, '0000000125', 2, 'Jean', 'Kowalski', 'niski szczebel', 1200);

-- --------------------------------------------------------

--
-- Table structure for table `program_lojalnosciowy`
--

CREATE TABLE `program_lojalnosciowy` (
  `ID_klienta` int(11) NOT NULL,
  `ilosc_wypozyczen` int(11) NOT NULL,
  `wartosc_wypozyczen` float NOT NULL,
  `rabat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rezerwacje`
--

CREATE TABLE `rezerwacje` (
  `ID_rezerwacji` int(11) NOT NULL,
  `ID_pracownika` int(11) NOT NULL,
  `ID_pojazdu` int(11) NOT NULL,
  `ID_klienta` int(11) NOT NULL,
  `od_kiedy` date NOT NULL,
  `do_kiedy` date DEFAULT NULL,
  `czy_zarezerwowany` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wypozyczenia`
--

CREATE TABLE `wypozyczenia` (
  `ID_wypozyczenia` int(11) NOT NULL,
  `ID_rezerwacji` int(11) NOT NULL,
  `ID_pojazdu` int(11) NOT NULL,
  `ID_klienta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adresy`
--
ALTER TABLE `adresy`
  ADD PRIMARY KEY (`ID_adresu`);

--
-- Indexes for table `historia_napraw_i_usterek`
--
ALTER TABLE `historia_napraw_i_usterek`
  ADD PRIMARY KEY (`ID_naprawy`),
  ADD KEY `FK_historia_ID_pojazdu` (`ID_pojazdu`),
  ADD KEY `FK_historia_ID_pracownika` (`ID_pracownika`);

--
-- Indexes for table `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`ID_klienta`),
  ADD UNIQUE KEY `pesel` (`pesel`),
  ADD KEY `FK_klienci_ID_adresu` (`ID_adresu`);

--
-- Indexes for table `pojazdy`
--
ALTER TABLE `pojazdy`
  ADD PRIMARY KEY (`ID_pojazdu`);

--
-- Indexes for table `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD PRIMARY KEY (`ID_pracownika`),
  ADD UNIQUE KEY `pesel` (`pesel`),
  ADD KEY `FK_pracownicy_ID_adresu` (`ID_adresu`);

--
-- Indexes for table `program_lojalnosciowy`
--
ALTER TABLE `program_lojalnosciowy`
  ADD KEY `FK_program_ID_klienta` (`ID_klienta`);

--
-- Indexes for table `rezerwacje`
--
ALTER TABLE `rezerwacje`
  ADD PRIMARY KEY (`ID_rezerwacji`),
  ADD KEY `FK_rezerwacje_ID_klienta` (`ID_klienta`),
  ADD KEY `FK_rezerwacje_ID_pojazdu` (`ID_pojazdu`),
  ADD KEY `FK_rezerwacje_ID_pracownika` (`ID_pracownika`);

--
-- Indexes for table `wypozyczenia`
--
ALTER TABLE `wypozyczenia`
  ADD PRIMARY KEY (`ID_wypozyczenia`),
  ADD KEY `FK_wypozyczenia_ID_rezerwacji` (`ID_rezerwacji`),
  ADD KEY `FK_wypozyczenia_ID_pojazdu` (`ID_pojazdu`),
  ADD KEY `FK_wypozyczenia_ID_klienta` (`ID_klienta`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adresy`
--
ALTER TABLE `adresy`
  MODIFY `ID_adresu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `historia_napraw_i_usterek`
--
ALTER TABLE `historia_napraw_i_usterek`
  MODIFY `ID_naprawy` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `klienci`
--
ALTER TABLE `klienci`
  MODIFY `ID_klienta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pojazdy`
--
ALTER TABLE `pojazdy`
  MODIFY `ID_pojazdu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `pracownicy`
--
ALTER TABLE `pracownicy`
  MODIFY `ID_pracownika` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rezerwacje`
--
ALTER TABLE `rezerwacje`
  MODIFY `ID_rezerwacji` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wypozyczenia`
--
ALTER TABLE `wypozyczenia`
  MODIFY `ID_wypozyczenia` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `historia_napraw_i_usterek`
--
ALTER TABLE `historia_napraw_i_usterek`
  ADD CONSTRAINT `FK_historia_ID_pojazdu` FOREIGN KEY (`ID_pojazdu`) REFERENCES `pojazdy` (`ID_pojazdu`),
  ADD CONSTRAINT `FK_historia_ID_pracownika` FOREIGN KEY (`ID_pracownika`) REFERENCES `pracownicy` (`ID_pracownika`);

--
-- Constraints for table `klienci`
--
ALTER TABLE `klienci`
  ADD CONSTRAINT `FK_klienci_ID_adresu` FOREIGN KEY (`ID_adresu`) REFERENCES `adresy` (`ID_adresu`);

--
-- Constraints for table `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD CONSTRAINT `FK_pracownicy_ID_adresu` FOREIGN KEY (`ID_adresu`) REFERENCES `adresy` (`ID_adresu`);

--
-- Constraints for table `program_lojalnosciowy`
--
ALTER TABLE `program_lojalnosciowy`
  ADD CONSTRAINT `FK_program_ID_klienta` FOREIGN KEY (`ID_klienta`) REFERENCES `klienci` (`ID_klienta`);

--
-- Constraints for table `rezerwacje`
--
ALTER TABLE `rezerwacje`
  ADD CONSTRAINT `FK_rezerwacje_ID_klienta` FOREIGN KEY (`ID_klienta`) REFERENCES `klienci` (`ID_klienta`),
  ADD CONSTRAINT `FK_rezerwacje_ID_pojazdu` FOREIGN KEY (`ID_pojazdu`) REFERENCES `pojazdy` (`ID_pojazdu`),
  ADD CONSTRAINT `FK_rezerwacje_ID_pracownika` FOREIGN KEY (`ID_pracownika`) REFERENCES `pracownicy` (`ID_pracownika`);

--
-- Constraints for table `wypozyczenia`
--
ALTER TABLE `wypozyczenia`
  ADD CONSTRAINT `FK_wypozyczenia_ID_klienta` FOREIGN KEY (`ID_klienta`) REFERENCES `klienci` (`ID_klienta`),
  ADD CONSTRAINT `FK_wypozyczenia_ID_pojazdu` FOREIGN KEY (`ID_pojazdu`) REFERENCES `pojazdy` (`ID_pojazdu`),
  ADD CONSTRAINT `FK_wypozyczenia_ID_rezerwacji` FOREIGN KEY (`ID_rezerwacji`) REFERENCES `rezerwacje` (`ID_rezerwacji`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
