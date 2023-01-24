// ignore_for_file: depend_on_referenced_packages

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model.dart';

Future<List<Feed>> fetchFeeds() async {
  final response =
      // await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos')); //서버 작동 가정 : "http or https://[AWS public IP]:[Port]/tag
      await http.get(Uri.parse(
          'http://13.125.106.51:8080/feed?id=1')); //서버 작동 가정 : "http or https://[AWS public IP]:[Port]/tag
  if (response.statusCode == 200) {
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return (jsonDecode(response.body) as List)
        .map((e) => Feed.fromJson(e))
        .toList();
  } else {
    throw Exception('Failed to load album');
  }
}

Future<List<Feed>> getAllFeeds() async {
  final response =
      // await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos')); //서버 작동 가정 : "http or https://[AWS public IP]:[Port]/tag
      await http.get(Uri.parse(
          'http://13.125.106.51:8080/feed/list')); //서버 작동 가정 : "http or https://[AWS public IP]:[Port]/tag
  if (response.statusCode == 200) {
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return (jsonDecode(response.body) as List)
        .map((e) => Feed.fromJson(e))
        .toList();
  } else {
    throw Exception('Failed to load album');
  }
}
