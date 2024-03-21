import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobileapp_car_rental/auth_screen/signin_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  // Lista widoków do przełączania
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Rental'),
      ),
      body: Center(
        // Wyświetlanie odpowiedniego widgetu w zależności od wybranej ikony
        child: _widgetOptions.elementAt(_selectedIndex),
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