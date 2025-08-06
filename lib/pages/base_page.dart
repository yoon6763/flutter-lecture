import 'package:flutter/material.dart';
import 'package:flutter_lecture/component/sidebar_widget.dart';
import 'package:flutter_lecture/models/menu_info.dart';
import 'package:flutter_lecture/models/menu_infos.dart';
import 'package:flutter_lecture/pages/lecture_1.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _selectedPageIndex = 0;

  final List<Widget> _pages = [
    const Lecture1(),
    const Lecture1(),
    const Lecture1(),
    const Lecture1(),
  ];

  final List<MenuInfo> menuInfoList = menuList;

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
          Expanded(
            child: Column(
              children: [
                _buildHeader(
                  context,
                  menuInfoList[_selectedPageIndex],
                  _selectedPageIndex,
                ),
                Expanded(child: _pages[_selectedPageIndex]),
              ],
            ),
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

  Widget _buildHeader(
      BuildContext context, MenuInfo menuInfo, int selectedIndex) {
    return Padding(
      padding: const EdgeInsets.only(left: 36.0, right: 36.0, top: 24.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      menuInfo.color,
                      menuInfo.color.withOpacity(0.7),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: menuInfo.color.withOpacity(0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Icon(
                  menuInfo.selectedIcon,
                  size: 32,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    menuInfo.title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    menuInfo.subtitle,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white70,
                        ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 18),
          // 진행률 표시
          Row(
            children: [
              const Icon(
                Icons.play_circle_outline,
                color: Colors.white60,
                size: 20,
              ),
              const SizedBox(width: 10),
              Text(
                '${selectedIndex + 1} / ${menuInfoList.length} 챕터',
                style: const TextStyle(
                  color: Colors.white60,
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: LinearProgressIndicator(
                  value: (selectedIndex + 1) / menuInfoList.length,
                  backgroundColor: Colors.white10,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    menuInfoList[selectedIndex].color,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void onSideBarMenuSelected(int pageIndex) {
    setState(() => _selectedPageIndex = pageIndex);
  }
}
