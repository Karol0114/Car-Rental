<?php
session_start();


if (!isset($_SESSION['user_id'])) {
    header('Location: index.php');
    exit;
}

$host = "localhost";
$user = "root";
$password = "";
$database = "wypozyczalnia";

$userId = $_SESSION['user_id'];
$customerId = $_SESSION['customer_id'];


$connection = mysqli_connect($host, $user, $password, $database);


if (!$connection) {
    die("Błąd połączenia z bazą danych: " . mysqli_connect_error());
}


$reservations = [];
$sql_reservations = "SELECT * FROM rezerwacje INNER JOIN pojazdy ON rezerwacje.ID_pojazdu = pojazdy.ID_pojazdu WHERE ID_klienta = $customerId";
$result_reservations = mysqli_query($connection, $sql_reservations);

if ($result_reservations) {
    while ($row = mysqli_fetch_assoc($result_reservations)) {
        $reservations[] = $row;
    }
} else {
    echo "Błąd pobierania danych: " . mysqli_error($connection);
}


$lastRental = [];
$sql_last_rental = "SELECT * FROM wypozyczenia WHERE ID_klienta = $customerId";
$result_last_rental = mysqli_query($connection, $sql_last_rental);

if ($result_last_rental) {
    $lastRental = mysqli_fetch_assoc($result_last_rental);
} else {
    echo "Błąd pobierania danych: " . mysqli_error($connection);
}


mysqli_close($connection);
if (isset($_SESSION['status'])) {
    echo '<script>alert("' . $_SESSION['status'] . '");</script>';
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Panel</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/css/fontello.css" type="text/css" >
	<link href="https://fonts.googleapis.com/css?family=Aldrich|Bangers|Bebas+Neue|Black+Ops+One|Changa|Concert+One|Fredoka+One|Indie+Flower|Lacquer|Neucha|Odibee+Sans|Permanent+Marker|Raleway|Righteous|Squada+One|Teko|Trade+Winds|Yeon+Sung|ZCOOL+QingKe+HuangYou&display=swap" rel="stylesheet">
</head>
<body>
<header>
    <nav class="navbar navbar-dark navbar-expand-lg">
        <a class="navbar-brand" href="index.php#"><img class="logo" src="../grafika/autodok_logo_round.png" alt="AutoDOK"></a>
        <div class="icons" align="center">
            Znajdź nas na:<br>
            <!--Odnośmik fanpage--><a id="blink" href="https://www.facebook.com/profile.php?id=61557221683378" target="blank" title="Fanpage"><i class="icon-facebook-official"></i></a>
            <!--Odnośmik Kanał YT--><a id="blink" href="https://www.youtube.com/channel/UCGKKkhTzRmWEAg2ea_nUlNQ" target="blank" title="Kanał YouTube"><i class="icon-youtube"></i></a>
            <!--Odnośmik Instagram--><a id="blink" href="" target="blank" title="Instagram" onclick="alert('Tutaj miał być instagram :)');"><i class="icon-instagram"></i></a>
            <!--mail --><a id="blink" href="" target="blank" title="mail" onclick="alert('Tutaj miał być blog :)');"><i class="icon-mail"></i></a>
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
                <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" role="button" aria-expanded="false" id="submenu" aria-haspopup="true">Do pobrania</a>
                    <div class="dropdown-menu" aria-labelledby="submenu">
                        <a class="dropdown-item" href="../dokumenty/warunki_najmu.pdf">WARUNKI NAJMU</a>
                        <a class="dropdown-item" href="../dokumenty/regulamin_promocji.pdf">REGUALMIN PROMOCJI</a>
                        <a class="dropdown-item" href="../dokumenty/penomocnictwo.pdf">PEŁNOMOCNICTWO</a>
                        <a class="dropdown-item" href="../dokumenty/umowa_wstepna.pdf">UMOWA WSTĘPNA</a>
                    </div>
                </li>
                <li class="nav-item"><a class="nav-link" href="cars.php">NASZE POJAZDY</a></li>
                <?php
                if (!isset($_SESSION['user_id'])) {
                    echo '<li class="nav-item"><a class="nav-link" href="index.php#login-box">logowanie</a></li>';
                } else {
                    echo '<li class="nav-item"><a class="nav-link" href="user.php">Twoje konto</a></li>';
                }
                ?>
            </ul>
        </div>
    </nav>
</header><br><br>
<br><br><br><br><br><div class="container mt-5" style="margin-top:100px;color:white;">
    <h1>Witaj, <?php echo $_SESSION['email']; ?>!</h1>
    
    <h2>Twoje rezerwacje:</h2>
    <?php if (count($reservations) > 0): ?>
        <table class="table" style="color:white;">
            <thead>
                <tr>
                    <th>ID rezerwacji</th>
                    <th>MARKA</th>
                    <th>MODEL</th>
                    <th>ROK PRODUKCJI</th>
                    <th>Od kiedy</th>
                    <th>Do kiedy</th>
           
                </tr>
            </thead>
            <tbody>
                <?php foreach ($reservations as $reservation): ?>
                    <tr>
                        <td><?php echo $reservation['ID_rezerwacji']; ?></td>
                        <td><?php echo $reservation['marka']; ?></td>
                        <td><?php echo $reservation['model']; ?></td>
                        <td><?php echo $reservation['rok_produkcji']; ?></td>
                        <td><?php echo $reservation['od_kiedy']; ?></td>
                        <td><?php echo $reservation['do_kiedy']; ?></td>
                  
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    <?php else: ?>
        <p>Brak rezerwacji.</p>
    <?php endif; ?>

    <h2>Ostatni wynajem:</h2>
    <?php if (!empty($lastRental)): ?>
        <p>ID rezerwacji: <?php echo $lastRental['ID_rezerwacji']; ?></p>
        <p>Od kiedy: <?php echo $lastRental['od_kiedy']; ?></p>
        <p>Do kiedy: <?php echo $lastRental['do_kiedy']; ?></p>
    
    <?php else: ?>
        <p>Brak ostatniego wynajmu.</p>
    <?php endif; ?>
</div>

</body>
</html>
