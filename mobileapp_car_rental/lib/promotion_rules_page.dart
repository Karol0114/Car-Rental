import 'package:flutter/material.dart';

class PromotionRulesPage extends StatelessWidget {
  const PromotionRulesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final promotionRules = [
      'Promocja obowiązuje tylko dla nowych klientów.',
      'Promocje nie łączą się z innymi ofertami i zniżkami.',
      'Promocja ważna od 01.06.2023 do 30.06.2023.',
      'Aby skorzystać z promocji, należy zarejestrować się na stronie internetowej wypożyczalni.',
      'Promocja obowiązuje tylko na wybrane modele samochodów.',
      'Promocja dotyczy wynajmu na minimum 3 dni.',
      'Promocja nie dotyczy wynajmu samochodów luksusowych i sportowych.',
      'Rabat w ramach promocji naliczany jest automatycznie podczas rezerwacji online.',
      'Wypożyczalnia zastrzega sobie prawo do zakończenia promocji w dowolnym momencie.',
      'Każdy klient może skorzystać z promocji tylko raz.',
      'Promocja nie obejmuje dodatkowych usług, takich jak nawigacja GPS, foteliki dla dzieci, etc.',
      'Aby skorzystać z promocji, należy przedstawić kupon promocyjny podczas odbioru samochodu.',
      'Promocja obowiązuje tylko przy płatności kartą kredytową.',
      'W przypadku anulowania rezerwacji, rabat promocyjny nie jest zwracany.',
      'Promocja obowiązuje tylko na wynajem samochodów w wybranych lokalizacjach.',
      'Wypożyczalnia zastrzega sobie prawo do zmiany warunków promocji w dowolnym momencie.',
      'Promocja dotyczy tylko wynajmu samochodów osobowych.',
      'Rabat promocyjny nie może być wymieniony na gotówkę.',
      'Promocja nie obejmuje wynajmu długoterminowego.',
      'Klient jest zobowiązany do przestrzegania wszystkich warunków promocji, aby skorzystać z rabatu.'
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Regulamin Promocji'),
      ),
      body: ListView.builder(
        itemCount: promotionRules.length,
        itemBuilder: (context, index) {
          int itemNumber = index + 1;
          return ListTile(
            title: Text('$itemNumber. ${promotionRules[index]}'),
          );
        },
      ),
    );
  }
}
