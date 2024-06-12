import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kontakt'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Skontaktuj się z nami',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
            ),
            const SizedBox(height: 60),
            const Center(
              child: Text(
                'Telefonicznie:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: ListTile(
                leading: const Icon(Icons.phone),
                title: const Text('666 - 555 - 666'),
                onTap: () => _launchURL(
                    'tel:666555666'), // Ustaw prawidłowy numer telefonu
              ),
            ),
            const SizedBox(height: 40),
            const Center(
              child: Text(
                'Mailowo:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: ListTile(
                leading: const Icon(Icons.email),
                title: const Text('bok@autodok.pl'),
                onTap: () => _launchURL('mailto:bok@autodok.pl'),
              ),
            ),
            const SizedBox(height: 40),
            const Center(
              child: Text(
                'Odwiedź naszą siedzibę:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Center(
              child: ListTile(
                leading: Icon(Icons.location_on),
                title: Text('00 - 001, Warszawa ul. Wypożyczeniowa 439/22'),
              ),
            ),
            const SizedBox(height: 50),
            const Center(
              child: Text(
                'Na Social Mediach:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.facebook),
                  onPressed: () => _launchURL(
                      'https://www.facebook.com/profile.php?id=61557221683378'), // Ustaw prawidłowy URL do Facebooka
                ),
                IconButton(
                  icon: const Icon(Icons.movie_edit),
                  onPressed: () => _launchURL(
                      'https://www.youtube.com/channel/UCGKKkhTzRmWEAg2ea_nUlNQ'), // Ustaw prawidłowy URL do YouTube
                ),
                IconButton(
                  icon: const Icon(Icons.photo_camera),
                  onPressed: () => _launchURL(
                      'https://www.instagram.com'), // Ustaw prawidłowy URL do Instagrama
                ),
                IconButton(
                  icon: const Icon(Icons.mail_outline),
                  onPressed: () => _launchURL('mailto:bok@autodok.pl'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ContactPage(),
  ));
}
