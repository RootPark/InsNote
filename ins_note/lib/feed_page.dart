import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
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

  static List<String> feedLink1 = [
    'https://youtu.be/VCDWg0ljbFQ',
    'https://www.facebook.com',
    'https://youtu.be/8-2AHSZ6Y68',
    'https://www.instagram.com/d_.o.o._ng/',
    '',
    'https://map.naver.com/v5/entry/place/17901231?c=14141838.0216799,4517585.9045926,13,0,0,0,dh&placePath=%2Fhome&entry=plt',
    'https://ko.wikipedia.org/wiki/시추'
  ];

  static List<String> feedLink2 = [
    '',
    'https://youtu.be/bTtNV6hgDno',
    'https://wikipedia.org/wiki/banana',
    'https://youtu.be/VCDWg0ljbFQ',
    'https://n.news.naver.com/mnews/article/092/0002266255?sid=105',
    'https://map.naver.com/v5/entry/place/17901231?c=14141838.0216799,4517585.9045926,13,0,0,0,dh&placePath=%2Fhome&entry=plt',
    'https://en.wikipedia.org/wiki/Banana'
  ];

  static List<String> feedLink3 = [
    'https://youtu.be/VCDWg0ljbFQ',
    'https://youtu.be/bTtNV6hgDno',
    'https://youtu.be/8-2AHSZ6Y68',
    'https://ko.wikipedia.org/wiki/시추',
    'https://n.news.naver.com/mnews/article/092/0002266255?sid=105',
    'https://map.naver.com/v5/entry/place/17901231?c=14141838.0216799,4517585.9045926,13,0,0,0,dh&placePath=%2Fhome&entry=plt',
    ''
  ];

  final List<Feed> feedData = List.generate(
      feedLocation.length,
      (index) => Feed(
          feedTitle[index],
          feedContent[index],
          feedLocation[index],
          feedDate[index],
          feedLink1[index],
          feedLink2[index],
          feedLink3[index]));

  Widget linkImageButton(link) {
    if (link.contains('youtu.be')) {
      return InkWell(
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Image.asset(
              "assets/images/youtube_logo.png",
              width: 17,
              height: 17,
            ),
          ),
          // color: Colors.grey,
          onTap: () async {
            if (await canLaunch(link)) {
              await launch(link, forceWebView: false, forceSafariVC: false);
              // forceWebView: false, forceSafariVC: false
              // canLaunchUrlString, launchUrlString
            } else {
              throw 'Could not launch ${link}';
            }
          });
    } else if (link.contains('instagram')) {
      return InkWell(
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Image.asset(
              "assets/images/instagram_logo.png",
              width: 15,
              height: 15,
            ),
          ),
          // color: Colors.grey,
          onTap: () async {
            if (await canLaunch(link)) {
              await launch(link, forceWebView: false, forceSafariVC: false);
              // forceWebView: false, forceSafariVC: false
              // canLaunchUrlString, launchUrlString
            } else {
              throw 'Could not launch ${link}';
            }
          });
    } else if (link.contains('facebook')) {
      return InkWell(
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Image.asset(
              "assets/images/facebook_logo.png",
              width: 15,
              height: 15,
            ),
          ),
          // color: Colors.grey,
          onTap: () async {
            if (await canLaunch(link)) {
              await launch(link, forceWebView: false, forceSafariVC: false);
              // forceWebView: false, forceSafariVC: false
              // canLaunchUrlString, launchUrlString
            } else {
              throw 'Could not launch ${link}';
            }
          });
    } else {
      return InkWell(
          child: Icon(
            Icons.attach_file,
            size: 15,
            color: Colors.black,
          ),
          // color: Colors.grey,
          onTap: () async {
            if (await canLaunch(link)) {
              await launch(link);
              // forceWebView: false, forceSafariVC: false
              // canLaunchUrlString, launchUrlString
            } else {
              throw 'Could not launch ${link}';
            }
          });
    }
    // if
    // switch (link) {
    //   case '':
    //   case 'ko':
    //   return const Text('안녕하세요');
    //   default:
    //   return const Text('Hello');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: feedData.length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(children: <Widget>[
                    Expanded(
                      child: Container(
                          margin: EdgeInsets.only(left: 15.0, right: 20.0),
                          child: Divider(
                            color: Colors.black,
                            height: 36,
                          )),
                    ),
                    Visibility(
                      visible: index == 0 ||
                          feedData[index].date != feedData[index - 1].date,
                      child: Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Text(feedData[index].date)),
                    )
                  ]),
                  Column(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(feedData[index].title,
                                      style: TextStyle(fontSize: 25))),
                              Padding(
                                  padding:
                                      EdgeInsets.only(right: 20, bottom: 5),
                                  child: Text(feedData[index].content,
                                      style: TextStyle(fontSize: 17))),
                              Container(
                                  padding: EdgeInsets.only(right: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.place,
                                            color: Colors.grey,
                                            // size: 13,
                                          ),
                                          Text(feedData[index].location,
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 13)),
                                        ],
                                      ),
                                      Row(children: [
                                        Visibility(
                                            visible:
                                                feedData[index].link1 != "",
                                            child: linkImageButton(
                                                feedData[index].link1)),
                                        Visibility(
                                            visible:
                                                feedData[index].link2 != "",
                                            child: linkImageButton(
                                                feedData[index].link2)),
                                        Visibility(
                                            visible:
                                                feedData[index].link3 != "",
                                            child: linkImageButton(
                                                feedData[index].link3)),
                                      ])
                                    ],
                                  ))
                            ],
                          ))
                    ],
                  ),
                ],
              );
            }));
  }
}
