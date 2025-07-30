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
    fontFamily: 'SF Pro Display',
  );

  AppTheme._();
}
