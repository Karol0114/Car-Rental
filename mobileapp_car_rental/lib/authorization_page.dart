import 'package:flutter/material.dart';

class AuthorizationPage extends StatelessWidget {
  const AuthorizationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authorizationRules = [
      'Pełnomocnictwo musi być udzielone w formie pisemnej.',
      'Pełnomocnictwo może być odwołane w każdej chwili przez mocodawcę.',
      'Pełnomocnik ma prawo do działania w imieniu mocodawcy tylko w zakresie udzielonego pełnomocnictwa.',
      'Pełnomocnictwo wygasa automatycznie po upływie określonego w nim terminu.',
      'Pełnomocnik ma obowiązek informowania mocodawcy o wszystkich podjętych działaniach.',
      'Pełnomocnictwo może być udzielone tylko osobie pełnoletniej.',
      'Pełnomocnictwo może być udzielone na czas określony lub nieokreślony.',
      'Pełnomocnik ma obowiązek działania w najlepszym interesie mocodawcy.',
      'Pełnomocnictwo nie może być przeniesione na inną osobę bez zgody mocodawcy.',
      'Pełnomocnik ma prawo do uzyskiwania informacji i dokumentów niezbędnych do wykonania pełnomocnictwa.',
      'Pełnomocnictwo może być ograniczone do konkretnej czynności lub grupy czynności.',
      'Pełnomocnik ma obowiązek zachowania tajemnicy zawodowej w zakresie powierzonych mu spraw.',
      'Pełnomocnictwo nie zwalnia mocodawcy z odpowiedzialności za podjęte działania.',
      'Pełnomocnik ma prawo do wynagrodzenia za wykonywanie czynności w ramach pełnomocnictwa, jeżeli tak ustalono.',
      'Pełnomocnictwo może być sporządzone w formie aktu notarialnego, jeżeli wymaga tego prawo.',
      'Pełnomocnik ma obowiązek zwrócić pełnomocnictwo po jego wygaśnięciu.',
      'Pełnomocnik nie może podejmować działań sprzecznych z interesem mocodawcy.',
      'Pełnomocnictwo może być udzielone przez osobę fizyczną lub prawną.',
      'Pełnomocnik ma obowiązek działać zgodnie z przepisami prawa.',
      'Pełnomocnictwo może być udzielone w języku polskim lub obcym, w zależności od potrzeb mocodawcy.'
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pełnomocnictwo'),
      ),
      body: ListView.builder(
        itemCount: authorizationRules.length,
        itemBuilder: (context, index) {
          int itemNumber = index + 1;
          return ListTile(
            title: Text('$itemNumber. ${authorizationRules[index]}'),
          );
        },
      ),
    );
  }
}
