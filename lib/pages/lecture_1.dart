import 'package:flutter/material.dart';

class Lecture1 extends StatelessWidget {
  const Lecture1({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Lecture 1",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            for (int i = 1; i <= 30; i++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  "Item $i",
                  style: const TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
