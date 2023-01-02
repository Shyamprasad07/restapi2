// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:f1api_test/model.dart';
import 'package:f1api_test/newpage.dart';

class MyWidget extends StatefulWidget {
  final String nameFromhome;
  final String bodyFromhome;
  final List<SamplePosts> x;
  const MyWidget({
    Key? key,
    required this.nameFromhome,
    required this.bodyFromhome,
    required this.x,
  }) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(10),
        height: double.infinity,
        width: double.infinity,
        color: Colors.amberAccent,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network('https://picsum.photos/250?image=9'),
              TextButton(
                child: Text(
                  widget.x[0].title,
                  style: const TextStyle(fontSize: 34, color: Colors.black),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Myname(
                          addrbody: widget.x[0].body,
                          y: widget.x,
                        ),
                      ));
                },
              ),
              Text(
                'Body :${widget.x[0].body}',
                style: const TextStyle(fontSize: 34, color: Colors.green),
              )
            ],
          ),
        ),
      ),
    );
  }
}
