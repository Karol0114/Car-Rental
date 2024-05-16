<?php
session_start();
?>


<!DOCTYPE HTML>
<html lang="pl">
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
<body onload="preloader()">


<div id="preloader"><img id="prelogo" src="../grafika/autodok_logo_round.png" alt="AutoDOK" ></div>






<header>

	<nav class="navbar navbar-dark navbar-expand-lg">
	<a class="navbar-brand" href="#"><img class="logo" src="../grafika/autodok_logo_round.png" alt="AutoDOK" ></a>
	
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
		<li class="nav-item"><a class="nav-link" href="#video">Jak wynająć?</a></li>
		<li class="nav-item"><a class="nav-link" href="#popup-box">Promocje</a></li>
		<li class="nav-item"><a class="nav-link" href="#about">O nas</a></li>
		<li class="nav-item"><a class="nav-link" href="#contact">Kontakt</a></li>
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
	
	
<section>

<div id="background">
<img src="../grafika/autodok_baner2.png">
</div>

<div id="media">
<div id="left">


<iframe src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2Fprofile.php%3Fid%3D61557221683378&tabs=timeline&width=500&height=500&small_header=false&adapt_container_width=true&hide_cover=false&show_facepile=true&appId" width="500" height="500" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowfullscreen="true" allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"></iframe>
<iframe src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2FPodNapieciem16%2F&tabs=timeline&width=250&height=500&small_header=false&adapt_container_width=true&hide_cover=false&show_facepile=true&appId" width="250" height="500" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true" allow="encrypted-media" class="min"></iframe>
</div>
<div id="right">

	<iframe src="https://open.spotify.com/embed/album/6zXh7c7TGHr76q31nxtHHn" height="500"width="210" frameborder="0" allowtransparency="true" allow="encrypted-media"class="min"></iframe>
	<iframe style="border-radius:12px" src="https://open.spotify.com/embed/playlist/62Qt7Q0MfjSXXrfA11ler3?utm_source=generator" width="100%" height="500" frameBorder="0" allowfullscreen="" allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture" loading="lazy"></iframe>
</div>
</div>
<div id="about">
<h1 class="reveal">O nas</h1>
				<span class="reveal">AutoDOK to wypożyczalnia pojazdów, która zapewnia klientom szeroki wybór pojazdów najwyższej jakości, idealnych do zaspokojenia wszelkich potrzeb podróżnych czy biznesowych. Nasza firma działa z myślą o komforcie i satysfakcji klienta, oferując profesjonalną obsługę oraz konkurencyjne ceny.

				Nasz flota pojazdów obejmuje różnorodne modele, takie jak samochody osobowe, SUV-y, vany oraz minibusy, które są regularnie serwisowane i utrzymywane w doskonałym stanie technicznym. Dzięki temu nasi klienci mogą być pewni, że podróżują bezpiecznie i komfortowo.

				AutoDOK dba również o indywidualne potrzeby klientów, dlatego oferujemy elastyczne opcje wynajmu, dostosowane do różnych okoliczności i preferencji. Bez względu na to, czy potrzebujesz krótkoterminowego wynajmu na weekendową wycieczkę, czy długoterminowego kontraktu na podróż służbową, jesteśmy gotowi zapewnić Ci odpowiedni pojazd.

				Nasza wypożyczalnia kładzie duży nacisk na wygodę klientów, dlatego oferujemy możliwość rezerwacji online oraz dostawę pojazdu pod wskazany adres. Ponadto, nasz przyjazny personel jest zawsze gotowy udzielić pomocy i doradzić w wyborze odpowiedniego pojazdu, zapewniając kompleksową obsługę na każdym etapie wynajmu.

				AutoDOK to nie tylko miejsce, gdzie wynajmujesz pojazd - to partner, który zapewni Ci niezapomniane doświadczenie podróżowania, dbając o każdy detal, abyś mógł skupić się na tym, co naprawdę ważne podczas podróży.<br>
				<p><b><u class="reveal">Z nami dojedziesz na koniec świata!!!! </u></b></p></p></span>
