import 'package:flutter/material.dart';
import 'package:social/views/homepage.dart';
import 'data/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Social App',
      home: LoginPage(),
    );
  }
}
