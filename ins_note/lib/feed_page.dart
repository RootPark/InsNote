import 'package:flutter/material.dart';
import '/feed.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {

  static List<String> feedTitle = [
    '영감일기',
    '김치 장사',
    '일기 앱',
    '취미 앱',
    '번뜩이는 감각',
    '구린 음악으로',
    '더부룩한 체기를'
  ];

  static List<String> feedContent = [
    '홀홀홀',
    '이건 대박이다',
    '꼭 만들어야지',
    '취미 공유 앱',
    '돈 되는 장사',
    '더부룩한 체기를',
    '탄산 right'
  ];

  static List<String> feedLocation = [
    'images/location.png',
    'images/location.png',
    'images/location.png',
    'images/location.png',
    'images/location.png',
    'images/location.png',
    'images/location.png',
  ];

  final List<Feed> feedData = List.generate(feedLocation.length, (index) => 
    Feed(feedTitle[index], feedContent[index], feedLocation[index]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: feedData.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(
                feedData[index].title
              ),
              subtitle: Text(
                feedData[index].content
              ),
              // leading: SizedBox(
              //   height: 50,
              //   width: 50,
              //   child: Image.asset(feedData[index].location)
              // ),
            ),
          );
        }
      )
    );
  }

  // _getListData() {
  //   List<Widget> widgets = [];
  //   for (int i = 0; i < 100; i++) {
  //     widgets.add(GestureDetector(
  //       child: Padding(
  //         padding: EdgeInsets.all(10.0), 
  //         child: Text("Row $i")
  //       ),
  //       onTap: () {
  //         // print("row $i tapped");
  //       }
  //     ));
  //   }
  //   return widgets;
  // }
}