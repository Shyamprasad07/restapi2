// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:f1api_test/model.dart';

class Myname extends StatefulWidget {
  final String addrbody;
  final List<SamplePosts> y;
  const Myname({
    Key? key,
    required this.addrbody,
    required this.y,
  }) : super(key: key);

  @override
  State<Myname> createState() => _MynameState();
}

class _MynameState extends State<Myname> {
  @override
  Widget build(BuildContext context) {
    var x = widget.y;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("body: ${widget.y[0].body}",
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 30,
                ))
          ],
        ),
      ),
    );
  }
}
