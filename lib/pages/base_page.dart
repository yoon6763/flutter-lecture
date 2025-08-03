import 'package:flutter/material.dart';
import 'package:flutter_lecture/component/sidebar_widget.dart';
import 'package:flutter_lecture/models/menu_infos.dart';
import 'package:flutter_lecture/pages/lecture_1.dart';
import 'package:flutter_lecture/pages/lecture_wrap_page.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _selectedPageIndex = 0;

  final List<Widget> _pages = [
    LectureWrapPage(menuInfo: menuList[0], content: const Lecture1()),
    LectureWrapPage(menuInfo: menuList[1], content: const Lecture1()),
    LectureWrapPage(menuInfo: menuList[2], content: const Lecture1()),
    LectureWrapPage(menuInfo: menuList[3], content: const Lecture1()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SidebarWidget(
            menuList: menuList,
            selectedPageIndex: _selectedPageIndex,
            onItemSelected: onSideBarMenuSelected,
          ),
          Expanded(child: _pages[_selectedPageIndex]),
        ],
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.question_answer_rounded),
      ),
    );
  }

  void onSideBarMenuSelected(int pageIndex) {
    setState(() => _selectedPageIndex = pageIndex);
  }
}
