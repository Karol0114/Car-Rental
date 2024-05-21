<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rezerwacja pojazdu - AutoDOK</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<header>
    <nav class="navbar navbar-dark navbar-expand-lg">
        <a class="navbar-brand" href="index.php#"><img class="logo" src="../grafika/autodok_logo_round.png" alt="AutoDOK"></a>
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
                    <div class="dropdown-menu " aria-labelledby="submenu">
                        <a class="dropdown-item" href="../dokumenty/warunki_najmu.pdf">WARUNKI NAJMU</a>
                        <a class="dropdown-item" href="../dokumenty/regulamin_promocji.pdf">REGUALMIN PROMOCJI</a>
                        <a class="dropdown-item" href="../dokumenty/penomocnictwo.pdf">PEŁNOMOCNICTWO</a>
                        <a class="dropdown-item" href="../dokumenty/umowa_wstepna.pdf">UMOWA WSTĘPNA</a>
                    </div>
                </li>
                <li class="nav-item"><a class="nav-link" href="cars.php">NASZE POJAZDY</a></li>
                <?php
                session_start();
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

<main class="container mt-5">
    <?php
    // Get marka and model from URL parameters
    $marka = isset($_GET['marka']) ? $_GET['marka'] : '';
    $model = isset($_GET['model']) ? $_GET['model'] : '';

    if ($marka && $model) {
        echo "<h1>Rezerwacja pojazdu: $marka $model</h1>";
    } else {
        echo "<h1>Brak wybranego pojazdu!</h1>";
        echo "<p>Proszę wybrać pojazd z <a href='cars.php'>naszej oferty</a>.</p>";
        exit;
    }
    ?>

    <form action="process_reservation.php" method="post">
        <input type="hidden" name="marka" value="<?php echo htmlspecialchars($marka); ?>">
        <input type="hidden" name="model" value="<?php echo htmlspecialchars($model); ?>">
        
        <div class="form-group">
            <label for="name">Imię i nazwisko:</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>
        
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>
        
        <div class="form-group">
            <label for="phone">Numer telefonu:</label>
            <input type="text" class="form-control" id="phone" name="phone" required>
        </div>
        
        <div class="form-group">
            <label for="start_date">Data rozpoczęcia wynajmu:</label>
            <input type="date" class="form-control" id="start_date" name="start_date" required>
        </div>
        
        <div class="form-group">
            <label for="end_date">Data zakończenia wynajmu:</label>
            <input type="date" class="form-control" id="end_date" name="end_date" required>
        </div>
        
        <button type="submit" class="btn btn-primary">Zarezerwuj</button>
    </form>
</main>

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>
