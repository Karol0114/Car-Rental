<?php
session_start();

// Check if the user is logged in
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

// Establish connection to the database
$connection = mysqli_connect($host, $user, $password, $database);

// Check if the connection is successful
if (!$connection) {
    die("Błąd połączenia z bazą danych: " . mysqli_connect_error());
}

// Get all reservations of the logged-in user
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

// Get the last rental of the logged-in user
$lastRental = [];
$sql_last_rental = "SELECT * FROM wypozyczenia WHERE ID_klienta = $customerId";
$result_last_rental = mysqli_query($connection, $sql_last_rental);

if ($result_last_rental) {
    $lastRental = mysqli_fetch_assoc($result_last_rental);
} else {
    echo "Błąd pobierania danych: " . mysqli_error($connection);
}

// Close the database connection
mysqli_close($connection);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Panel</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>

<div class="container mt-5">
    <h1>Witaj, <?php echo $_SESSION['email']; ?>!</h1>
    
    <h2>Twoje rezerwacje:</h2>
    <?php if (count($reservations) > 0): ?>
        <table class="table">
            <thead>
                <tr>
                    <th>ID rezerwacji</th>
                    <th>MARKA</th>
                    <th>MODEL</th>
                    <th>ROK PRODUKCJI</th>
                    <th>Od kiedy</th>
                    <th>Do kiedy</th>
                    <!-- Add more columns as needed -->
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
                        <!-- Add more cells with reservation details as needed -->
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
        <!-- Add more details about the last rental as needed -->
    <?php else: ?>
        <p>Brak ostatniego wynajmu.</p>
    <?php endif; ?>
</div>

</body>
</html>
