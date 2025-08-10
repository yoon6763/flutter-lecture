import 'package:flutter/material.dart';

class Gap extends StatelessWidget {
  final double height;

  const Gap({
    super.key,
    this.height = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}

class DoubleGap extends StatelessWidget {
  final double height;

  const DoubleGap({
    super.key,
    this.height = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height * 2);
  }
}
