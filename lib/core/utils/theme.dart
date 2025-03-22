import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      surface: Color(0xFFF5F5F5),
      primary: Color(0xFF4636CC),
      secondary: Color(0xFFFEFEFE),
      onSurface: Color(0xFF120E5F),
      onPrimary: Color(0xFFFFFFFD),
      onSecondary: Color.fromARGB(255, 154, 154, 156),
      tertiary: Color(0xFFE0E0E7),
    ),
    fontFamily: 'KeplerStd',
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: Color(0xFF120E5F),
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: Color(0xFF120E5F),
      ),
      headlineSmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Color(0xFF120E5F),
      ),
      bodyLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Color(0xFF120E5F),
        letterSpacing: 0.5,
        wordSpacing: 0.5,
        height: 1.5,
      ),
      bodyMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: Color(0xFF120E5F),
        letterSpacing: 0.5,
        wordSpacing: 0.5,
        height: 1.5,
      ),
      bodySmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Color(0xFF120E5F),
        letterSpacing: 0.5,
        wordSpacing: 0.5,
        height: 1.5,
      ),
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Color(0xFF120E5F),
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Color(0xFF120E5F),
      ),
      titleSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Color(0xFF120E5F),
      ),
      labelLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Color.fromARGB(255, 154, 154, 156),
      ),
      labelMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Color.fromARGB(255, 154, 154, 156),
      ),
      labelSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Color.fromARGB(255, 154, 154, 156),
      ),
      displayLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Color(0xFF4636CC),
      ),
      displayMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Color(0xFF4636CC),
      ),
      displaySmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Color(0xFF4636CC),
      ),
    ));
