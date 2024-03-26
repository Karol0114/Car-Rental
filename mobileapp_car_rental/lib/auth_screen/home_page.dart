import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp_car_rental/auth_screen/signin_page.dart';
import 'package:mobileapp_car_rental/reservation_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final TextEditingController _searchQueryController = TextEditingController();

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ReservationPage()),
      );
    }
  }

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Nasze samochody',
      style: optionStyle,
    ),
    Text(
      'Rezerwacja',
      style: optionStyle,
    ),
    Text(
      'Oferta',
      style: optionStyle,
    ),
    Text(
      'Profil',
      style: optionStyle,
    ),
  ];


  @override
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Car Rental'),
    ),
    body: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _searchQueryController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: "Znajdź samochód...",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onSubmitted: (query) {
              // Tu można dodać logikę wyszukiwania
            },
          ),
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: ListTile(
                  title: Center(child: Text('SUV')),
                  onTap: () {
                    // Akcja po kliknięciu na kafelek SUV
                  },
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: ListTile(
                  title: Center(child: Text('Sportowe')),
                  onTap: () {
                    // Akcja po kliknięciu na kafelek Sportowe
                  },
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: ListTile(
                  title: Center(child: Text('Luksusowe')),
                  onTap: () {
                    // Akcja po kliknięciu na kafelek Po mieście
                  },
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: ListTile(
                  title: Center(child: Text('Kombi')),
                  onTap: () {
                    // Akcja po kliknięciu na kafelek Po mieście
                  },
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: ListTile(
                  title: Center(child: Text('Nasze perełki')),
                  onTap: () {
                    // Akcja po kliknięciu na kafelek Po mieście
                  },
                ),
              ),
              // Możesz dodać więcej kafelków...
            ],
          ),
        ),
      ],
    ),
    bottomNavigationBar: BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.directions_car),
          label: 'Samochody',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book_online),
          label: 'Rezerwacja',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.campaign),
          label: 'Oferta',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profil',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    ),
  );
}
}
