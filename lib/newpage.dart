// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Myname extends StatelessWidget {
  final String addrbody;
  const Myname({
    Key? key,
    required this.addrbody,
  }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body : Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("body: $addrbody",style: const TextStyle(color: Colors.green, fontSize: 30,))
          ],
        ),
      ),
    );
  }
}
