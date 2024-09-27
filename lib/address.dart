// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:f1api_test/newpage.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {

   final String nameFromhome;
   final String bodyFromhome;
   
  const MyWidget({
    Key? key,
    required this.nameFromhome,
    required this.bodyFromhome,
  }) : super(key: key);
  

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
              TextButton(child: Text('name : $nameFromhome',style: const TextStyle(fontSize: 34,color: Colors.black),),onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (context) =>  Myname(addrbody: bodyFromhome,),));

              },),
              Text('Body :$bodyFromhome',style: const TextStyle(fontSize: 34,color: Colors.green),)
        
            ],
          ),
        ),
      ),
    );
  }
}
