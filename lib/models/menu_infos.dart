import 'package:flutter/material.dart';
import 'package:flutter_lecture/models/menu_info.dart';

final List<MenuInfo> menuList = [
  MenuInfo(
    title: 'Intro',
    subtitle: '강의 소개',
    icon: Icons.rocket_launch,
    color: const Color(0xFF6C63FF),
  ),
  MenuInfo(
    title: '1. Flutter 소개',
    subtitle: 'Flutter 첫 걸음 시작하기',
    icon: Icons.code,
    color: const Color(0xFF03DAC6),
  ),
  MenuInfo(
    title: '2. Flutter 기초 및 실습',
    subtitle: '다양한 화면 크기에 맞게 UI 만들기',
    icon: Icons.view_quilt,
    color: const Color(0xFFFFB300),
  ),
  MenuInfo(
    title: '3. Flutter 심화',
    subtitle: 'restapi 통신으로 날씨 앱 만들기',
    icon: Icons.edit,
    color: const Color(0xFF54A0FF),
  ),
];
