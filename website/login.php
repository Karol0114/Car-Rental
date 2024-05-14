<?php

TUTAJ ROBIMY LOGOWANIE DO BAZY DANYCH

session_start();

$host="localhost";
$user="root";
$password="";
$database="podnapieciem";

		$imie=$_POST['email'];
		$nazwisko=$_POST['password'];


$sql="INSERT INTO wiadomosci VALUES (NULL, '$imie', '$nazwisko', '$email', '$temat', '$tresc', now())";
$connection=mysqli_connect($host,$user,$password,$database);


if($connection){
mysqli_query($connection, "SET CHARSET utf8");
mysqli_query($connection, "SET NAMES 'utf8' COLLATE 'utf8_polish_ci'");
$result=mysqli_query($connection, $sql);
	if($result){
		$_SESSION['status']="Twoja wiadomość została wysłana! Wkrótce odpowiemy!";
		$connection->close();
		header('Location: kontakt.php');
	}else $_SESSION['status']="Błąd zapytania!"; $connection->close();header('Location: kontakt.php');
}else $_SESSION['status']="Brak połączenia z bazą danych!"; $connection->close(); header('Location: kontakt.php');
?>