import 'package:flutter/material.dart';
import 'package:flutter_lecture/config/app_theme.dart';
import 'package:flutter_lecture/base_page.dart';

void main() {
  runApp(const FlutterLectureApp());
}

class FlutterLectureApp extends StatelessWidget {
  const FlutterLectureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter D' Class",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const BasePage(title: "Flutter D' Class"),
    );
  }
}
