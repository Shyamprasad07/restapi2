import 'dart:convert';

import 'package:f1api_test/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<UserDetails> userDetails = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(

            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Text getText(int index, String fieldName, String content) {
    return Text.rich(TextSpan(children: [
      TextSpan(
          text: fieldName,
          style: (const TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
      TextSpan(text: content, style: (const TextStyle(fontSize: 16))),
    ]));
  }

  Future<List<UserDetails>> getData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        userDetails.add(UserDetails.fromJson(index));
      }
      return userDetails;
    } else {
      return userDetails;
    }
  }
}
