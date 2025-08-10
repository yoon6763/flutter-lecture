import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData defaultTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF6C63FF),
      secondary: Color(0xFF03DAC6),
      surface: Color(0xFF1A1A2E),
      background: Color(0xFF0F0F23),
    ),
    textTheme: const TextTheme(
      // 제목1
      headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      // 제목2
      bodyLarge: TextStyle(fontSize: 16),
      // 본문1
      bodyMedium: TextStyle(fontSize: 14, color: Colors.grey),
      // 본문2
      headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    ),
    fontFamily: 'SF Pro Display',
  );

  AppTheme._();
}
