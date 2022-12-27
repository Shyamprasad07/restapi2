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
  List<SamplePosts>samplePosts = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData){
          return ListView.builder(
          itemCount: samplePosts.length,
          itemBuilder: (context, index) {
            return InkWell(
              child: Card(
                child: Container(
                  height: 300,
                  width: 300,
                  color: Colors.greenAccent,
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'user id : ${samplePosts[index].userId}',
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Id : ${samplePosts[index].id}',
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Title : ${samplePosts[index].title}',
                      maxLines: samplePosts.length,
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Body : ${samplePosts[index].body}',
                        maxLines:samplePosts.length,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) =>   MyWidget( nameFromhome: samplePosts[index].title, bodyFromhome: samplePosts[index].body,),));
              }
            );
          },
        );

        }
        else {
          return  const Center(
            child: CircularProgressIndicator(),
          );
        }
      }
      
    );
  }

  Future<List<SamplePosts>> getData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
         var data = jsonDecode(response.body.toString());
         if (response.statusCode ==200){
          for(Map<String, dynamic> index in data){
            samplePosts.add(SamplePosts.fromJson(index));
          }
            return samplePosts;
          } else{
            return samplePosts;
          }
         }
  }

