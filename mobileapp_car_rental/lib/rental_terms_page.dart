import 'package:flutter/material.dart';

class RentalTermsPage extends StatelessWidget {
  const RentalTermsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rentalTerms = [
      'Najemca musi mieć ukończone 21 lat oraz posiadać ważne prawo jazdy od co najmniej 1 roku.',
      'Samochód musi być zwrócony z pełnym bakiem paliwa, w przeciwnym razie naliczana jest opłata za paliwo plus dodatkowa opłata serwisowa.',
      'Zakazuje się przewożenia zwierząt w samochodzie bez odpowiednich zabezpieczeń (np. klatki).',
      'Wypożyczalnia oferuje pomoc drogową 24/7 w cenie wynajmu.',
      'Najemca jest zobowiązany do zgłoszenia każdego uszkodzenia pojazdu w ciągu 24 godzin od jego powstania.',
      'W przypadku kradzieży pojazdu, najemca jest zobowiązany do natychmiastowego zgłoszenia tego faktu na policję oraz do wypożyczalni.',
      'Najemca ponosi pełną odpowiedzialność za wszelkie szkody spowodowane przez niedozwolone użytkowanie pojazdu, takie jak wyścigi czy jazda w terenie.',
      'Wynajem obejmuje podstawowe ubezpieczenie OC oraz AC, jednak najemca może dokupić dodatkowe ubezpieczenia na wypadek szkód własnych.',
      'Samochód może być używany tylko na terytorium kraju, chyba że uzyskano pisemną zgodę na wyjazd za granicę.',
      'Najemca zobowiązany jest do utrzymania pojazdu w czystości; w przypadku zwrotu bardzo zabrudzonego pojazdu naliczana jest opłata za mycie.',
      'Palenie w samochodzie jest surowo zabronione. W przypadku naruszenia tego zakazu naliczana jest opłata za pranie tapicerki.',
      'Najemca może anulować rezerwację bez opłat do 48 godzin przed planowanym odbiorem pojazdu.',
      'Wypożyczalnia zastrzega sobie prawo do zamiany zarezerwowanego pojazdu na pojazd o podobnej klasie w przypadku niedostępności zarezerwowanego modelu.',
      'Najemca jest zobowiązany do przestrzegania przepisów ruchu drogowego oraz do korzystania z pojazdu zgodnie z jego przeznaczeniem.',
      'Każdy dodatkowy kierowca musi zostać zgłoszony i zatwierdzony przez wypożyczalnię oraz może wiązać się z dodatkową opłatą.',
      'Najemca ponosi odpowiedzialność za wszelkie mandaty i opłaty parkingowe nałożone w okresie najmu.',
      'Samochód jest wyposażony w system GPS do monitorowania lokalizacji i zachowania pojazdu.',
      'Najemca musi zwrócić pojazd w tej samej lokalizacji, w której został odebrany, chyba że uzyskano zgodę na zwrot w innym miejscu.',
      'Minimalny okres wynajmu wynosi 24 godziny.',
      'Wypożyczalnia zastrzega sobie prawo do zmiany warunków najmu w dowolnym momencie, o czym najemca zostanie poinformowany z wyprzedzeniem.'
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Warunki Najmu'),
      ),
      body: ListView.builder(
        itemCount: rentalTerms.length,
        itemBuilder: (context, index) {
          int itemNumber = index + 1;
          return ListTile(
            title: Text('$itemNumber. ${rentalTerms[index]}'),
          );
        },
      ),
    );
  }
}
