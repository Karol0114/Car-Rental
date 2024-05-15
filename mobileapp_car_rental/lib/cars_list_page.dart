import 'package:flutter/material.dart';
import 'package:mobileapp_car_rental/car_widget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CarsListScreen extends StatelessWidget {
  final String category;
  final String searchQuery;

  const CarsListScreen({
    Key? key,
    required this.category,
    this.searchQuery = '',
  }) : super(key: key);

  Future<List<Map<String, dynamic>>> fetchCars() async {
    final uri = searchQuery.isNotEmpty
        ? Uri.parse('http://10.0.2.2/api.php?search=$searchQuery')
        : Uri.parse('http://10.0.2.2/api.php?type=$category');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      print(response.body); // To debug the JSON structure
      final data = json.decode(response.body);
      // Check if data is a list, if not, wrap it into a list
      if (data is! List) {
        return [data];
      } else {
        return data.cast<Map<String, dynamic>>();
      }
    } else {
      throw Exception('Failed to load cars');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Samochody: ${searchQuery.isNotEmpty ? 'Wyszukiwanie' : category}'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchCars(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Brak wyników'));
          } else {
            return ListView.builder(
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
            );
          }
        },
      ),
    );
  }
}
