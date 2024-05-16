import 'package:flutter/material.dart';

class RegulationsPage extends StatelessWidget {
  const RegulationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Regulamin'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          int itemNumber = index + 1;
          return ListTile(
            title: Text('$itemNumber'),
            subtitle: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse.'),
          );
        },
      ),
    );
  }
}