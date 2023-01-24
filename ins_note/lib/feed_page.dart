import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '/model.dart';
import '/server.dart';
import 'dart:async';

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Feed>> tmp = [] as Future<List<Feed>>;
int listLength = 0;

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  void initState() {
    super.initState();
    tmp = getAllFeeds();
  }

  Future<List<Feed>> getAllFeeds() async {
    List<Feed> list = [];
    final response =
        // await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos')); //서버 작동 가정 : "http or https://[AWS public IP]:[Port]/tag
        await http.get(Uri.parse(
            'http://13.125.106.51:8080/feed/list')); //서버 작동 가정 : "http or https://[AWS public IP]:[Port]/tag
    if (response.statusCode == 200) {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      list = (jsonDecode(response.body) as List)
          .map((e) => Feed.fromJson(e))
          .toList();

      listLength = list.length;

      return list;
    } else {
      throw Exception('Failed to load album');
    }
  }

  // static List<String> feedTitle = [
  //   '영감일기',
  //   '김치 장사',
  //   '일기 앱',
  //   '취미 앱',
  //   '번뜩이는 감각',
  //   '구린 음악으로',
  //   '더부룩한 체기를'
  // ];

  // static List<String> feedContent = [
  //   '홀홀홀',
  //   '이건 대박이다',
  //   '꼭 만들어야지',
  //   '취미 공유 앱',
  //   '돈 되는 장사',
  //   '더부룩한 체기를',
  //   '탄산 right'
  // ];

  // static List<String> feedLocation = [
  //   '서울 성동구',
  //   '서울 성동구',
  //   '서울 성동구',
  //   '서울 성동구',
  //   '서울 성동구',
  //   '서울 성동구',
  //   '서울 성동구',
  // ];

  // static List<String> feedDate = [
  //   '2022-08-19',
  //   '2022-08-19',
  //   '2022-08-19',
  //   '2022-08-20',
  //   '2022-08-20',
  //   '2022-08-24',
  //   '2022-08-29'
  // ];

  // static List<String> feedLink1 = [
  //   'https://youtu.be/VCDWg0ljbFQ',
  //   'https://www.facebook.com',
  //   'https://youtu.be/8-2AHSZ6Y68',
  //   'https://www.instagram.com/d_.o.o._ng/',
  //   '',
  //   'https://map.naver.com/v5/entry/place/17901231?c=14141838.0216799,4517585.9045926,13,0,0,0,dh&placePath=%2Fhome&entry=plt',
  //   'https://ko.wikipedia.org/wiki/시추'
  // ];

  // static List<String> feedLink2 = [
  //   '',
  //   'https://youtu.be/bTtNV6hgDno',
  //   'https://wikipedia.org/wiki/banana',
  //   'https://youtu.be/VCDWg0ljbFQ',
  //   'https://n.news.naver.com/mnews/article/092/0002266255?sid=105',
  //   'https://map.naver.com/v5/entry/place/17901231?c=14141838.0216799,4517585.9045926,13,0,0,0,dh&placePath=%2Fhome&entry=plt',
  //   'https://en.wikipedia.org/wiki/Banana'
  // ];

  // static List<String> feedLink3 = [
  //   'https://youtu.be/VCDWg0ljbFQ',
  //   'https://youtu.be/bTtNV6hgDno',
  //   'https://youtu.be/8-2AHSZ6Y68',
  //   'https://ko.wikipedia.org/wiki/시추',
  //   'https://n.news.naver.com/mnews/article/092/0002266255?sid=105',
  //   'https://map.naver.com/v5/entry/place/17901231?c=14141838.0216799,4517585.9045926,13,0,0,0,dh&placePath=%2Fhome&entry=plt',
  //   ''
  // ];

  //여기에서 바로 보여줄려면, _onIntroEnd()함수의 navigator를 통해서 피드페이지로 이동
  //어떤 부분때문에 피드페이지로 이동하게 되는거지? onIntroEnd()함수에는 Myapp()밖에 없던데

  // final List<Feed> feedData = List.generate(
  //     feedLocation.length,
  //     (index) => Feed(
  //         feedTitle[index],
  //         feedContent[index],
  //         feedLocation[index],
  //         feedDate[index],
  //         feedLink1[index],
  //         feedLink2[index],
  //         feedLink3[index]));

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: listLength,
            itemBuilder: (context, index) {
              return _getFeeds(index);
            }));
  }

  Widget _getFeeds(index) {
    return FutureBuilder<List<Feed>>(
        future: tmp,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final item = snapshot.data![index];
            print(item.date);

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
                ]),
                Column(children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(item.keyword!,
                                  style: TextStyle(fontSize: 25))),
                          Padding(
                              padding: EdgeInsets.only(right: 20, bottom: 5),
                              child: Text(item.detail!,
                                  style: TextStyle(fontSize: 17))),
                          Padding(
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
                                      ),
                                      Text(
                                        item.location!,
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 13),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Visibility(
                                          visible: item.link_1 != "",
                                          child: linkImageButton(item.link_1)),
                                      Visibility(
                                          visible: item.link_2 != "",
                                          child: linkImageButton(item.link_2)),
                                      Visibility(
                                          visible: item.link_3 != "",
                                          child: linkImageButton(item.link_3))
                                    ],
                                  )
                                ],
                              )),
                        ],
                      ))
                ])
              ],
            );
          } else {
            print("none");
            return Text("Error");
          }
        });

    // return Column(
    // crossAxisAlignment: CrossAxisAlignment.stretch,
    // children: <Widget>[
    //   Row(children: <Widget>[
    //     Expanded(
    //       child: Container(
    //           margin: EdgeInsets.only(left: 15.0, right: 20.0),
    //           child: Divider(
    //             color: Colors.black,
    //             height: 36,
    //           )),
    //     ),
    //     Visibility(
    //       //맨처음+날짜안바뀌는부분 빈곳 처리
    //       visible: index == 0 ||
    //           item?.date !=
    //               tmp[index - 1].date, //feedData로 처리
    //       child: Padding(
    //           padding: EdgeInsets.only(right: 20),
    //           child: Text(tmp[index].date!)),
    //     )
    //   ]),
    //   Column(
    //     children: <Widget>[
    //       Container(
    //           margin: EdgeInsets.only(left: 20),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: <Widget>[
    //               Padding(
    //                   padding: EdgeInsets.only(bottom: 10),
    //                   child: Text(tmp[index].keyword!,
    //                       style: TextStyle(fontSize: 25))),
    //               Padding(
    //                   padding: EdgeInsets.only(right: 20, bottom: 5),
    //                   child: Text(tmp[index].detail!,
    //                       style: TextStyle(fontSize: 17))),
    //               Container(
    //                   padding: EdgeInsets.only(right: 20),
    //                   child: Row(
    //                     mainAxisAlignment:
    //                         MainAxisAlignment.spaceBetween,
    //                     children: [
    //                       Row(
    //                         children: [
    //                           Icon(
    //                             Icons.place,
    //                             color: Colors.grey,
    //                             // size: 13,
    //                           ),
    //                           Text(tmp[index].location!,
    //                               style: TextStyle(
    //                                   color: Colors.grey,
    //                                   fontSize: 13)),
    //                         ],
    //                       ),
    //                       Row(children: [
    //                         Visibility(
    //                             visible: tmp[index].link_1 != "",
    //                             child: linkImageButton(
    //                                 tmp[index].link_1)),
    //                         Visibility(
    //                             visible: tmp[index].link_2 != "",
    //                             child: linkImageButton(
    //                                 tmp[index].link_2)),
    //                         Visibility(
    //                             visible: tmp[index].link_3 != "",
    //                             child: linkImageButton(
    //                                 tmp[index].link_3)),
    //                       ])
    //                     ],
    //                   ))
    //             ],
    //           ))
    //     ],
    //   ),
    // ],
    // );
    // }
    //       });
  }
}
