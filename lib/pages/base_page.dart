import 'package:flutter/material.dart';
import 'package:flutter_lecture/component/sidebar_widget.dart';
import 'package:flutter_lecture/models/sections.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _selectedPageIndex = 0;

  final List<Widget> _pages = [
    const Center(child: Text('Home Page')),
    const Center(child: Text('Flutter Introduction')),
    const Center(child: Text('Dart Basics')),
    const Center(child: Text('Flutter Basics')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SidebarWidget(
            sections: sections,
            selectedPageIndex: _selectedPageIndex,
            onItemSelected: (pageIndex) {
              setState(() {
                _selectedPageIndex = pageIndex;
              });
            },
          ),
          Expanded(
            child: _pages[_selectedPageIndex],
          ),
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
