import 'package:flutter/material.dart';
import 'package:flutter_lecture/component/gap.dart';
import 'package:flutter_lecture/component/editor_widget.dart';
import 'package:flutter_lecture/component/gap_column.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';

class Lecture1 extends StatelessWidget {
  const Lecture1({super.key});

  @override
  Widget build(BuildContext context) {
    return GapColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const DoubleGap(),
        Row(
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Title1(title: '강사 소개'),
                Gap(),
                Body1(text: '''
🗣️ 전윤호 | 동국시스템즈 협업솔루션팀

💌 Email | yoonho.jeon@dongkuk.com

🖊️ Blog | https://uknowblog.tistory.com

🧑‍💻 GitHub | https://github.com/yoon6763'''),
                DoubleGap(),
                Title1(title: '담당 업무'),
                Gap(),
                Body1(text: '''
Naver Works 및 IRIS 3.0 일정 담당

사내 앱스토어 (D’ Store) 모바일 앱 및 백엔드 리뉴얼

지식자산 (D’ Share) 모바일 앱 리뉴얼 참여
        '''),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                Container(
                  width: 300,
                  height: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      // 테두리 추가
                      color: Colors.grey.withOpacity(0.3),
                      width: 2.0, // 테두리 두께
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0 - 2.0),
                    child: const Image(
                      image: AssetImage('assets/images/profile.png'),
                      width: 300,
                      height: 500,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Body1(text: '9층에서 열심히 코딩하는 모습'),
              ],
            ),
          ],
        ),
        const DoubleGap(height: 60),
        const Title1(title: "✨ Dart, Flutter란 무엇인가?"),
        const Title2(title: "Dart"),
        const Body1(text: "Java와 문법 유사, JS와도 비슷"),
        const DoubleGap(),
        const Title2(title: "Flutter"),
        const BulletList(items: [
          "구글에서 개발한 크로스 플랫폼 프레임워크",
          "하나의 코드로 6개 플랫폼 대응",
          "Dart 언어 사용",
        ]),
        const SizedBox(height: 20),
        SyntaxView(
            code: '''
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Hello Flutter')),
        body: Center(
          child: Text('Hello, World!'),
        ),
      ),
    );
  }
}
''',
            syntax: Syntax.DART,
            syntaxTheme: SyntaxTheme.gravityDark(),
            withZoom: false,
            fontSize: 14.0),
      ],
    );
  }
}
