<?php
$host="localhost";
$user="root";
$password="";
$database="js";

$polaczenie=mysqli_connect($host, $user, $password, $database);
	
if($polaczenie){
	mysqli_query($polaczenie, "SET CHARSET utf8");
    mysqli_query($polaczenie, "SET NAMES 'utf8' COLLATE 'utf8_polish_ci'");
	$sql1 = "SELECT * FROM koncerty WHERE koncerty.data<CURRENT_DATE ORDER BY data DESC LIMIT 10";
	$sql2 = "SELECT * FROM koncerty WHERE koncerty.data>CURRENT_DATE  ORDER BY data DESC LIMIT 10";
	$wynik1=mysqli_query($polaczenie, $sql1);
	$wynik2=mysqli_query($polaczenie, $sql2);
	
	
		if($wynik2){
		echo "Najbliższe koncerty:<br>";
		if ($wynik2->num_rows > 0){
			
		echo "<table>";
		while($wiersz2 = $wynik2->fetch_assoc())
		{
		echo "<tr class='reveal' ><td class='clr1'>".$wiersz2["data"]. "</td><td class='clr2'>" . $wiersz2["godzina"]. "</td><td class='clr1'>" . $wiersz2["nazwa"]. " " . $wiersz2["miejsce"]. " - " . $wiersz2["miejscowosc"]." </td><td class='clr2'>" .$wiersz2["wstep"]." </td><td><input title='Tymczasowo NIEDOSTĘPNE' type='button' value ='Pokaż lokalizację' class=button".$wiersz2["class"]."></td></tr>";
		}
		echo "</table>";
			
			
			
		}else echo "<b>Aktualnie brak zaplanowanych koncertów!</b><br>";
	}else echo "Błąd zapytania bazy danych!";
	
	
	
	if($wynik1){
		echo "Ostatnie koncerty:<br>";
		if ($wynik1->num_rows > 0){
			
		echo "<table>";
		while($wiersz = $wynik1->fetch_assoc())
		{
		echo "<tr><td class='clr1'>".$wiersz["data"]. "</td><td class='clr2'>" . $wiersz["godzina"]. "</td><td class='clr1'>" . $wiersz["nazwa"]. " " . $wiersz["miejsce"]. " - " . $wiersz["miejscowosc"]." </td><td class='clr2'>" .$wiersz["wstep"]." </td><td><input title='TYMCZASOWO NIEDOSTĘPNE'  type='button' value ='Pokaż lokalizację' class=button".$wiersz["class"]."></td></tr>";
		}
		echo "</table>";
			$polaczenie->close();
			
			
		}else echo "Brak koncertów!";
	}else echo "Błąd zapytania bazy danych!";
	

	
	
	
}else echo "Błąd połączenia z bazą danych!";
?>