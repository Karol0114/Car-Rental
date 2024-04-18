import 'package:flutter/material.dart';
import 'package:mobileapp_car_rental/car_widget.dart';


class CarsListScreen extends StatelessWidget {
  final String category; 

  const CarsListScreen({
    Key? key,
    required this.category,
  }) : super(key: key);
  
  // Na razie zwraca statyczną listę samochodów. W przyszłości możesz pobrać odpowiednie dane z bazy.
  List<Widget> _buildCarsList(String category) {
    // Załóżmy, że masz funkcję, która generuje listę samochodów na podstawie kategorii
    
      // Tutaj wstaw swoje widgety CarTile dla danego rodzaju samochodu
      if (category == 'SUV') {
        return [
          const CarWidget(
            name: 'Audi', 
            model: 'Q8', 
            imageAsset: "assets/images/audi_q8.png",
            year: 2019,
            kmh: 507,
            fuel: 'Diesel', 
            engine: 4, 
            seats: 5, 
            doors: 5, 
            transmission: 'Automatyczna', 
            price: 500),

            const CarWidget(
            name: 'Mercedes-Benz', 
            model: 'GLC 300 e 4-Matic', 
            imageAsset: "assets/images/mercedes.png", 
            year: 2021,
            kmh: 211,
            fuel: 'Hybryda',  
            engine: 2, 
            seats: 5, 
            doors: 5, 
            transmission: 'Automatyczna', 
            price: 250),
        ];
      } else if (category == 'Sportowe') {
        return [
          const CarWidget(
            name: 'Porsche', 
            model: 'Panamera', 
            imageAsset: "assets/images/Porsche_panamera.png", 
            year: 2012,
            kmh: 300,
            fuel: 'Benzyna',  
            engine: 3.6, 
            seats: 4, 
            doors: 5, 
            transmission: 'Automatyczna', 
            price: 300),

          const CarWidget(
            name: 'Ferrari', 
            model: '458 Italia', 
            imageAsset: "assets/images/ferrari.png", 
            year: 2015,
            kmh: 569,
            fuel: 'Benzyna',  
            engine: 4.5, 
            seats: 2, 
            doors: 2, 
            transmission: 'Automatyczna', 
            price: 5000),
        ];
      } else if (category == 'Luksusowe') {
        return [
          const CarWidget(
            name: 'BMW', 
            model: 'M4', 
            imageAsset: "assets/images/bmw_m4.png", 
            year: 2017,
            kmh: 431,
            fuel: 'Benzyna',  
            engine: 3, 
            seats: 4, 
            doors: 2, 
            transmission: 'Automatyczna', 
            price: 300),

          const CarWidget(
            name: 'Audi', 
            model: 'A7', 
            imageAsset: "assets/images/audi_a7.png", 
            year: 2018,
            kmh: 286,
            fuel: 'Diesel',  
            engine: 3, 
            seats: 5, 
            doors: 5, 
            transmission: 'Automatyczna', 
            price: 280),
        ];
      } else if (category == 'Kombi') {
        return [
          const CarWidget(
            name: 'Mercedes-Benz', 
            model: 'CLA', 
            imageAsset: "assets/images/mercedes_cla.png", 
            year: 2019,
            kmh: 190,
            fuel: 'Diesel',  
            engine: 2, 
            seats: 5, 
            doors: 5, 
            transmission: 'Automatyczna', 
            price: 190),

          const CarWidget(
            name: 'Volkswagen', 
            model: 'Passat', 
            imageAsset: "assets/images/passat.png", 
            year: 2015,
            kmh: 180,
            fuel: 'Benzyna',  
            engine: 1.8, 
            seats: 5, 
            doors: 5, 
            transmission: 'Automatyczna', 
            price: 180),
        ];
      } else if (category == 'Nasze perełki') {
        return [
          const CarWidget(
            name: 'Fiat', 
            model: '126', 
            imageAsset: "assets/images/maluch.jpg", 
            year: 2000,
            kmh: 211,
            fuel: 'Benzyna',  
            engine: 0.6, 
            seats: 4, 
            doors: 2, 
            transmission: 'Manualna', 
            price: 10000),

          const CarWidget(
            name: 'Fiat', 
            model: 'Multipla', 
            imageAsset: "assets/images/multipla.jpg", 
            year: 1999,
            kmh: 103,
            fuel: 'Benzyna',  
            engine: 1.6, 
            seats: 5, 
            doors: 5, 
            transmission: 'Manualna', 
            price: 15000),
        ];
      } else {
        return [];
      } 
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Samochody: $category'),
      ),
      body: ListView(
        children: _buildCarsList(category),
      ),
    );
  }
}