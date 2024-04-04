import 'package:flutter/material.dart';
import 'package:mobileapp_car_rental/auth_screen/custom_bottom_nav_bar.dart';
import 'package:mobileapp_car_rental/auth_screen/home_page.dart';
import 'package:mobileapp_car_rental/reservation_page.dart';
import 'package:mobileapp_car_rental/profile_page.dart';
import 'package:mobileapp_car_rental/auth_screen/home_page.dart';


class OfferPage extends StatefulWidget {
  const OfferPage({super.key});

  @override
  _OfferPageState createState() => _OfferPageState();

}
class _OfferPageState extends State<OfferPage>{

  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ReservationPage()),
      );
    }

    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OfferPage()),
      );
    }

    if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
    }
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zeskanuj rejestrację'),
      ),

      body: const Center(
        child: Text(
          'Strona w budowie',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}