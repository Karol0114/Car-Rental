import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mobileapp_car_rental/car_widget.dart';

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
      print('Response body: ${response.body}'); // Debugging JSON structure
      final data = json.decode(response.body);
      if (data is Map && data.containsKey('error')) {
        print('Error: ${data['error']}');
        throw Exception('Failed to load cars');
      }
      return prepareCarData(data is List ? data : [data]);
    } else {
      print(
          'Failed to load cars: ${response.statusCode} ${response.reasonPhrase}');
      throw Exception('Failed to load cars');
    }
  }

  List<Map<String, dynamic>> prepareCarData(List<dynamic> rawData) {
    return rawData.map((data) {
      return {
        'marka': data['marka'] ?? 'Brak marki',
        'model': data['model'] ?? 'Brak modelu',
        'zdjecie': data['zdjecie'] ?? 'assets/default_image.png',
        'rok_produkcji': data['rok_produkcji'] ?? 0,
        'KM': data['KM'] ?? 0,
        'rodzaj_paliwa': data['rodzaj_paliwa'] ?? 'Nieznany',
        'pojemnosc_silnika':
            double.tryParse(data['pojemnosc_silnika'].toString()) ?? 0.0,
        'ilosc_siedzen': int.tryParse(data['ilosc_siedzen'].toString()) ?? 0,
        'ilosc_drzwi': int.tryParse(data['ilosc_drzwi'].toString()) ?? 0,
        'skrzynia_biegow': data['skrzynia_biegow'] ?? 'Nieznana',
        'cena_za_dobe': double.tryParse(data['cena_za_dobe'].toString()) ?? 0.0,
      };
    }).toList();
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
