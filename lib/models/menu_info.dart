import 'package:flutter/material.dart';

class MenuInfo {
  final String title;
  final String subtitle;
  final IconData icon;
  final IconData selectedIcon;
  final Color color;

  MenuInfo({
    required this.title,
    required this.subtitle,
    required this.icon,
    IconData? selectedIcon,
    required this.color,
  }) : selectedIcon = selectedIcon ?? icon;
// selectedIcon이 입력되지 았았다면 Icon으로 기본 설정
}
