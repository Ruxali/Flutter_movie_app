import 'package:flutter/material.dart';
import 'package:movie_app/view/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chal-Chitra',
      home: Home(),
    );
  }
}
