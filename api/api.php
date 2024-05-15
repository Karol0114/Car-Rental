<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');

$host = 'localhost'; // MySQL server address
$dbname = 'wypozyczalnia'; // Database name
$username = 'root'; // MySQL username
$password = ''; // MySQL password

try {
    // Create a connection to the database
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Get parameters from the GET request
    $type = isset($_GET['type']) ? $_GET['type'] : '';
    $search = isset($_GET['search']) ? $_GET['search'] : '';

    // Prepare the SQL query
    if (!empty($search)) {
        $query = "SELECT marka, model, zdjecie, rok_produkcji, KM, rodzaj_paliwa, pojemnosc_silnika, ilosc_siedzen, ilosc_drzwi, skrzynia_biegow, cena_za_dobe 
                  FROM pojazdy 
                  WHERE marka LIKE :search1 OR model LIKE :search2";
        $stmt = $pdo->prepare($query);
        $searchParam1 = "%$search%";
        $searchParam2 = "%$search%";
        $stmt->bindParam(':search1', $searchParam1, PDO::PARAM_STR);
        $stmt->bindParam(':search2', $searchParam2, PDO::PARAM_STR);
    } elseif (!empty($type)) {
        $query = "SELECT marka, model, zdjecie, rok_produkcji, KM, rodzaj_paliwa, pojemnosc_silnika, ilosc_siedzen, ilosc_drzwi, skrzynia_biegow, cena_za_dobe 
                  FROM pojazdy 
                  WHERE kategoria = :type";
        $stmt = $pdo->prepare($query);
        $stmt->bindParam(':type', $type, PDO::PARAM_STR);
    } else {
        throw new Exception('Invalid request parameters');
    }

    // Execute the query
    $stmt->execute();
    $cars = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Return the results as JSON
    echo json_encode($cars);
} catch (PDOException $e) {
    echo json_encode(['error' => $e->getMessage()]);
} catch (Exception $e) {
    echo json_encode(['error' => $e->getMessage()]);
}
