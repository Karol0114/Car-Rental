<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');

$host = 'localhost'; // Adres serwera MySQL
$dbname = 'wypozyczalnia'; // Nazwa bazy danych
$username = 'root'; // Nazwa użytkownika
$password = ''; // Hasło

try {
    // Tworzenie połączenia z bazą danych
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Pobranie typu samochodu z parametrów GET
    $type = isset($_GET['type']) ? $_GET['type'] : '';

    // Zapytanie SQL do pobrania danych o samochodach
    $query = "SELECT marka, model, zdjecie, rok_produkcji, KM, rodzaj_paliwa, pojemnosc_silnika, ilosc_siedzen, ilosc_drzwi, skrzynia_biegow, cena_za_dobe FROM pojazdy WHERE kategoria = :type";
    $stmt = $pdo->prepare($query);
    $stmt->bindParam(':type', $type, PDO::PARAM_STR);
    $stmt->execute();

    $cars = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Zwracanie danych w formacie JSON
    echo json_encode($cars);
} catch (PDOException $e) {
    echo json_encode(['error' => $e->getMessage()]);
}
