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
    '서울 성동구',
    '서울 성동구',
    '서울 성동구',
    '서울 성동구',
    '서울 성동구',
    '서울 성동구',
    '서울 성동구',
  ];

  static List<String> feedDate = [
    '2022-08-19',
    '2022-08-19',
    '2022-08-19',
    '2022-08-20',
    '2022-08-20',
    '2022-08-24',
    '2022-08-29'
  ];

  final List<Feed> feedData = List.generate(feedLocation.length, (index) => 
    Feed(feedTitle[index], feedContent[index], feedLocation[index], feedDate[index]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: feedData.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              Row(children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 15.0, right: 20.0),
                    child: Divider(
                      color: Colors.black,
                      height: 36,
                    )
                  ),
                ),
                Visibility(
                  visible: index == 0 || feedData[index].date != feedData[index-1].date,
                  child: Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Text(feedData[index].date)
                  ),
                )
              ]),
              Row (children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          feedData[index].title,
                          style: TextStyle(fontSize: 25)
                        )
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20, bottom: 5),
                        child: Text(
                          feedData[index].content,
                          style: TextStyle(fontSize: 17)
                        )
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Row(
                          children: [
                            Icon(
                              Icons.place,
                              color: Colors.grey,
                              size: 13,
                            ),
                            Text(
                              feedData[index].location,
                              style: TextStyle(color: Colors.grey, fontSize: 13)
                            )
                          ],
                        )
                      ),
                    ],
                  )
                )
              ],),
            ],
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