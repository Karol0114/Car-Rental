<?php
session_start();

$host = "localhost";
$user = "root";
$password = "";
$database = "wypozyczalnia";

$email = $_POST['email']; // Assuming email is used as username
$pwd = $_POST['password']; // Assuming password

$sql = "SELECT * FROM uzytkownicy WHERE email='$email' AND haslo='$pwd'";
$connection = mysqli_connect($host, $user, $password, $database);

if ($connection) {
    mysqli_query($connection, "SET CHARSET utf8");
    mysqli_query($connection, "SET NAMES 'utf8' COLLATE 'utf8_polish_ci'");
    $result = mysqli_query($connection, $sql);
    
    if ($result->num_rows == 1) {
        $row = $result->fetch_assoc();
        $_SESSION['user_id'] = $row['id_uzytkownika']; // Store user ID in session
		$_SESSION['customer_id'] = $row['klient_id']; // Store user ID in session
        $_SESSION['first_name'] = $row['imie']; // Store first name in session
        $_SESSION['last_name'] = $row['nazwisko']; // Store last name in session
        $_SESSION['email'] = $row['email']; // Store email in session
        $_SESSION['status'] = "Zalogowano pomyślnie!";
        $connection->close();
        header('Location: index.php');
    } else {
        $_SESSION['status'] = "Błędny login lub hasło!";
        $connection->close();
        header('Location: index.php');
    }
} else {
    $_SESSION['status'] = "Brak połączenia z bazą danych!";
    header('Location: index.php');
}
?>