<div id="sklad">
<h1 style="margin-bottom:30px;"class="reveal">Nasze perełki!</h1>
<div id="car1" class="kafelka">
<img id="img1" src="../grafika/cars/maluch.jpg">
<div class="opis" id="opis1">
<b></br>Fiat 126p<br>
650 ccm | 24 KM</b>
				<p>
				Jeżdżąca Legenda polskich dróg wiejskich!
				</p>
				<a class="clink" href="#" target="blank" title="maluch" onclick="openCar()"> <i class="icon-cab"></i></a>
				<a class="clink" href="#" target="blank" title="maluch" ><i class="icon-basket"></i></a>
</div>
</div>

<div id="car2" class="kafelka">
<img id="img2" src="../grafika/cars/lanos.jpg">
<div class="opis" id="opis2">
<b></br>Daewoo Lanos<br>
1498 ccm | 100 KM</b>
				<p>
				Idelany egzemplarz na droig rodem z epoki kamienia łupanego.
				</p>
				<a class="clink" href="#" target="blank" title="lanos"> <i class="icon-cab"></i></a>
				<a class="clink" href="#" target="blank" title="lanos" ><i class="icon-basket"></i></a>
</div>
</div>

<div id="car3" class="kafelka">
<img id="img3" src="../grafika/cars/multipla.jpg">
<div class="opis" id="opis3">
<b></br>Fiat Multipla<br>
1910 ccm | 120 KM</b>
				<p>
				Jedyny plus tego samocohodu jest na akumulatorze!
				</p>
				<a class="clink" href="#" target="blank" title="multipla"> <i class="icon-cab"></i></a>
				<a class="clink" href="#" target="blank" title="multipla" ><i class="icon-basket"></i></a>
</div>
</div>

<div id="car4" class="kafelka">
<img id="img4" src="../grafika/cars/polonez.jpg">
<div class="opis" id="opis4">
<b></br>Polonez Caro<br>
1598 ccm | 76 KM</b>
				<p>
				Niesłychane przyspieszenie... 13 minut do setki...
				</p>
				<a class="clink" href="#" target="blank" title="polonez"> <i class="icon-cab"></i></a>
				<a class="clink" href="#" target="blank" title="polonez" ><i class="icon-basket"></i></a>
</div>
</div>

<div id="car5" class="kafelka">
<img id="img5" src="../grafika/cars/garbus.jpg">
<div class="opis" id="opis5">
<b></br>Volkswagen 1303<br>
1285 ccm | 44 KM</b>
				<p>
				Samochód dla ludu... Od samego Ferdynanda Porsche...
				</p>
				<a class="clink" href="#" target="blank" title="garbus"> <i class="icon-cab"></i></a>
				<a class="clink" href="#" target="blank" title="garbus" ><i class="icon-basket"></i></a>
</div>
</div>
</div>
</div>


<div id="video">
<iframe class="reveal" src="https://www.youtube.com/embed/ejqBMXrMNKg?si=NOZsvJ1gQJq4ZvUF&amp;controls=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
<iframe class="reveal" src="https://www.youtube.com/embed/bxi0Ljdq8og?si=fDbUiY-IbXYk7OIe&amp;controls=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
<iframe class="reveal" src="https://www.youtube.com/embed/cs9SixZ43pQ?si=BecdyJ6g1Qy4r6qm&amp;controls=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
</div>

<div id="howrent">
<h3><u>Jak wynająć:</u></h3>
<div style="margin-left:10%;">
<div class="circle"></br><h2><u>1</u></h2></br>WYBIERZ POJAZD</br></br><img src="../grafika/pictures/choose.png"></div>
<div class="circle"></br><h2><u>2</u></h2></br>SPRAWDŹ DOSTĘPNOŚĆ </br></br><img src="../grafika/pictures/termin.png"></div>
<div class="circle"></br><h2><u>3</u></h2></br>ZAREZERWUJ POJAZD </br></br><img src="../grafika/pictures/calendar.png"></div>
<div class="circle"></br><h2><u>4</u></h2></br>PODAJ SWOJE DANE </br></br><img src="../grafika/pictures/dane.png"></div>
<div class="circle"></br><h2><u>5</u></h2></br>CZEKAJ NA POTWIERDZENIE</br></br><img src="../grafika/pictures/potwierdzenie.png"></div>
<div class="circle"></br><h2><u>6</u></h2></br>DOKONAJ OPŁATY</br></br><img src="../grafika/pictures/oplata.png"></div>
<div class="circle"></br><h2><u>7</u></h2></br>CIESZ SIĘ Z JAZDY!</br></br><img src="../grafika/pictures/driving.png"></div>
</div>
</div>

