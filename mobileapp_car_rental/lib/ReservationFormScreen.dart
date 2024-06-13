import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ReservationForm extends StatefulWidget {
  final int id;

  const ReservationForm({Key? key, required this.id}) : super(key: key);

  @override
  _ReservationFormState createState() => _ReservationFormState();
}

class _ReservationFormState extends State<ReservationForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _peselController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _licenseDateController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _streetController = TextEditingController();
  TextEditingController _houseNumberController = TextEditingController();
  TextEditingController _postalCodeController = TextEditingController();
  TextEditingController _startDateController = TextEditingController(); // data początkowa rezerwacji
  TextEditingController _endDateController = TextEditingController(); // data końcowa rezerwacji

  Future<void> submitReservation() async {
    if (_formKey.currentState!.validate()) {
      final response = await http.post(
        Uri.parse('http://10.0.2.2/api.php?action=reserve'),
        body: {
          'pesel': _peselController.text,
          'imie': _firstNameController.text,
          'nazwisko': _lastNameController.text,
          'prawo_jazdy_od': _licenseDateController.text,
          'miasto': _cityController.text,
          'ulica': _streetController.text,
          'numer': _houseNumberController.text,
          'kod_pocztowy': _postalCodeController.text,
          'ID_Pojazdu': widget.id.toString(),
          'od_kiedy': _startDateController.text,
          'do_kiedy': _endDateController.text
        },
      );

      if (response.statusCode == 200) {
        // Obsługa sukcesu
        Navigator.pop(context);
      } else {
        // Obsługa błędu
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${response.body}'))
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formularz Rezerwacji'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Tutaj dodajemy TextFormField dla każdego kontrolera
              _buildTextField(_peselController, 'Pesel'),
              _buildTextField(_firstNameController, 'Imię'),
              _buildTextField(_lastNameController, 'Nazwisko'),
              _buildTextField(_licenseDateController, 'Data uzyskania prawa jazdy'),
              _buildTextField(_cityController, 'Miasto'),
              _buildTextField(_streetController, 'Ulica'),
              _buildTextField(_houseNumberController, 'Numer domu/mieszkania'),
              _buildTextField(_postalCodeController, 'Kod pocztowy'),
              _buildTextField(_startDateController, 'Data rozpoczęcia wynajmu'),
              _buildTextField(_endDateController, 'Data zakończenia wynajmu'),
              ElevatedButton(
                onPressed: submitReservation,
                child: Text('Rezerwuj'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Pole $label nie może być puste';
          }
          return null;
        },
      ),
    );
  }
}