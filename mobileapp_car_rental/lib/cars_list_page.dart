import 'package:flutter/material.dart';
import 'package:mobileapp_car_rental/car_widget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class CarsListScreen extends StatelessWidget {
  final String category; 

  const CarsListScreen({
    Key? key,
    required this.category,
  }) : super(key: key);
  
  // Na razie zwraca statyczną listę samochodów. W przyszłości możesz pobrać odpowiednie dane z bazy.
  Future<List<dynamic>> fetchCars() async {
    // Załóżmy, że masz funkcję, która generuje listę samochodów na podstawie kategorii
    final response = await http.get(Uri.parse('http://10.0.2.2:8880/api.php?type=$category'));


    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load cars');
    }
  }
      
  

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Samochody: $category'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchCars(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
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
                  engine: double.parse(car['pojemnosc_silnika']),
                  seats: int.parse(car['ilosc_siedzen']),
                  doors: int.parse(car['ilosc_drzwi']),
                  transmission: car['skrzynia_biegow'],
                  price: double.parse(car['cena_za_dobe']),
                );
              },
            );
          }
        },
      ),
    );
  }
}