import 'package:flutter/material.dart';

class Section {
  final String title;
  final String subtitle;
  final IconData icon;
  final IconData selectedIcon;
  final Color color;
  final Widget page;

  Section({
    required this.title,
    required this.subtitle,
    required this.icon,
    IconData? selectedIcon,
    required this.color,
    required this.page,
  }) : selectedIcon = selectedIcon ?? icon;
// selectedIcon이 입력되지 았았다면 Icon으로 기본 설정
}
