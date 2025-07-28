import 'package:flutter/material.dart';

class SidebarItem {
  final IconData icon;
  final IconData? selectedIcon;
  final String label;
  final int pageIndex;

  const SidebarItem({
    required this.icon,
    this.selectedIcon,
    required this.label,
    required this.pageIndex,
  });
}
