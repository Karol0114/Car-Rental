<?php
session_start();
?>

<html lang="pl">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Pod Napięciem | Official Website</title>
	
	<link rel="shortcut icon" href="icon.ico">
	<link href="https://fonts.googleapis.com/css?family=Aldrich|Bangers|Bebas+Neue|Black+Ops+One|Changa|Concert+One|Fredoka+One|Indie+Flower|Lacquer|Neucha|Odibee+Sans|Permanent+Marker|Raleway|Righteous|Squada+One|Teko|Trade+Winds|Yeon+Sung|ZCOOL+QingKe+HuangYou&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="css/css/fontello.css" type="text/css" >
<style>
#blink{text-decoration:none;color:white;font-size:32px;padding:10px;}
a:hover .icon-facebook-official{color:#8b9dc3;}
					a:hover .icon-youtube{color:#c4302b;}
					a:hover .icon-instagram{color:#60491b;}
					a:hover .icon-spotify{color:#1db954;}
</style>
</head>
<body style="margin:0;height:100%;font-family:Raleway;">
<div style="width:100%;border-top:1px solid white;border-bottom:1px solid white;background-color:black;color:white;height:20%;text-align:center;">
	<a href="index.php" style="width:13%;position:absolute:top:10px;left:30px;"><img style="width:13%;padding:1%;float:left" src="logo.png" alt="Pod Napięciem" ></a>
	
	<div align="center" style="position:relative;margin-left:-15%;margin-top:3%;">
	Znajdź nas na:<br>
	
			<!--Odnośmik fanpage--><a id="blink" href="https://www.facebook.com/PodNapieciem16" target="blank" title="Fanpage Pod Napięciem"> <i class="icon-facebook-official"></i></a>
			<!--Odnośmik Kanał YT--><a id="blink" href="https://www.youtube.com/c/podnapieciemofficial" target="blank" title="Kanał YouTube" ><i class="icon-youtube"></i></a>
			<!--Odnośmik Instagram--><a id="blink" href="https://www.instagram.com/podnapieciemofficial/" target="blank" title="Instagram" ><i class="icon-instagram"></i></a>
			<!--Spotify --><a id="blink" href="https://open.spotify.com/artist/4PvWeIhiWc0mcFHUGsDyOj" target="blank" title="Spotify" ><i class="icon-spotify"></i></a>
	
	</div>
	<a href="index.php"style="test-decoration:none;color:white;float:right;margin-right:10px;">Powrót do strony głównej</a>
</div>
<div style="width:100%;height:72%;background-image:url(tloduze.png);background-size:100%;padding-top:20px;text-align:center;">
<h2 style="color:white;">Skontaktuj się z nami:</h2>

<div style="width:100%;color:white;">
	<form action="wstaw.php" method="post" style="text-align:center;color:white;">
	<table align="center" style="color:white;text-align:center;">
	<tr>
	<td>Imię: 		</td><td>	<input type="text" name="imie" placeholder="Imię" required="required"><br></td>
	</tr>
	<tr>
	<td>Nazwisko: 	</td><td>	<input type="text" name="nazwisko" placeholder="Nazwisko" required="required"><br></td>
	</tr>
	<tr>
	<td>Email: 		</td><td>	<input type="email" name="mail" placeholder="Twój adres email" required="required"><br></td>
	</tr>
	<td>Temat:</td><td>	<select name="temat">
						<option value="Organizacja koncertu">Organizacja koncertu</option>
						<option value="Oferta współpracy">Oferta współpracy</option>
						<option value="Zapytanie ofertowe">Zapytanie ofertowe</option>
						<option value="Zamówienie">Zamówienie</option>
						<option value="Inne">Inne</option>
					</select><br></td>
	</tr>
	<tr>
					<td colspan="2"><textarea placeholder="Treść wiadomości..." name="tresc" cols="40" rows="10"></textarea><br></td>
	</tr>
	<tr>
					<td colspan="2"><input type="submit" value="Wyślij" ></td>
	</tr>
	<tr>
	<td>podnapieciemband@gmail.com<br></td><td>tel. 694 - 813 - 012<br></td>
	</tr>
	<tr>
	<td>menagment@podnapieciemofficial.pl<br></td><td><br></td>
	</tr>
	
	</table>
	<?php
	if(isset($_SESSION['status'])){
		echo $_SESSION['status'];
	}
	
	?>
	</form>






</div>




</div>
<div style="text-align:center;background-color:black;color:white;padding:10px;line-height:100%;border-top:1px solid white;border-bottom:1px solid white;">Pod Napięciem || Official Website &copy autor: Dawid Pudlik</div>


</body>
</html>
