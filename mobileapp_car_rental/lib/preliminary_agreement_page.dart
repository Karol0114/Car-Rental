import 'package:flutter/material.dart';

class PreliminaryAgreementPage extends StatelessWidget {
  const PreliminaryAgreementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final preliminaryAgreement = [
      'Umowa wstępna zobowiązuje obie strony do zawarcia umowy ostatecznej w określonym terminie.',
      'Strony umowy wstępnej zobowiązują się do spełnienia wszystkich warunków określonych w umowie.',
      'Umowa wstępna powinna zawierać szczegółowe informacje na temat przedmiotu umowy ostatecznej.',
      'W przypadku niewykonania umowy wstępnej przez jedną ze stron, druga strona ma prawo do odszkodowania.',
      'Umowa wstępna może być rozwiązana za zgodą obu stron.',
      'Strony umowy wstępnej zobowiązują się do zachowania poufności w zakresie informacji zawartych w umowie.',
      'Umowa wstępna powinna być sporządzona w formie pisemnej.',
      'Umowa wstępna może być zawarta na czas określony lub nieokreślony.',
      'Strony umowy wstępnej zobowiązują się do niezwłocznego informowania o wszelkich zmianach dotyczących umowy.',
      'Umowa wstępna może przewidywać kary umowne za niewykonanie zobowiązań.',
      'Strony umowy wstępnej zobowiązują się do współpracy w celu realizacji umowy ostatecznej.',
      'Umowa wstępna powinna zawierać klauzule dotyczące rozstrzygania sporów.',
      'Umowa wstępna może być zmieniona tylko za zgodą obu stron.',
      'Strony umowy wstępnej zobowiązują się do dążenia do zawarcia umowy ostatecznej zgodnie z postanowieniami umowy wstępnej.',
      'Umowa wstępna może przewidywać zaliczki lub zadatki na poczet umowy ostatecznej.',
      'Umowa wstępna zobowiązuje strony do działania w dobrej wierze.',
      'Umowa wstępna powinna określać termin i miejsce zawarcia umowy ostatecznej.',
      'Strony umowy wstępnej zobowiązują się do niepodejmowania działań, które mogłyby uniemożliwić zawarcie umowy ostatecznej.',
      'Umowa wstępna może być zawarta w obecności świadków.',
      'Umowa wstępna powinna być podpisana przez osoby uprawnione do reprezentowania stron.'
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Umowa Wstępna'),
      ),
      body: ListView.builder(
        itemCount: preliminaryAgreement.length,
        itemBuilder: (context, index) {
          int itemNumber = index + 1;
          return ListTile(
            title: Text('$itemNumber. ${preliminaryAgreement[index]}'),
          );
        },
      ),
    );
  }
}
