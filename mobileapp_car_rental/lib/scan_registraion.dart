import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class CameraScreen extends StatefulWidget {
  final CameraDescription camera;
  const CameraScreen({Key? key, required this.camera}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {

  Future<void> fetchVehicleData(String licenseNumber) async {
  final response = await http.get(Uri.parse('http://10.0.2.2/api.php?search=$licenseNumber'));

  if (response.statusCode == 200) {
    List<dynamic> vehicles = jsonDecode(response.body);
    if (vehicles.isNotEmpty) {
      // Wyświetl dane o pojeździe
      print("Vehicle data: ${response.body}");
    } else {
      print("No vehicle found with this license number.");
    }
  } else {
    throw Exception('Failed to load vehicle data');
  }
}
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _identifyText() async {
    try {
      await _initializeControllerFuture;
      final image = await _controller.takePicture();
      final inputImage = InputImage.fromFilePath(image.path);
      final textDetector = GoogleMlKit.vision.textRecognizer();
      final RecognizedText recognizedText = await textDetector.processImage(inputImage);
      String text = recognizedText.text;
      for (TextBlock block in recognizedText.blocks) {
        for (TextLine line in block.lines) {
          // Sprawdź, czy linia zawiera numer rejestracyjny
          fetchVehicleData(line.text);// Możesz dodać dodatkową logikę do przetwarzania tekstu
        }
      }
      textDetector.close();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Camera')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _identifyText,
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}