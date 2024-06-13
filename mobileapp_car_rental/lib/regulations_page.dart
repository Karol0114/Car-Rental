import 'package:flutter/material.dart';

class RegulationsPage extends StatelessWidget {
  const RegulationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final regulations = [
      'Najemca musi posiadać ważne prawo jazdy.',
      'Najemca jest zobowiązany do zwrotu samochodu w ustalonym terminie.',
      'Samochód musi być zwrócony w stanie niepogorszonym, w jakim został wynajęty.',
      'Wynajem obejmuje limit kilometrów, po przekroczeniu którego naliczana jest dodatkowa opłata.',
      'Zakazuje się palenia w wynajętym samochodzie.',
      'Najemca jest odpowiedzialny za wszelkie mandaty i opłaty parkingowe.',
      'W przypadku kolizji lub wypadku, najemca jest zobowiązany do natychmiastowego zgłoszenia tego faktu wypożyczalni.',
      'Zakazuje się przewożenia zwierząt bez wcześniejszej zgody wypożyczalni.',
      'Najemca zobowiązuje się do przestrzegania wszystkich przepisów ruchu drogowego.',
      'Wypożyczalnia zastrzega sobie prawo do odmowy wynajmu samochodu bez podania przyczyny.',
      'Najemca zobowiązuje się do utrzymania czystości w samochodzie.',
      'Samochód wynajmowany jest z pełnym bakiem paliwa i musi być zwrócony z pełnym bakiem paliwa.',
      'Opłata za wynajem pobierana jest z góry.',
      'Wypożyczalnia nie ponosi odpowiedzialności za rzeczy pozostawione w samochodzie.',
      'Najemca nie może używać samochodu do celów komercyjnych bez zgody wypożyczalni.',
      'W przypadku uszkodzenia samochodu, najemca jest zobowiązany do pokrycia kosztów naprawy.',
      'Zakazuje się przewożenia większej liczby pasażerów niż przewidziano w dokumentach pojazdu.',
      'Najemca musi mieć ukończone 21 lat.',
      'Najemca zobowiązuje się do korzystania z samochodu zgodnie z jego przeznaczeniem.',
      'Wypożyczalnia zastrzega sobie prawo do zmiany warunków wynajmu w dowolnym momencie.'
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Regulamin'),
      ),
      body: ListView.builder(
        itemCount: regulations.length,
        itemBuilder: (context, index) {
          int itemNumber = index + 1;
          return ListTile(
            title: Text('$itemNumber. ${regulations[index]}'),
          );
        },
      ),
    );
  }
}
