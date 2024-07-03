import 'package:flutter/material.dart';

class UiUxDesignPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UI/UX Design'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text('Designing user interfaces and user experiences.'),
      ),
    );
  }
}
