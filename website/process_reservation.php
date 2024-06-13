<?php

session_start();

$host = "localhost";
$user = "root";
$password = "";
$database = "wypozyczalnia";
$polaczenie = mysqli_connect($host, $user, $password, $database);

if (!isset($_SESSION['customer_id'])){
		echo "Aby dokonać rejestracji musisz się zalogować!";
		$_SESSION['status'] = "Aby dokonać rejestracji musisz się zalogować!";
	}

if (!$polaczenie) {
    die("Błąd połączenia z bazą danych: " . mysqli_connect_error());
}
$customer_id = $_SESSION['customer_id'];
$name = $_POST['name'];
$email = $_POST['email'];
$phone = $_POST['phone'];
$start_date = $_POST['start_date'];
$end_date = $_POST['end_date'];
$marka = $_POST['marka'];
$model = $_POST['model'];

$sql_check_availability = "SELECT * FROM rezerwacje WHERE ID_pojazdu = (
    SELECT ID_pojazdu FROM pojazdy WHERE marka = '$marka' AND model = '$model'
) AND (
    ('$start_date' BETWEEN od_kiedy AND do_kiedy)
    OR ('$end_date' BETWEEN od_kiedy AND do_kiedy)
    OR (od_kiedy BETWEEN '$start_date' AND '$end_date')
    OR (do_kiedy BETWEEN '$start_date' AND '$end_date')
)";
$result_check_availability = mysqli_query($polaczenie, $sql_check_availability);

if (mysqli_num_rows($result_check_availability) > 0) {
    echo "Wybrany pojazd jest już zarezerwowany w wybranym terminie. Prosimy wybrać inne daty.";
	$_SESSION['status'] = "Wybrany pojazd jest już zarezerwowany w wybranym terminie. Prosimy wybrać inne daty.";
} else {
    $sql_insert_reservation = "INSERT INTO rezerwacje (ID_pracownika, ID_pojazdu, od_kiedy, do_kiedy, czy_zarezerwowany, ID_klienta) VALUES (1,
        (SELECT ID_pojazdu FROM pojazdy WHERE marka = '$marka' AND model = '$model'),
        '$start_date',
        '$end_date',
        1,
		'$customer_id'
    )";

    if (mysqli_query($polaczenie, $sql_insert_reservation)) {
        $id_pojazdu = mysqli_insert_id($polaczenie);
        
        echo "Rezerwacja zakończona pomyślnie!";
			$_SESSION['status'] = "Rezerwacja zakończona pomyślnie!";
			header('Location: user.php');
    } else {
        echo "Błąd podczas rezerwacji: " . mysqli_error($polaczenie);
    }
}

mysqli_close($polaczenie);
header('Location: cars.php');
?>
