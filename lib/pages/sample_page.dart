import 'package:flutter/material.dart';

class SamplePage extends StatelessWidget {
  final String label;

  const SamplePage(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(label),
    );
  }
}
