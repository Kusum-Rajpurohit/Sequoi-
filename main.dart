import 'package:flutter/material.dart';
import 'pages/page_one.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Four Page App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const PageOne(),
    );
  }
}