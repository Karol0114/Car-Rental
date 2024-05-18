<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');

$host = 'localhost'; // MySQL server address
$dbname = 'wypozyczalnia'; // Database name
$username = 'root'; // MySQL username
$password = ''; // MySQL password

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $type = isset($_GET['type']) ? $_GET['type'] : '';
    $search = isset($_GET['search']) ? $_GET['search'] : '';
    $startDay = isset($_GET['startDay']) ? $_GET['startDay'] : '';
    $endDay = isset($_GET['endDay']) ? $_GET['endDay'] : '';

    $params = [];
    $conditions = [];
    $query = "SELECT marka, model, zdjecie, rok_produkcji, KM, rodzaj_paliwa, pojemnosc_silnika, ilosc_siedzen, ilosc_drzwi, skrzynia_biegow, cena_za_dobe FROM pojazdy";

    if (!empty($search)) {
        $conditions[] = "(marka LIKE :search OR model LIKE :search)";
        $params[':search'] = "%$search%";
    }

    if (!empty($type)) {
        $conditions[] = "kategoria = :type";
        $params[':type'] = $type;
    }

    if (!empty($startDay) && !empty($endDay)) {
        $query = "SELECT p.* FROM pojazdy p
        LEFT JOIN rezerwacje r ON p.ID_Pojazdu = r.ID_Pojazdu AND (r.od_kiedy <= :startDay AND r.do_kiedy >= :endDay)
        WHERE (r.czy_zarezerwowany IS NULL OR r.czy_zarezerwowany = FALSE) OR r.ID_Pojazdu IS NULL
        GROUP BY p.ID_Pojazdu";
        $params[':startDay'] = $startDay;
        $params[':endDay'] = $endDay;
        print_r("Start Day: " . $startDay);
        print_r("EndDay: " . $endDay);
    }

    if (!empty($conditions)) {
        $query .= " WHERE " . implode(' AND ', $conditions);
    }

    $stmt = $pdo->prepare($query);
    foreach ($params as $key => &$val) {
        $stmt->bindParam($key, $val);
    }

    $stmt->execute();
    $cars = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($cars);
} catch (PDOException $e) {
    echo json_encode(['error' => $e->getMessage()]);
} catch (Exception $e) {
    echo json_encode(['error' => $e->getMessage()]);
}
