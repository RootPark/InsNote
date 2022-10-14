import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model.dart';

Future<List<Todos>> fetchTodos() async {
  final response = await http.get(Uri.parse('http//3.36.120.21:8080'));

  if (response.statusCode == 200) {
    return (jsonDecode(response.body) as List)
        .map((e) => Todos.fromJson(e))
        .toList();
  } else {
    throw Exception('error');
  }
}
