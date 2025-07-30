import 'package:flutter/material.dart';
import 'package:flutter_lecture/models/section.dart';
import 'package:flutter_lecture/pages/sample_page.dart';

final List<Section> sections = [
  Section(
    title: 'Intro',
    subtitle: '플러터의 첫걸음을 시작해보세요',
    icon: Icons.rocket_launch,
    color: Color(0xFF6C63FF),
    page: SamplePage(),
  ),
  Section(
    title: '1. Flutter 소개',
    subtitle: 'Google의 크로스플랫폼 프레임워크',
    icon: Icons.code,
    color: Color(0xFF03DAC6),
    page: SamplePage(),
  ),
  Section(
    title: '2. Flutter 기초 및 실습',
    subtitle: '다양한 화면 크기에 맞게 UI 만들기',
    icon: Icons.view_quilt,
    color: Color(0xFFFFB300),
    page: SamplePage(),
  ),
  Section(
    title: '3. Flutter 심화',
    subtitle: 'restapi 통신으로 날씨 앱 만들기',
    icon: Icons.edit,
    color: Color(0xFF4CAF50),
    page: SamplePage(),
  ),
];
