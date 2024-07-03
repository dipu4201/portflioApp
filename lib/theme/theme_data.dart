import 'package:flutter/material.dart';

ThemeData buildDarkTheme() {
  return ThemeData.dark().copyWith(
    primaryColor: Colors.blue,
    hintColor: Colors.blueAccent,
    textTheme:  TextTheme(
      bodyLarge: TextStyle(color: Colors.white70),
      bodyMedium: TextStyle(color: Colors.white70),
    ),
  );
}