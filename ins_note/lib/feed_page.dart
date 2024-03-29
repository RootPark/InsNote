import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '/model.dart';
// import '/server.dart';
import 'dart:async';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

List<Feed> feedData = [];
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
    getAllFeeds().then((value) {
      feedData = value;
      print("2");
      print(value);
    });
    // print(tmp);
  }

  Future<List<Feed>> getAllFeeds() async {
    List<Feed> list = [];
    final response =
        // await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos')); //서버 작동 가정 : "http or https://[AWS public IP]:[Port]/tag
        await http.get(Uri.parse(
            'http://13.125.106.51:8080/feed/list')); //서버 작동 가정 : "http or https://[AWS public IP]:[Port]/tag
    if (response.statusCode == 200) {
      // print('Response status: ${response.statusCode}');
      // print('Response body: ${response.body}');

      list = (jsonDecode(response.body) as List)
          .map((e) => Feed.fromJson(e))
          .toList();

      listLength = list.length;

      print("1");

      return list;
    } else {
      throw Exception('Failed to load album');
    }
  }

  Widget linkImageButton(link) {
    if (link == null) {
      return Text("error");
    }

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

  Future<void> _onRefresh() {
    setState(() {
      getAllFeeds().then((value) {
        feedData = value;
        // feedData
      });
      print("refresh");
      print(feedData);
    });
    return Future<void>.value();
  }

  @override
  Widget build(BuildContext context) {
    // print("here1");
    return Scaffold(
        body: RefreshIndicator(
            onRefresh: _onRefresh,
            child: ListView.builder(
                itemCount: listLength,
                itemBuilder: (context, index) {
                  String date = "";
                  String location = "";
                  if (feedData[index].date != null)
                    date = feedData[index].date!;
                  if (feedData[index].location != null)
                    location = feedData[index].location!;
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
                        // Visibility(
                        //   visible: index == 0 ||
                        //       feedData[index].date != feedData[index - 1].date,
                        //   child: Padding(
                        //       padding: EdgeInsets.only(right: 20),
                        //       child: Text(date)),
                        // )
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
                                      child: Text(feedData[index].keyword!,
                                          style: TextStyle(fontSize: 25))),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(right: 20, bottom: 5),
                                      child: Text(feedData[index].detail!,
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
                                              Text(location,
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 13)),
                                            ],
                                          ),
                                          Row(children: [
                                            Visibility(
                                                visible:
                                                    feedData[index].link_1 !=
                                                        "",
                                                child: linkImageButton(
                                                    feedData[index].link_1)),
                                            Visibility(
                                                visible:
                                                    feedData[index].link_2 !=
                                                        "",
                                                child: linkImageButton(
                                                    feedData[index].link_2)),
                                            Visibility(
                                                visible:
                                                    feedData[index].link_3 !=
                                                        "",
                                                child: linkImageButton(
                                                    feedData[index].link_3)),
                                          ])
                                        ],
                                      ))
                                ],
                              ))
                        ],
                      ),
                    ],
                  );
                })));
  }

  // Widget _getFeeds(index) {
  //   // print("here2");
  //   return FutureBuilder<List<Feed>>(
  //       future: feedList,
  //       builder: (context, snapshot) {
  //         if (snapshot.hasData) {
  //           final item = snapshot.data![index];
  //           String location = "";
  //           String link_1 = "";
  //           String link_2 = "";
  //           String link_3 = "";
  //           if (item.location != null) location = item.location!;
  //           if (item.link_1 != null) link_1 = item.link_1!;
  //           if (item.link_2 != null) link_1 = item.link_2!;
  //           if (item.link_3 != null) link_1 = item.link_3!;
  //           // print(item.date);

  //           return Column(
  //             crossAxisAlignment: CrossAxisAlignment.stretch,
  //             children: <Widget>[
  //               Row(children: <Widget>[
  //                 Expanded(
  //                   child: Container(
  //                       margin: EdgeInsets.only(left: 15.0, right: 20.0),
  //                       child: Divider(
  //                         color: Colors.black,
  //                         height: 36,
  //                       )),
  //                 ),
  //               ]),
  //               Column(children: <Widget>[
  //                 Container(
  //                     margin: EdgeInsets.only(left: 20),
  //                     child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: <Widget>[
  //                         Padding(
  //                             padding: EdgeInsets.only(bottom: 10),
  //                             child: Text(item.keyword!,
  //                                 style: TextStyle(fontSize: 25))),
  //                         Padding(
  //                             padding: EdgeInsets.only(right: 20, bottom: 5),
  //                             child: Text(item.detail!,
  //                                 style: TextStyle(fontSize: 17))),
  //                         Padding(
  //                             padding: EdgeInsets.only(right: 20),
  //                             child: Row(
  //                               mainAxisAlignment:
  //                                   MainAxisAlignment.spaceBetween,
  //                               children: [
  //                                 Row(
  //                                   children: [
  //                                     Icon(
  //                                       Icons.place,
  //                                       color: Colors.grey,
  //                                     ),
  //                                     Text(
  //                                       location,
  //                                       style: TextStyle(
  //                                           color: Colors.grey, fontSize: 13),
  //                                     )
  //                                   ],
  //                                 ),
  //                                 Row(
  //                                   children: [
  //                                     Visibility(
  //                                         visible: link_1 != "",
  //                                         child: linkImageButton(link_1)),
  //                                     Visibility(
  //                                         visible: link_2 != "",
  //                                         child: linkImageButton(link_2)),
  //                                     Visibility(
  //                                         visible: link_3 != "",
  //                                         child: linkImageButton(link_3))
  //                                   ],
  //                                 )
  //                               ],
  //                             )),
  //                       ],
  //                     ))
  //               ])
  //             ],
  //           );
  //         } else {
  //           print("none no ever never");
  //           return Text("Error");
  //         }
  //       });
  // }
}
