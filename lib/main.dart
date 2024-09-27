import 'package:flutter/material.dart';

import 'home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter api',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyApi(),
    );
  }
}
class MyApi extends StatefulWidget {
  const MyApi({super.key});

  @override
  State<MyApi> createState() => _MyApiState();
}

class _MyApiState extends State<MyApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("adress semi complex api fech"),
      ),
      body: 
       const HomePage(),
    );
  }
}

