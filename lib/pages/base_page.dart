import 'package:flutter/material.dart';
import 'package:flutter_lecture/component/sidebar_widget.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key, required this.title});

  final String title;

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Row(
        children: [
          SidebarWidget(
            selectedPageIndex: _selectedPageIndex,
            onItemSelected: (pageIndex) {
              setState(() {
                _selectedPageIndex = pageIndex;
              });
            },
          ),
          const Text('SamplePage'),
        ],
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.question_answer_rounded),
      ),
    );
  }
}
