import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  final _items = [
    {"title": "로그인 정보", "icon": CupertinoIcons.lock},
    {"title": "메모 정렬", "icon": CupertinoIcons.list_bullet},
    {"title": "글자 크기", "icon": CupertinoIcons.bubble_left_bubble_right},
    {"title": "테마 설정", "icon": Icons.palette_rounded},
    {"title": "고객 문의", "icon": CupertinoIcons.bubble_left_bubble_right},
    {"title": "앱 활용 팁", "icon": CupertinoIcons.question_circle},
    {"title": "App Store 평가", "icon": CupertinoIcons.hand_thumbsup_fill},
    {"title": "버전 정보", "icon": Icons.note, "version": "1.0.0 v"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          var item = _items[index];
          return Card(
            child: ListTile(
              leading: Icon(item["icon"] as IconData, size: 25.0),
              title: Text(item["title"] as String),
              trailing: item.containsKey("version") ? Text(item["version"] as String) : null,
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}