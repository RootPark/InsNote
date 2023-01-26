import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Customer_page.dart';

class MyPage extends StatelessWidget {
  final _items = [
    {"title": "로그인 정보", "icon": CupertinoIcons.lock},
    {"title": "피드 정렬", "icon": CupertinoIcons.list_bullet},
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                var item = _items[index];
                return Card(
                  child: ListTile(
                    leading: Icon(item["icon"] as IconData, size: 25.0),
                    title: Text(item["title"] as String),
                    trailing: item.containsKey("version") ? Text(item["version"] as String) : null,
                    onTap: (){
                      if(item["title"] == "고객 문의"){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => CustomerContact()),
                        );
                      }else if(item["title"] == "앱 활용 팁"){
                        _launchUrl();
                      }

                    }
                  ),
                );
              },
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.all(0),
            child: Positioned(
              right: 0,
              bottom: 0,
              child: Text("Designed by 영감일기팀 in Seoul"),
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> _launchUrl() async {
  final Uri _url = Uri.parse('https://flutter.dev');
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