</section>	

<div id="contact">
<div style="text-align:center;wdith:100%;margin-top:30px;margin-bottom:30px;"><h3>Skontaktuj się z nami:</h3></div>
<div id="contactBasic">
</br>
<h3><b>AutoDOK</b> - wypożyczalnia pojazdów</h3>
<img src="../grafika/autodok_logo_round.png" style="width:120px;float:right;margin-top:-60px;">
</br></br>

TELEFON</br>
<a href="tel:+48666555666" style="text-decoration:none;color:white;">+ 48 666 - 555 - 666</a></br></br>
MAIL</br>
<a href="mailto:someone@example.com" style="text-decoration:none;color:white;">bok@autodok.pl</a></br></br>

<h4>Godziny otwarcia</h4>

Poniedziałek - Piątek</br>
<b>7:00 - 17:00</b>
</br></br>
Sobota</br>
<b>9:00 - 13:00</b></br></br>
POBIERZ NASZĄ APLIKACJĘ:</br></br>
<a href="google.play.com" style="color:white;"><i class="icon-android"></i> autodokrental</a>
</br></br>
SIEDZIBA </br>
00 - 001, Warszawa</br>
ul. Wypożyczeniowa 439/22</br></br>



<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d156388.46656939157!2d20.89638949442953!3d52.23303347778037!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x471ecc669a869f01%3A0x72f0be2a88ead3fc!2sWarsaw!5e0!3m2!1sen!2spl!4v1713468334029!5m2!1sen!2spl" width="400" height="200" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade" style="float:left;"></iframe>



</div>
<div id="contactForm">
<form>
<label><b>WYŚLIJ DO NAS FORMULARZ Z ZAPYTANIEM</b></label></br></br>
<label>TWOJE IMIĘ</br><input type="text" name="imie" align="right" placeholder="imię"></label></br>
<label>TWOJE NAZWISKO</br><input type="text" name="nazwisko" placeholder="nazwisko"></label></br>
<label>TWÓJ EMAIL</br><input type="mail" name="email" placeholder="email"></label></br>
<label>TWOJA WIADOMOŚĆ</br><textarea placeholder="Treść wiadomości..." name="tresc" cols="60" rows="20"></textarea></label></br>
<button onclick="send()">WYŚLIJ</button>



</form>
</div>

</div>


<div id="footer">
AutoDOK || Official Website &copy 2024
</div>
	
	

	
	<div id="infoCar" style="visibility:hidden;">
<p onclick="closeCar()" style="float:right;color:white;margin-top:30px;margin-right:30px;">X</p>

<div id="contentCar">
SAMPLE SAMPLE SAMPLE 
</div>






</div>

	
	
	
	
	
	
	<div id="fb-root"></div>
        <div id="popup-box" class="modal">
            <div class="content">
                <h1 style="color: green">
                    PROGRAM LOJALNOŚCIOWY!
                </h1>
                <p>Aby skorzystać z naszego programu lojanlnościowego, muszisz zostać naszym stałym klientem!
				Załóż konto na naszej stronie korzystając z panelu logowania! </br> Im więcej pojzdów wypożyczysz tym większy będzie twój stały rabat na nasze usługi!</br>
				</p>
                <a
                    href="#"
                    style="
                        position: absolute;
                        top: 10px;
                        right: 10px;
                        color: #fe0606;
                        font-size: 30px;
                        text-decoration: none;
                    "
                    >&times;</a
                >
            </div>
			
			
        </div>
		
		
		<div id="login-box" class="modal">
            <div class="content">
                <h1 style="color: green">
                    PANEL LOGOWANIA
                </h1>
                <p>Zaloguj się lub załóż konto</p>
                <a
                    href="#"
                    style="
                        position: absolute;
                        top: 10px;
                        right: 10px;
                        color: #fe0606;
                        font-size: 30px;
                        text-decoration: none;
                    "
                    >&times;</a
                >
