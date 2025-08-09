import 'package:flutter/material.dart';

class Lecture1 extends StatelessWidget {
  const Lecture1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('플러터 위젯 실습 1'),
        SizedBox(height: 3000),
      ],
    );
  }
}
