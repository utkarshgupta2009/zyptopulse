  
import 'package:flutter/material.dart';

class AppTheme {
  static const Color _primaryColorLight = Color(0xFF3CB371);
  static const Color _primaryColorDark = Color(0xFF5ED5A8);
  
  static const Color _backgroundColorLight = Colors.white;
  static const Color _backgroundColorDark = Color(0xFF1B232A);
  
  static const Color _cardColorLight = Color(0xFFF9F9F9);
  static const Color _cardColorDark = Color(0xFF161C22);
  
  static const Color _textColorLight = Color.fromARGB(255, 0, 0, 0);
  static const Color _textColorDark = Color(0xffFFFFFF);
  
  static const Color _secondaryTextColorLight = Color(0xFF8E8E93);
  static const Color _secondaryTextColorDark = Color(0xFF777777);

  
  
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: _primaryColorLight,
    colorScheme: const ColorScheme.light(
      primary: _primaryColorLight,
      onPrimary: Colors.white,
      secondary: _primaryColorLight,
      background: _backgroundColorLight,
      surface: _cardColorLight,
    ),
    scaffoldBackgroundColor: _backgroundColorLight,
    cardColor: _cardColorLight,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: _textColorLight,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: _textColorLight,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: _textColorLight,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        color: _textColorLight,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        color: _textColorLight,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        color: _textColorLight,
        fontSize: 14,
      ),
      bodySmall: TextStyle(
        color: _secondaryTextColorLight,
        fontSize: 12,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: _cardColorLight,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      hintStyle: const TextStyle(color: _secondaryTextColorLight),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _primaryColorLight,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: _primaryColorLight,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: _primaryColorDark,
    colorScheme: const ColorScheme.dark(
      primary: _primaryColorDark,
      onPrimary: Colors.white,
      secondary: _primaryColorDark,
      surface: _cardColorDark,
    ),
    scaffoldBackgroundColor: _backgroundColorDark,
    cardColor: _cardColorDark,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: _textColorDark,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: _textColorDark,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: _textColorDark,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        color: _textColorDark,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        color: _textColorDark,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        color: _textColorDark,
        fontSize: 14,
      ),
      bodySmall: TextStyle(
        color: _secondaryTextColorDark,
        fontSize: 12,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: _cardColorDark,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      hintStyle: const TextStyle(color: _secondaryTextColorDark),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _primaryColorDark,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: _primaryColorDark,
      ),
    ),
  );
}