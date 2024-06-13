import 'package:flutter/material.dart';
import 'package:mobileapp_car_rental/auth_screen/signin_page.dart';
import 'package:mobileapp_car_rental/cars_list_page.dart';
import 'package:mobileapp_car_rental/reservation_page.dart';
import 'package:mobileapp_car_rental/profile_page.dart';
import 'package:mobileapp_car_rental/offer_page.dart';
import 'package:mobileapp_car_rental/auth_screen/custom_bottom_nav_bar.dart';
import 'package:mobileapp_car_rental/scan_registraion.dart';
import 'package:camera/camera.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;
  final TextEditingController _searchQueryController = TextEditingController();

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    _cameras = await availableCameras();
    if (_cameras!.isNotEmpty) {
      _cameraController = CameraController(_cameras!.first, ResolutionPreset.medium);
      await _cameraController!.initialize();
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

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

    if (index == 2 && _cameraController != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => CameraScreen(camera: _cameraController!.description)),
      );
    }

    if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
    }
  }

  void navigateToCategory(String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CarsListScreen(category: category),
      ),
    );
  }

  void performSearch(String query) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            CarsListScreen(category: 'Wyszukiwanie', searchQuery: query),
      ),
    );
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
                performSearch(query);
              },
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    title: Center(child: Text('SUV')),
                    onTap: () => navigateToCategory('SUV'),
                  ),
                ),
                Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    title: Center(child: Text('Sportowe')),
                    onTap: () => navigateToCategory('Sportowe'),
                  ),
                ),
                Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                      title: Center(child: Text('Luksusowe')),
                      onTap: () => navigateToCategory('Luksusowe')),
                ),
                Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    title: Center(child: Text('Kombi')),
                    onTap: () => navigateToCategory('Kombi'),
                  ),
                ),
                Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    title: Center(child: Text('Nasze perełki')),
                    onTap: () => navigateToCategory('Nasze perełki'),
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
