import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobileapp_car_rental/about_us.dart';
import 'package:mobileapp_car_rental/contact.dart';
import 'package:mobileapp_car_rental/regulations_page.dart';
import 'package:mobileapp_car_rental/reservation_page.dart';
import 'package:mobileapp_car_rental/offer_page.dart';
import 'package:mobileapp_car_rental/rental_terms_page.dart';
import 'package:mobileapp_car_rental/promotion_rules_page.dart';
import 'package:mobileapp_car_rental/authorization_page.dart';
import 'package:mobileapp_car_rental/preliminary_agreement_page.dart';
import 'package:mobileapp_car_rental/auth_screen/custom_bottom_nav_bar.dart';
import 'package:mobileapp_car_rental/auth_screen/home_page.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
        MaterialPageRoute(builder: (context) => const OfferPage()),
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
              if (snapshot.connectionState == ConnectionState.active) {
                User? user = snapshot.data;
                if (user != null) {
                  String email = user.email ?? 'Brak email';
                  String initialLetter =
                      email.isNotEmpty ? email[0].toUpperCase() : "?";

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 40, // Zwiększa rozmiar CircleAvatar
                          backgroundColor: Colors.amber[800],
                          child: Text(
                            initialLetter,
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.white), // Zwiększa rozmiar tekstu
                          ),
                        ),
                        SizedBox(
                            width:
                                20), // Daje większy odstęp między awatarem a tekstem
                        Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Wyrównuje tekst do lewej
                          children: [
                            Text(
                              email,
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Center(
                      child: Text('Nie znaleziono użytkownika'));
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    title: Center(child: Text('O nas')),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AboutUsPage()),
                      );
                    },
                  ),
                ),
                Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    title: Center(child: Text('Kontakt')),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ContactPage()));
                    },
                  ),
                ),
                Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    title: Center(child: Text('Warunki najmu')),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RentalTermsPage()),
                      );
                    },
                  ),
                ),
                Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    title: Center(child: Text('Regulamin promocji')),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PromotionRulesPage()),
                      );
                    },
                  ),
                ),
                Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    title: Center(child: Text('Pełnomocnictwo')),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AuthorizationPage()),
                      );
                    },
                  ),
                ),
                Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    title: Center(child: Text('Umowa wstępna')),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const PreliminaryAgreementPage()),
                      );
                    },
                  ),
                ),
                Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    title: Center(child: Text('Regulamin')),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegulationsPage()),
                      );
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

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(MaterialApp(
    navigatorKey: navigatorKey,
    home: ProfilePage(),
  ));
}
