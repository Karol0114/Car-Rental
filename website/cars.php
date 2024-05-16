<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>AutoDOK wypożyczalnia pojazdów</title>
	
	<link rel="shortcut icon" href="../grafika/favicon/favicon_round.ico">
	<link href="https://fonts.googleapis.com/css?family=Aldrich|Bangers|Bebas+Neue|Black+Ops+One|Changa|Concert+One|Fredoka+One|Indie+Flower|Lacquer|Neucha|Odibee+Sans|Permanent+Marker|Raleway|Righteous|Squada+One|Teko|Trade+Winds|Yeon+Sung|ZCOOL+QingKe+HuangYou&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="css/css/fontello.css" type="text/css" >
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="./css/style.css">


</head>
<style>

/* Define styles for the table */
table {
    width: 100%;
    border-collapse: collapse;
	margin-top:50px;
}

/* Define alternating row colors */
tr:nth-child(even) {
    background-color: #f2f2f2; /* Light gray */
}

tr:nth-child(odd) {
    background-color: #ffffff; /* White */
}

/* Define styles for table cells */
td {
    padding: 8px;
    border: 1px solid #ddd; /* Light gray border */
}

/* Specific cell colors based on your PHP class assignments */
.clr1 {
    color: #0066cc; /* Blue */
}

.clr2 {
    color: #cc6600; /* Orange */
}



</style>

<header>

	<nav class="navbar navbar-dark navbar-expand-lg">
	<a class="navbar-brand" href="index.php#"><img class="logo" src="../grafika/autodok_logo_round.png" alt="AutoDOK" ></a>
	
	<div class="icons" align="center">
	Znajdź nas na:<br>
	
			<!--Odnośmik fanpage--><a id="blink" href="https://www.facebook.com/profile.php?id=61557221683378" target="blank" title="Fanpage" > <i class="icon-facebook-official"></i></a>
			<!--Odnośmik Kanał YT--><a id="blink" href="https://www.youtube.com/channel/UCGKKkhTzRmWEAg2ea_nUlNQ" target="blank" title="Kanał YouTube" ><i class="icon-youtube"></i></a>
			<!--Odnośmik Instagram--><a id="blink" href="" target="blank" title="Instagram"  onclick="alert('Tutaj miał być instagram :)');"><i class="icon-instagram"></i></a>
			<!--mail --><a id="blink" href="" target="blank" title="mail"  onclick="alert('Tutaj miał być blog :)');"><i class="icon-mail"></i></a>
	
	</div>
	
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#menu" aria-controls="menu" aria-expanded="false" aria-label="switch">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="menu">
		<ul class="navbar-nav ml-auto mr-md-5">
		<li class="nav-item"><a class="nav-link" href="index.php#video">Jak wynająć?</a></li>
		<li class="nav-item"><a class="nav-link" href="index.php#popup-box">Promocje</a></li>
		<li class="nav-item"><a class="nav-link" href="index.php#about">O nas</a></li>
		<li class="nav-item"><a class="nav-link" href="index.php#contact">Kontakt</a></li>
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" role="button" aria-expanded="flase" id="submenu" aria-haspopup="true">Do pobrania</a>
	<div class="dropdown-menu " aria-labelledby="submenu" >
	<a class="dropdown-item" href="../dokumenty/warunki_najmu.pdf">WARUNKI NAJMU</a>
	<a class="dropdown-item" href="../dokumenty/regulamin_promocji.pdf">REGUALMIN PROMOCJI</a>
	<a class="dropdown-item" href="../dokumenty/penomocnictwo.pdf">PEŁNOMOCNICTWO</a>
	<a class="dropdown-item" href="../dokumenty/umowa_wstepna.pdf">UMOWA WSTĘPNA</a>
	</div>
	</li>
	<li class="nav-item"><a class="nav-link" href="cars.php">NASZE POJAZDY</a></li>
	<?php
	
	
	
	if (!isset($_SESSION['user'])){
	echo '<li class="nav-item"><a class="nav-link" href="#login-box">logowanie</a></li>';
	}else{
	echo '<li class="nav-item"><a class="nav-link" href="user.php">Twoje konto</a></li>';
	}
	
	
	
	?>
		</ul>
	</div>
	</nav>
</header>




<?php
$host = "localhost";
$user = "root";
$password = "";
$database = "wypozyczalnia";

$polaczenie = mysqli_connect($host, $user, $password, $database);

if ($polaczenie) {
    mysqli_query($polaczenie, "SET CHARSET utf8");
    mysqli_query($polaczenie, "SET NAMES 'utf8' COLLATE 'utf8_polish_ci'");
    $sql1 = "SELECT * FROM pojazdy";
    $wynik1 = mysqli_query($polaczenie, $sql1);

    if ($wynik1) {
        echo "<h1>Nasze pojazdy:</h1><a href='index.php'>Strona główna</a><br>";
        if ($wynik1->num_rows > 0) {
            echo "<table>";
            while ($wiersz = $wynik1->fetch_assoc()) {
                echo "<tr>";
				echo "<td class='clr1'><img width='40%' src='" . $wiersz["zdjecie"] . "'></td>";
                echo "<td class='clr1'>" . $wiersz["marka"] . "</td>";
                echo "<td class='clr2'>" . $wiersz["model"] . "</td>";
                echo "<td class='clr1'>" . $wiersz["rok_produkcji"] . "</td>";
                echo "<td class='clr2'>silnik " . $wiersz["pojemnosc_silnika"] . " L " . $wiersz["KM"] . " KM</td>";
                echo "<td>Cena: " . $wiersz["cena_za_dobe"] . " zł/doba</td>";
                echo "</tr>";
            }
            echo "</table>";
            $polaczenie->close();
        } else {
            echo "Brak pojazdów!";
        }
    } else {
        echo "Błąd zapytania bazy danych!";
    }
} else {
    echo "Błąd połączenia z bazą danych!";
}
?>
