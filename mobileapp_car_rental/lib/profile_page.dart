import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobileapp_car_rental/reservation_page.dart';
import 'package:mobileapp_car_rental/offer_page.dart';
import 'package:mobileapp_car_rental/auth_screen/custom_bottom_nav_bar.dart';
import 'package:mobileapp_car_rental/auth_screen/home_page.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);
  @override 
  _ProfilePageState createState() => _ProfilePageState();

}

class _ProfilePageState extends State<ProfilePage>{
  final user = FirebaseAuth.instance.currentUser;

  int _selectedIndex = 3;

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
        title: Text('Profil'),
      ),
       body: Column(
      children: <Widget>[
        SizedBox(height: 20),
        StreamBuilder<User?>(
          stream: FirebaseAuth.instance.userChanges(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.active) {
              User? user = snapshot.data;
              String email = user?.email ?? 'Brak email';
              String initialLetter = email.isNotEmpty ? email[0].toUpperCase() : "?";

               return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40, // Zwiększa rozmiar CircleAvatar
                        backgroundColor: Colors.amber[800],
                        child: Text(
                          initialLetter,
                          style: TextStyle(fontSize: 40, color: Colors.white), // Zwiększa rozmiar tekstu
                        ),
                      ),
                      SizedBox(width: 20), // Daje większy odstęp między awatarem a tekstem
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start, // Wyrównuje tekst do lewej
                        children: [
                          Text(
                            email,
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
          },
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: ListTile(
                  title: Center(child: Text('O nas')),
                  onTap: () {
                    
                  },
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: ListTile(
                  title: Center(child: Text('Kontakt')),
                  onTap: () {
                    
                  },
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: ListTile(
                  title: Center(child: Text('Warunki najmu')),
                  onTap: () {
                    
                  },
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: ListTile(
                  title: Center(child: Text('Regulamin promocji')),
                  onTap: () {
                    
                  },
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: ListTile(
                  title: Center(child: Text('Pełnomocnictwo')),
                  onTap: () {
                    
                  },
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: ListTile(
                  title: Center(child: Text('Umowa wstępna')),
                  onTap: () {
                    
                  },
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: ListTile(
                  title: Center(child: Text('Regulamin')),
                  onTap: () {
                    
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
  );
}
}