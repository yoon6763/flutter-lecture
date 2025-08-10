import 'package:flutter/material.dart';

/// 제목1
class Title1 extends StatelessWidget {
  final String title;

  const Title1({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}

/// 제목2
class Title2 extends StatelessWidget {
  final String title;

  const Title2({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}

/// 본문
class Body1 extends StatelessWidget {
  final String text;

  const Body1({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .bodyLarge
          ?.copyWith(color: Colors.white70),
    );
  }
}

/// 구분선
class DividerLine extends StatelessWidget {
  const DividerLine({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(thickness: 1, height: 32);
  }
}

/// 표
class TableView extends StatelessWidget {
  final List<String> headers;
  final List<List<String>> rows;

  const TableView({super.key, required this.headers, required this.rows});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Colors.grey),
      columnWidths: const {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(3),
        2: FlexColumnWidth(3),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(color: Colors.grey.shade300),
          children: headers
              .map((header) => Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      header,
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                  ))
              .toList(),
        ),
        ...rows.map(
          (row) => TableRow(
            children: row
                .map((cell) => Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        cell,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}

/// 불릿 리스트
class BulletList extends StatelessWidget {
  final List<String> items;

  const BulletList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map((e) => Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // const Text("• "),
                  // 동그란 아이콘 사용
                  const Icon(Icons.circle, size: 8, color: Colors.white),
                  const SizedBox(width: 8),
                  Expanded(child: Text(e)),
                ],
              ))
          .toList(),
    );
  }
}
