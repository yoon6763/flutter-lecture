import 'package:flutter/material.dart';
import 'package:flutter_lecture/component/editor_widget.dart';
import 'package:flutter_lecture/component/gap_column.dart';

class Lecture2 extends StatelessWidget {
  const Lecture2({super.key});

  @override
  Widget build(BuildContext context) {
    return const GapColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Title1(title: 'Lecture 2: State Management in Flutter'),
        SizedBox(height: 3000),
      ],
    );
  }
}
