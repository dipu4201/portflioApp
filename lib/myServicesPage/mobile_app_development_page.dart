import 'package:flutter/material.dart';

class MobileAppDevelopmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mobile App Development'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text('Creating cross-platform mobile applications.'),
      ),
    );
  }
}
