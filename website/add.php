<?php

$servername = "localhost"; 
$username = "root";        
$password = "";             
$dbname = "wypozyczalnia";  

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get form data and escape to prevent SQL injection
$imie = $_POST['imie'];
$nazwisko = $_POST['nazwisko'];
$email = $_POST['email'];
$tresc = $_POST['tresc'];

// Construct the SQL query
$sql = "INSERT INTO wiadomosci (imie, nazwisko, email, tresc) VALUES ('$imie', '$nazwisko', '$email', '$tresc')";

// Execute the query
if ($conn->query($sql) === TRUE) {
    echo "Dane zostały pomyślnie dodane do bazy danych.";
} else {
    echo "Błąd: " . $conn->error;
}

// Close connection
$conn->close();
?>
