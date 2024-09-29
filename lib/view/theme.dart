// ignore_for_file: prefer_const_constructors, prefer_const_declarations

import 'package:flutter/material.dart';

class MishkalTheme {
  static final Color primaryColor = Color(0xFF00C4C7); // Turquoise color
  static final Color secondaryColor = Color(0xFFE94A4A); // Red accents
  static final Color lightBackgroundColor = Colors.white;
  static final Color darkBackgroundColor = Color(0xFF121212);

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: lightBackgroundColor,
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontFamily: 'ArabicFont', // Custom Arabic font
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'ArabicFont',
        fontSize: 18,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'ArabicFont',
        fontSize: 16,
        color: Colors.black87,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontFamily: 'ArabicFont',
        fontWeight: FontWeight.bold,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: secondaryColor,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: darkBackgroundColor,
    colorScheme: ColorScheme.dark(
      primary: primaryColor,
      secondary: secondaryColor,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontFamily: 'ArabicFont',
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'ArabicFont',
        fontSize: 18,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'ArabicFont',
        fontSize: 16,
        color: Colors.white70,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontFamily: 'ArabicFont',
        fontWeight: FontWeight.bold,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: secondaryColor,
    ),
  );
}
