import 'package:flutter/material.dart';
import 'package:mobileapp_car_rental/ReservationFormScreen.dart';

class CarWidget extends StatelessWidget {

  final String name;
  final String model;
  final String imageAsset;
  final int year;
  final int kmh;
  final String fuel;
  final double engine;
  final int seats;
  final int doors;
  final String transmission;
  final double price;
  final int id;

  const CarWidget({
    Key? key,
    required this.name,
    required this.model,
    required this.imageAsset,
    required this.year,
    required this.kmh,
    required this.fuel,
    required this.engine,
    required this.seats,
    required this.doors,
    required this.transmission,
    required this.price,
    required this.id
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    void _onReservePressed(int id) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ReservationForm(id: id,),
        ),
      );
    }
    return Card(
      elevation: 5.0,
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imageAsset,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200.0, // Adjust the size accordingly
            ),
            const SizedBox(height: 10.0),
            Text(
              '$name $model',
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            Text('Rok produkcji: $year'),
            Text('Moc: $kmh KM'),
            Text('Pojemność skokowa: $engine cm3'),
            Text('Paliwo: $fuel'),
            Text('Liczba miejsc: $seats'),
            Text('Liczba drzwi: $doors'),
            Text('Skrzynia biegów: $transmission'),
            const SizedBox(height: 10.0),
            Text(
              'Cena: $price zł / dzień',
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),

            ElevatedButton(
              onPressed: () => _onReservePressed(id),
              child: Text('Rezerwuj'),
            ),
          ],
        ),
      ),
    );
  }
}
