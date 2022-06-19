import 'package:flutter/material.dart';

import '../utils/colors.dart';

class MyTheme {
  static var lightTheme = ThemeData(
      primarySwatch: generateMaterialColorFromColor(AppColors.primaryColor),
      textTheme: const TextTheme(
        titleLarge: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(fontSize: 20),
        bodySmall: TextStyle(color: Colors.grey, fontSize: 16),
      ),
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.normal,
          fontSize: 26,
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ));

  static MaterialColor generateMaterialColorFromColor(Color color) {
    return MaterialColor(color.value, {
      50: Color.fromRGBO(color.red, color.green, color.blue, 0.1),
      100: Color.fromRGBO(color.red, color.green, color.blue, 0.2),
      200: Color.fromRGBO(color.red, color.green, color.blue, 0.3),
      300: Color.fromRGBO(color.red, color.green, color.blue, 0.4),
      400: Color.fromRGBO(color.red, color.green, color.blue, 0.5),
      500: Color.fromRGBO(color.red, color.green, color.blue, 0.6),
      600: Color.fromRGBO(color.red, color.green, color.blue, 0.7),
      700: Color.fromRGBO(color.red, color.green, color.blue, 0.8),
      800: Color.fromRGBO(color.red, color.green, color.blue, 0.9),
      900: Color.fromRGBO(color.red, color.green, color.blue, 1.0),
    });
  }
}
