<?php
// Establish connection to the database
$host = "localhost";
$user = "root";
$password = "";
$database = "wypozyczalnia";
$polaczenie = mysqli_connect($host, $user, $password, $database);

// Check if the connection is successful
if (!$polaczenie) {
    die("Błąd połączenia z bazą danych: " . mysqli_connect_error());
}

// Get the reservation details from the form
$name = $_POST['name'];
$email = $_POST['email'];
$phone = $_POST['phone'];
$start_date = $_POST['start_date'];
$end_date = $_POST['end_date'];
$marka = $_POST['marka'];
$model = $_POST['model'];

// Check if the selected vehicle is available for the specified dates
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
} else {
    // If the vehicle is available, insert the reservation into the database
    $sql_insert_reservation = "INSERT INTO rezerwacje (ID_pojazdu, od_kiedy, do_kiedy, czy_zarezerwowany) VALUES (
        (SELECT ID_pojazdu FROM pojazdy WHERE marka = '$marka' AND model = '$model'),
        '$start_date',
        '$end_date',
        1
    )";

    if (mysqli_query($polaczenie, $sql_insert_reservation)) {
        $id_pojazdu = mysqli_insert_id($polaczenie); // Get the ID of the inserted reservation
        // Now, you can proceed with other details like adding ID_klienta or handling it as per your application's logic
        
        echo "Rezerwacja zakończona pomyślnie!";
    } else {
        echo "Błąd podczas rezerwacji: " . mysqli_error($polaczenie);
    }
}

// Close the database connection
mysqli_close($polaczenie);
?>
