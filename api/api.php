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

    if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_GET['action']) && $_GET['action'] == 'reserve') {
        // Pobieranie danych z formularza
        $pesel = $_POST['pesel'];
        $imie = $_POST['imie'];
        $nazwisko = $_POST['nazwisko'];
        $prawo_jazdy_od = $_POST['prawo_jazdy_od'];
        $miasto = $_POST['miasto'];
        $ulica = $_POST['ulica'];
        $numer = $_POST['numer'];
        $kod_pocztowy = $_POST['kod_pocztowy'];
        $ID_Pojazdu = $_POST['ID_Pojazdu'];
        $od_kiedy = $_POST['od_kiedy'];
        $do_kiedy = $_POST['do_kiedy'];

        // Dodawanie adresu
        $addressInsert = $pdo->prepare("INSERT INTO adresy (miasto, ulica, numer, kod_pocztowy) VALUES (?, ?, ?, ?)");
        $addressInsert->execute([$miasto, $ulica, $numer, $kod_pocztowy]);
        $ID_adresu = $pdo->lastInsertId(); // Pobranie ID nowo dodanego adresu

        // Dodawanie klienta
        $clientInsert = $pdo->prepare("INSERT INTO klienci (pesel, ID_adresu, imie, nazwisko, od_kiedy_prawo_jazdy) VALUES (?, ?, ?, ?, ?)");
        $clientInsert->execute([$pesel, $ID_adresu, $imie, $nazwisko, $prawo_jazdy_od]);
        $ID_Klienta = $pdo->lastInsertId(); // Pobranie ID nowo dodanego klienta

        // Dodawanie rezerwacji
        $reservationInsert = $pdo->prepare("INSERT INTO rezerwacje (ID_pracownika, ID_pojazdu, ID_klienta, od_kiedy, do_kiedy, czy_zarezerwowany) VALUES (?, ?, ?, ?, ?, ?)");
        $reservationInsert->execute([3,$ID_Pojazdu, $ID_Klienta, $od_kiedy, $do_kiedy, 1]);

        echo json_encode(['message' => 'Rezerwacja zakończona sukcesem']);
    }

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
