import 'package:falcon_vision/screens/main_screen/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Falcon Vision',
      home: Scaffold(
        body: MainScreen(),
      ),
    );
  }
}