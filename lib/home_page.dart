import 'dart:convert';

import 'package:f1api_test/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'address.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future future;
  List<SamplePosts> samplePosts = [];
  List<SamplePosts> samplePosts1 = [];
  @override
  void initState() {
    future = getData1();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: samplePosts1.length,
              itemBuilder: (context, index) {
                var x = samplePosts1[index];

                return InkWell(
                    child: Card(
                      child: Container(
                        height: 300,
                        width: 300,
                        color: Colors.greenAccent,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        margin: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'user id : ${x.userId}',
                              style: const TextStyle(fontSize: 18),
                            ),
                            Text(
                              'Id : ${x.id}',
                              style: const TextStyle(fontSize: 18),
                            ),
                            Text(
                              'Title : ${samplePosts1[index].title}',
                              maxLines: samplePosts1.length,
                              style: const TextStyle(fontSize: 18),
                            ),
                            Text(
                              'Body : ${samplePosts1[index].body}',
                              maxLines: samplePosts1.length,
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyWidget(
                              nameFromhome: samplePosts1[index].title,
                              bodyFromhome: samplePosts1[index].body,
                              x: samplePosts1,
                            ),
                          ));
                    });
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Future<List<SamplePosts>> getData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        samplePosts.add(SamplePosts.fromJson(index));
      }
      return samplePosts;
    } else {
      return samplePosts;
    }
  }

  Future<List<SamplePosts>> getData1() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      samplePosts1 = samplePostsFromJson(response.body);
    } else {
      throw Exception("Something went wrong");
    }
    return samplePosts1;
  }
}
