import 'package:flutter/material.dart';
import 'package:flutter_lecture/component/sidebar_widget.dart';
import 'package:flutter_lecture/models/menu_info.dart';
import 'package:flutter_lecture/models/menu_infos.dart';
import 'package:flutter_lecture/pages/lecture_1.dart';
import 'package:flutter_lecture/pages/lecture_2.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage>
    with TickerProviderStateMixin {
  int _selectedPageIndex = 0;
  late ScrollController _scrollController;
  late AnimationController _animationController;
  late Animation<double> _headerAnimation;

  bool _isHeaderMinimized = false;

  final List<Widget> _pages = [
    const Lecture1(),
    const Lecture2(),
    const Lecture2(),
    const Lecture2(),
  ];

  final List<MenuInfo> menuInfoList = menuList;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _headerAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _onScroll() {
    const double threshold = 100.0; // 스크롤 임계값

    if (_scrollController.offset > threshold && !_isHeaderMinimized) {
      setState(() {
        _isHeaderMinimized = true;
      });
      _animationController.forward();
    } else if (_scrollController.offset <= threshold && _isHeaderMinimized) {
      setState(() {
        _isHeaderMinimized = false;
      });
      _animationController.reverse();
    }
  }

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
                AnimatedBuilder(
                  animation: _headerAnimation,
                  builder: (context, child) {
                    return _buildAnimatedHeader(
                      context,
                      menuInfoList[_selectedPageIndex],
                      _selectedPageIndex,
                    );
                  },
                ),
                Expanded(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 24.0, horizontal: 36.0),
                      child: _pages[_selectedPageIndex],
                    ),
                  ),
                ),
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

  Widget _buildAnimatedHeader(
      BuildContext context, MenuInfo menuInfo, int selectedIndex) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      padding: EdgeInsets.only(
        left: 36.0,
        right: 36.0,
        top: _isHeaderMinimized ? 12.0 : 24.0,
        bottom: _isHeaderMinimized ? 8.0 : 18.0,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                padding: EdgeInsets.all(_isHeaderMinimized ? 8.0 : 14.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      menuInfo.color,
                      menuInfo.color.withOpacity(0.7),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(_isHeaderMinimized ? 8 : 12),
                  boxShadow: [
                    BoxShadow(
                      color: menuInfo.color.withOpacity(_isHeaderMinimized ? 0.2 : 0.3),
                      blurRadius: _isHeaderMinimized ? 10 : 20,
                      offset: Offset(0, _isHeaderMinimized ? 4 : 8),
                    ),
                  ],
                ),
                child: Icon(
                  menuInfo.selectedIcon,
                  size: _isHeaderMinimized ? 24 : 38,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 300),
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: _isHeaderMinimized ? 20 : 30,
                        color: Colors.white,
                      ) ?? const TextStyle(),
                      child: Text(menuInfo.title),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: _isHeaderMinimized ? 0 : 20,
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 300),
                        opacity: _isHeaderMinimized ? 0 : 1,
                        child: Text(
                          menuInfo.subtitle,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: _isHeaderMinimized ? 0 : 18,
          ),
          // 진행률 표시
          AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: _isHeaderMinimized ? 0 : 1,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: _isHeaderMinimized ? 0 : 20,
              child: Row(
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
            ),
          ),
        ],
      ),
    );
  }

  void onSideBarMenuSelected(int pageIndex) {
    setState(() => _selectedPageIndex = pageIndex);
    // 페이지 변경 시 헤더를 다시 확장
    if (_isHeaderMinimized) {
      setState(() {
        _isHeaderMinimized = false;
      });
      _animationController.reverse();
    }
    // 스크롤을 맨 위로
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}