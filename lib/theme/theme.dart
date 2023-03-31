import 'package:flutter/material.dart';

class CustomTheme{
  static ThemeData lightTheme() {
    return ThemeData(
      primaryColor: Colors.indigo,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Colors.indigo)
   );
  }
}