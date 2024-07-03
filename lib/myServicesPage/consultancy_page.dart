import 'package:flutter/material.dart';

class ConsultancyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultancy'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text('Providing expert advice to improve your business.'),
      ),
    );
  }
}
