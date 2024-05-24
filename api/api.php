<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');

$host = 'localhost';
$dbname = 'wypozyczalnia';
$username = 'root';
$password = '';

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
        LEFT JOIN rezerwacje r ON p.ID_Pojazdu = r.ID_Pojazdu AND (r.od_kiedy <= :endDay AND r.do_kiedy >= :startDay)
        WHERE (r.ID_Pojazdu IS NULL) OR (r.czy_zarezerwowany = FALSE)";

        $params[':startDay'] = $startDay;
        $params[':endDay'] = $endDay;
    }

    if (!empty($conditions)) {
        $query .= " WHERE " . implode(' AND ', $conditions);
    }

    // Debugging before prepare
    error_log(print_r(['query' => $query, 'params' => $params], true));

    $stmt = $pdo->prepare($query);

    // Binding parameters
    foreach ($params as $key => $val) {
        error_log("Binding: $key => $val");
        $stmt->bindValue($key, $val);
    }

    $stmt->execute();
    $cars = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if (empty($cars)) {
        echo json_encode(['message' => 'No cars found']);
    } else {
        echo json_encode($cars);
    }
} catch (PDOException $e) {
    error_log("PDOException: " . $e->getMessage());
    echo json_encode(['error' => $e->getMessage()]);
} catch (Exception $e) {
    error_log("Exception: " . $e->getMessage());
    echo json_encode(['error' => $e->getMessage()]);
}
