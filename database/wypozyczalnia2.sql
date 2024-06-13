-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 13 Cze 2024, 21:42
-- Wersja serwera: 10.4.14-MariaDB
-- Wersja PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `wypozyczalnia`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `adresy`
--

CREATE TABLE `adresy` (
  `ID_adresu` int(11) NOT NULL,
  `miasto` text COLLATE utf8mb4_polish_ci NOT NULL,
  `ulica` text COLLATE utf8mb4_polish_ci NOT NULL,
  `numer` text COLLATE utf8mb4_polish_ci NOT NULL,
  `kod_pocztowy` text COLLATE utf8mb4_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `adresy`
--

INSERT INTO `adresy` (`ID_adresu`, `miasto`, `ulica`, `numer`, `kod_pocztowy`) VALUES
(1, 'Piekary Śląskie', 'Jesienna', '20', '41-943'),
(2, 'Katowice', 'Piękna', '10/2', '41-500'),
(3, 'Tarnowskie Góry', 'Mikołaja Reja', '8a', '42-600');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `historia_napraw_i_usterek`
--

CREATE TABLE `historia_napraw_i_usterek` (
  `ID_naprawy` int(11) NOT NULL,
  `ID_pojazdu` int(11) NOT NULL,
  `ID_pracownika` int(11) NOT NULL,
  `opis_usterki` text COLLATE utf8mb4_polish_ci NOT NULL,
  `data_usterki` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `data_naprawy` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `ID_klienta` int(11) NOT NULL,
  `pesel` varchar(11) COLLATE utf8mb4_polish_ci NOT NULL,
  `ID_adresu` int(11) NOT NULL,
  `imie` text COLLATE utf8mb4_polish_ci NOT NULL,
  `nazwisko` text COLLATE utf8mb4_polish_ci NOT NULL,
  `od_kiedy_prawo_jazdy` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `klienci`
--

INSERT INTO `klienci` (`ID_klienta`, `pesel`, `ID_adresu`, `imie`, `nazwisko`, `od_kiedy_prawo_jazdy`) VALUES
(4, '000000123', 1, 'Oscar', 'Czempiel', '2024-05-01'),
(5, '01251111111', 3, 'Dawid', 'Pudlik', '2019-05-13');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pojazdy`
--

CREATE TABLE `pojazdy` (
  `ID_pojazdu` int(11) NOT NULL,
  `numer_rejestracyjny` varchar(10) COLLATE utf8mb4_polish_ci NOT NULL,
  `kategoria` varchar(15) COLLATE utf8mb4_polish_ci NOT NULL,
  `zdjecie` text COLLATE utf8mb4_polish_ci NOT NULL,
  `marka` text COLLATE utf8mb4_polish_ci NOT NULL,
  `model` text COLLATE utf8mb4_polish_ci NOT NULL,
  `rok_produkcji` int(5) NOT NULL,
  `pojemnosc_silnika` float NOT NULL,
  `KM` int(11) NOT NULL,
  `skrzynia_biegow` varchar(20) COLLATE utf8mb4_polish_ci NOT NULL,
  `rodzaj_paliwa` text COLLATE utf8mb4_polish_ci NOT NULL,
  `ubezpieczenie` date NOT NULL,
  `przeglad` date NOT NULL,
  `ilosc_drzwi` int(11) NOT NULL,
  `ilosc_siedzen` int(3) NOT NULL,
  `cena_za_dobe` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `pojazdy`
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
-- Struktura tabeli dla tabeli `pracownicy`
--

CREATE TABLE `pracownicy` (
  `ID_pracownika` int(11) NOT NULL,
  `pesel` varchar(11) COLLATE utf8mb4_polish_ci NOT NULL,
  `ID_adresu` int(11) NOT NULL,
  `imie` text COLLATE utf8mb4_polish_ci NOT NULL,
  `nazwisko` text COLLATE utf8mb4_polish_ci NOT NULL,
  `stanowisko` text COLLATE utf8mb4_polish_ci NOT NULL,
  `pensja` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `pracownicy`
--

INSERT INTO `pracownicy` (`ID_pracownika`, `pesel`, `ID_adresu`, `imie`, `nazwisko`, `stanowisko`, `pensja`) VALUES
(1, '11111111111', 3, 'online', 'online', 'online', 0),
(3, '0000000125', 2, 'Jean', 'Kowalski', 'niski szczebel', 1200),
(7, '01251111111', 3, 'Dawid', 'Pudlik', 'Utrzymanie ruchu', 3500);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `program_lojalnosciowy`
--

CREATE TABLE `program_lojalnosciowy` (
  `ID_klienta` int(11) NOT NULL,
  `ilosc_wypozyczen` int(11) NOT NULL,
  `wartosc_wypozyczen` float NOT NULL,
  `rabat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rezerwacje`
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

--
-- Zrzut danych tabeli `rezerwacje`
--

INSERT INTO `rezerwacje` (`ID_rezerwacji`, `ID_pracownika`, `ID_pojazdu`, `ID_klienta`, `od_kiedy`, `do_kiedy`, `czy_zarezerwowany`) VALUES
(1, 7, 14, 4, '2024-05-01', '2024-05-16', 1),
(2, 3, 7, 5, '2024-05-01', '2024-05-31', 1),
(13, 1, 6, 5, '2024-06-21', '2024-07-06', 1),
(14, 1, 6, 5, '2024-07-07', '2024-08-04', 1),
(15, 1, 6, 5, '2024-09-13', '2024-11-22', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownicy`
--

CREATE TABLE `uzytkownicy` (
  `id_uzytkownika` int(11) NOT NULL,
  `login` varchar(40) COLLATE utf8_polish_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `haslo` varchar(300) COLLATE utf8_polish_ci NOT NULL,
  `data_utworzenia` date NOT NULL,
  `pracownik_id` int(11) DEFAULT NULL,
  `klient_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `uzytkownicy`
--

INSERT INTO `uzytkownicy` (`id_uzytkownika`, `login`, `email`, `haslo`, `data_utworzenia`, `pracownik_id`, `klient_id`) VALUES
(1, 'dawid.pudlik', 'dawid.pudlik@gsuite.us.edu.pl', 'qwerty', '2024-05-05', 7, 5);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wypozyczenia`
--

CREATE TABLE `wypozyczenia` (
  `ID_wypozyczenia` int(11) NOT NULL,
  `ID_rezerwacji` int(11) NOT NULL,
  `ID_pojazdu` int(11) NOT NULL,
  `ID_klienta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zapytania`
--

CREATE TABLE `zapytania` (
  `id` int(11) NOT NULL,
  `imie` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `tresc` text COLLATE utf8_polish_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `zapytania`
--

INSERT INTO `zapytania` (`id`, `imie`, `nazwisko`, `email`, `tresc`, `created_at`) VALUES
(1, 'Dawid', 'Pudlik', 'dawidp0511@wp.pl', 'qwerweqweeqwqwe', '2024-06-13 19:41:11'),
(2, 'Dawid', 'Pudlik', 'dawidp0511@wp.pl', 'qwerweqweeqwqwe', '2024-06-13 19:42:04'),
(3, 'Dawid', 'Sikora', 'pawelp337@wp.pl', 'qweqweeqwqew', '2024-06-13 19:42:22');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `adresy`
--
ALTER TABLE `adresy`
  ADD PRIMARY KEY (`ID_adresu`);

--
-- Indeksy dla tabeli `historia_napraw_i_usterek`
--
ALTER TABLE `historia_napraw_i_usterek`
  ADD PRIMARY KEY (`ID_naprawy`),
  ADD KEY `FK_historia_ID_pojazdu` (`ID_pojazdu`),
  ADD KEY `FK_historia_ID_pracownika` (`ID_pracownika`);

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`ID_klienta`),
  ADD UNIQUE KEY `pesel` (`pesel`),
  ADD KEY `FK_klienci_ID_adresu` (`ID_adresu`);

--
-- Indeksy dla tabeli `pojazdy`
--
ALTER TABLE `pojazdy`
  ADD PRIMARY KEY (`ID_pojazdu`);

--
-- Indeksy dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD PRIMARY KEY (`ID_pracownika`),
  ADD UNIQUE KEY `pesel` (`pesel`),
  ADD KEY `FK_pracownicy_ID_adresu` (`ID_adresu`);

--
-- Indeksy dla tabeli `program_lojalnosciowy`
--
ALTER TABLE `program_lojalnosciowy`
  ADD KEY `FK_program_ID_klienta` (`ID_klienta`);

--
-- Indeksy dla tabeli `rezerwacje`
--
ALTER TABLE `rezerwacje`
  ADD PRIMARY KEY (`ID_rezerwacji`),
  ADD KEY `FK_rezerwacje_ID_klienta` (`ID_klienta`),
  ADD KEY `FK_rezerwacje_ID_pojazdu` (`ID_pojazdu`),
  ADD KEY `FK_rezerwacje_ID_pracownika` (`ID_pracownika`);

--
-- Indeksy dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  ADD PRIMARY KEY (`id_uzytkownika`),
  ADD KEY `fk_pracownik` (`pracownik_id`),
  ADD KEY `fk_klient` (`klient_id`);

--
-- Indeksy dla tabeli `wypozyczenia`
--
ALTER TABLE `wypozyczenia`
  ADD PRIMARY KEY (`ID_wypozyczenia`),
  ADD KEY `FK_wypozyczenia_ID_rezerwacji` (`ID_rezerwacji`),
  ADD KEY `FK_wypozyczenia_ID_pojazdu` (`ID_pojazdu`),
  ADD KEY `FK_wypozyczenia_ID_klienta` (`ID_klienta`);

--
-- Indeksy dla tabeli `zapytania`
--
ALTER TABLE `zapytania`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `adresy`
--
ALTER TABLE `adresy`
  MODIFY `ID_adresu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `historia_napraw_i_usterek`
--
ALTER TABLE `historia_napraw_i_usterek`
  MODIFY `ID_naprawy` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `klienci`
--
ALTER TABLE `klienci`
  MODIFY `ID_klienta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `pojazdy`
--
ALTER TABLE `pojazdy`
  MODIFY `ID_pojazdu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  MODIFY `ID_pracownika` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `rezerwacje`
--
ALTER TABLE `rezerwacje`
  MODIFY `ID_rezerwacji` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  MODIFY `id_uzytkownika` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `wypozyczenia`
--
ALTER TABLE `wypozyczenia`
  MODIFY `ID_wypozyczenia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `zapytania`
--
ALTER TABLE `zapytania`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `historia_napraw_i_usterek`
--
ALTER TABLE `historia_napraw_i_usterek`
  ADD CONSTRAINT `FK_historia_ID_pojazdu` FOREIGN KEY (`ID_pojazdu`) REFERENCES `pojazdy` (`ID_pojazdu`),
  ADD CONSTRAINT `FK_historia_ID_pracownika` FOREIGN KEY (`ID_pracownika`) REFERENCES `pracownicy` (`ID_pracownika`);

--
-- Ograniczenia dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD CONSTRAINT `FK_klienci_ID_adresu` FOREIGN KEY (`ID_adresu`) REFERENCES `adresy` (`ID_adresu`);

--
-- Ograniczenia dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD CONSTRAINT `FK_pracownicy_ID_adresu` FOREIGN KEY (`ID_adresu`) REFERENCES `adresy` (`ID_adresu`);

--
-- Ograniczenia dla tabeli `program_lojalnosciowy`
--
ALTER TABLE `program_lojalnosciowy`
  ADD CONSTRAINT `FK_program_ID_klienta` FOREIGN KEY (`ID_klienta`) REFERENCES `klienci` (`ID_klienta`);

--
-- Ograniczenia dla tabeli `rezerwacje`
--
ALTER TABLE `rezerwacje`
  ADD CONSTRAINT `FK_rezerwacje_ID_klienta` FOREIGN KEY (`ID_klienta`) REFERENCES `klienci` (`ID_klienta`),
  ADD CONSTRAINT `FK_rezerwacje_ID_pojazdu` FOREIGN KEY (`ID_pojazdu`) REFERENCES `pojazdy` (`ID_pojazdu`),
  ADD CONSTRAINT `FK_rezerwacje_ID_pracownika` FOREIGN KEY (`ID_pracownika`) REFERENCES `pracownicy` (`ID_pracownika`);

--
-- Ograniczenia dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  ADD CONSTRAINT `fk_klient` FOREIGN KEY (`klient_id`) REFERENCES `klienci` (`ID_klienta`),
  ADD CONSTRAINT `fk_pracownik` FOREIGN KEY (`pracownik_id`) REFERENCES `pracownicy` (`ID_pracownika`);

--
-- Ograniczenia dla tabeli `wypozyczenia`
--
ALTER TABLE `wypozyczenia`
  ADD CONSTRAINT `FK_wypozyczenia_ID_klienta` FOREIGN KEY (`ID_klienta`) REFERENCES `klienci` (`ID_klienta`),
  ADD CONSTRAINT `FK_wypozyczenia_ID_pojazdu` FOREIGN KEY (`ID_pojazdu`) REFERENCES `pojazdy` (`ID_pojazdu`),
  ADD CONSTRAINT `FK_wypozyczenia_ID_rezerwacji` FOREIGN KEY (`ID_rezerwacji`) REFERENCES `rezerwacje` (`ID_rezerwacji`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
