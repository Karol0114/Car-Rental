<?php
session_start();

$host="localhost";
$user="root";
$password="";
$database="wypozyczalnia";

		$imie=$_POST['email'];
		$nazwisko=$_POST['password'];


$sql="SELECT * FROM uzytkownicy WHERE email=$_POST['email'] and password=$_POST['password']";
$connection=mysqli_connect($host,$user,$password,$database);




if($connection){
mysqli_query($connection, "SET CHARSET utf8");
mysqli_query($connection, "SET NAMES 'utf8' COLLATE 'utf8_polish_ci'");
$result=mysqli_query($connection, $sql);
	if($result->num_rows = 1){
		$_SESSION['status']="Zalogowano pomyślnie!";
		$connection->close();
		header('Location: index.php');
	}else $_SESSION['status']="Błędny login lub hasło!"; $connection->close();header('Location: index.php');
}else $_SESSION['status']="Brak połączenia z bazą danych!"; $connection->close(); header('Location: index.php');
?>