<div class="container">
      <div class="wrapper">
        <div class="title"><span>Logowanie</span></div>
        <form  action="login.php" method="post">
          <div class="row">
            <i class="fas fa-user"></i>
            <input name="email" type="text" placeholder="Email" required>
          </div>
          <div class="row">
            <i class="fas fa-lock"></i>
            <input name="password" type="password" placeholder="Hasło" required>
          </div>
          <div class="pass"><a href="#">Zapomniałeś hasła?</a></div>
          <div class="row button">
            <input type="submit" value="Login">
          </div>
          <div class="signup-link">Pierwszy raz u nas? <a href="#register-box">Załóż konto już teraz!</a></div>
        </form>
      </div>
    </div>
	
	
	
	
				
            </div>
			
			
        </div>
		
				<div id="register-box" class="modal">
            <div class="content">
                <h1 style="color: green">
                    PANEL REJESTRACJI
                </h1>
                <p>Załóż konto!</p>
                <a
                    href="#"
                    style="
                        position: absolute;
                        top: 10px;
                        right: 10px;
                        color: #fe0606;
                        font-size: 30px;
                        text-decoration: none;
                    "
                    >&times;</a
                >
<div class="container">
      <div class="wrapper">
        <div class="title"><span>Rejestracja</span></div>
        <form  action="register.php" method="post">
		<div class="row">
            <i class="fas fa-user"></i>
            <input name="name" type="text" placeholder="Imię" required>
          </div>
		  <div class="row">
            <i class="fas fa-user"></i>
            <input name="surname" type="text" placeholder="Nazwisko" required>
          </div>
          <div class="row">
            <i class="fas fa-user"></i>
            <input name="email" type="text" placeholder="Email" required>
          </div>
		  <div class="row">
            <i class="fas fa-user"></i>
            <input name="login" type="text" placeholder="login" required>
          </div>
		  <div class="row">
            <i class="fas fa-user"></i>
            <input name="phone" type="text" placeholder="Nr telefonu" required>
          </div>
          <div class="row">
            <i class="fas fa-lock"></i>
            <input name="password" type="password" placeholder="Hasło" required>
          </div>
		  <div class="row">
            <i class="fas fa-lock"></i>
            <input name="repassword" type="password" placeholder="powtórz hasło" required>
          </div>
          <div class="row button">
            <input type="submit" value="Załóż konto">
          </div>
        </form>
      </div>
    </div>
	
	
	
	
				
            </div>
			
			
        </div>
		
		
		
		</div>
	<script async defer crossorigin="anonymous" src="https://connect.facebook.net/pl_PL/sdk.js#xfbml=1&version=v8.0" nonce="3hXqlmb5"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="js/bootstrap.min.js"></script>
		<script src="script.js"></script>
	<script src="jquary.js"></script>
	<script src="scrollreveal/dist/scrollreveal.min.js"></script>

<script>
	let activeCar = "1";
	
	function openCar(){
		document.getElementById('infoCar').style.visibility = 'visble';
		document.getElementById('contentCar').value = 'Tutaj będzie się wyświetlała karta pojazdy wyvbranego samochodu, po integracji z bazą danych! Wybrany samochód to ';
	
	}
	
	
	function closeCar() {
		
		document.getElementById('infoCar').style.visibility = 'hidden';
	}
	
	
	
	
    window.sr = ScrollReveal();
    sr.reveal('.reveal', {
        reset: true,
        delay: 400,
		duration: 2000
    });
	sr.reveal('#car1', {
       reset: true,
       delay: 700,
	   		duration: 2000
   });
   sr.reveal('#car2', {
       reset: true,
       delay: 900,
	   		duration: 2000
   });
   sr.reveal('#car3', {
       reset: true,
       delay: 1100,
	   		duration: 2000
   });
   sr.reveal('#car4', {
       reset: true,
       delay: 1300,
	   		duration: 2000
   });
   sr.reveal('#car5', {
       reset: true,
       delay: 1500,
	   		duration: 2000
   });
</script>
<script src="compsoul.js"></script>
<script src="modal.js"></script>
<script>
  new Modal("#modal").options({
    open: ".modal-clone",
    clone: ".header-content p"
  }).init();
  new Modal().options({
    open: ".modal-data"
  }).init();
  new Modal().options({
    open: ".modal-dataset",
    slider: ".modal-dataset"
  }).init();
</script>
</body>
</html>	