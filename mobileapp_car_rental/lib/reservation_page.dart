import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:mobileapp_car_rental/offer_page.dart';
import 'package:mobileapp_car_rental/profile_page.dart';
import 'package:mobileapp_car_rental/auth_screen/custom_bottom_nav_bar.dart';
import 'package:mobileapp_car_rental/auth_screen/home_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mobileapp_car_rental/car_widget.dart'; // Ensure you have this custom widget

class ReservationPage extends StatefulWidget {
  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  int _selectedIndex = 1;
  DateTime? _selectedDay;
  DateTime? _startDay;
  DateTime? _endDay;
  TextEditingController _startDayController = TextEditingController();
  TextEditingController _endDayController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      if (_startDay != null && _endDay != null) {
        _startDay = selectedDay;
        _endDay = null;
        _selectedDay = focusedDay;
      } else if (_startDay == null || (selectedDay.isBefore(_startDay!))) {
        _startDay = selectedDay;
        _endDay = null;
      } else if (_endDay == null || selectedDay.isAfter(_startDay!)) {
        _endDay = selectedDay;
      }

      _startDayController.text = _startDay != null ? '${_startDay!.toLocal()}'.split(' ')[0] : '';
      _endDayController.text = _endDay != null ? '${_endDay!.toLocal()}'.split(' ')[0] : '';
    });
  }

  Future<List<Map<String, dynamic>>> fetchAvailableCars() async {
    if (_startDay == null || _endDay == null) {
      return [];
    }
    final startDate = "${_startDay!.year}-${_startDay!.month}-${_startDay!.day}";
    final endDate = "${_endDay!.year}-${_endDay!.month}-${_endDay!.day}";
    final uri = Uri.parse('http://10.0.2.2/api.php?startDay=$startDate&endDay=$endDate');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data is List ? data.cast<Map<String, dynamic>>() : [];
    } else {
      throw Exception('Failed to load available cars');
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
    if (index == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ReservationPage()));
    }
    if (index == 2) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const OfferPage()));
    }
    if (index == 3) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
    }
  }

  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Rezerwacja'),
    ),
    body: SingleChildScrollView(
      child: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _selectedDay!,
            selectedDayPredicate: (day) => _startDay == day || _endDay == day,
            onDaySelected: _onDaySelected,
            rangeStartDay: _startDay,
            rangeEndDay: _endDay,
            rangeSelectionMode: RangeSelectionMode.enforced,
            calendarStyle: CalendarStyle(
              rangeHighlightColor: Colors.blue[700]!,
              rangeStartDecoration: BoxDecoration(
                color: Colors.blue[700],
                shape: BoxShape.circle
              ),
              rangeEndDecoration: BoxDecoration(
                color: Colors.blue[700],
                shape: BoxShape.circle
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _startDayController,
                  decoration: const InputDecoration(
                    labelText: 'Początek rezerwacji',
                  ),
                  readOnly: true,
                ),
                TextFormField(
                  controller: _endDayController,
                  decoration: const InputDecoration(
                    labelText: 'Koniec rezerwacji',
                  ),
                  readOnly: true,
                ),
                ElevatedButton(
                  onPressed: fetchAvailableCars,
                  child: const Text('Szukaj'),
                ),
              ],
            ),
          ),
          FutureBuilder<List<Map<String, dynamic>>>(
            future: fetchAvailableCars(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              } else if (snapshot.data!.isEmpty) {
                return Text('Brak dostępnych samochodów');
              } else {
                return SizedBox(
                  height: 300,  // Ustaw wysokość według potrzeb
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var car = snapshot.data![index];
                      return CarWidget(
                        name: car['marka'],
                        model: car['model'],
                        imageAsset: car['zdjecie'],
                        year: car['rok_produkcji'],
                        kmh: car['KM'],
                        fuel: car['rodzaj_paliwa'],
                        engine: double.parse(car['pojemnosc_silnika'].toString()),
                        seats: int.parse(car['ilosc_siedzen'].toString()),
                        doors: int.parse(car['ilosc_drzwi'].toString()),
                        transmission: car['skrzynia_biegow'],
                        price: double.parse(car['cena_za_dobe'].toString()),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    ),
    bottomNavigationBar: CustomBottomNavBar(
      selectedIndex: _selectedIndex,
      onItemTapped: _onItemTapped,
    ),
  );
}
}
