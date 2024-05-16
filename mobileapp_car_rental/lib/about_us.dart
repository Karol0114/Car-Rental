import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('O nas'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // To wyśrodkuje całą kolumnę na stronie
          children: [
            Image.asset(
              "assets/images/autodok_logo_round.png",
              width: 120,
              height: 120,
            ),
            const SizedBox(height: 20),
            const Expanded( // To sprawi, że tekst rozciągnie się, by wypełnić dostępną przestrzeń
              child: SingleChildScrollView( // To umożliwia przewijanie, gdy tekst jest dłuższy niż ekran
                child: Column(
                  children: [
                    Text(
                      "AutoDOK to wypożyczalnia pojazdów, która zapewnia klientom szeroki wybór pojazdów najwyższej jakości, idealnych do zaspokojenia wszelkich potrzeb podróżnych czy biznesowych. Nasza firma działa z myślą o komforcie i satysfakcji klienta, oferując profesjonalną obsługę oraz konkurencyjne ceny. Nasz flota pojazdów obejmuje różnorodne modele, takie jak samochody osobowe, SUV-y, vany oraz minibusy, które są regularnie serwisowane i utrzymywane w doskonałym stanie technicznym. Dzięki temu nasi klienci mogą być pewni, że podróżują bezpiecznie i komfortowo. AutoDOK dba również o indywidualne potrzeby klientów, dlatego oferujemy elastyczne opcje wynajmu, dostosowane do różnych okoliczności i preferencji. Bez względu na to, czy potrzebujesz krótkoterminowego wynajmu na weekendową wycieczkę, czy długoterminowego kontraktu na podróż służbową, jesteśmy gotowi zapewnić Ci odpowiedni pojazd. Nasza wypożyczalnia kładzie duży nacisk na wygodę klientów, dlatego oferujemy możliwość rezerwacji online oraz dostawę pojazdu pod wskazany adres. Ponadto, nasz przyjazny personel jest zawsze gotowy udzielić pomocy i doradzić w wyborze odpowiedniego pojazdu, zapewniając kompleksową obsługę na każdym etapie wynajmu.",
                      textAlign: TextAlign.justify, // Wyrównuje tekst do szerokości
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 20), // Daje trochę przestrzeni przed ostatnią linijką
                    Text(
                      "Z nami dojedziesz na koniec świata!!!!",
                      textAlign: TextAlign.center, // Wyśrodkowuje tę linijkę tekstu
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold, // Sprawia, że czcionka jest pogrubiona
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}