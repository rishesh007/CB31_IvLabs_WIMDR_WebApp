import 'package:falcon_vision/screens/login/desktop_login.dart';
import 'package:falcon_vision/screens/main_screen/main_screen.dart';
import 'package:falcon_vision/screens/register/registerWrapper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (context) => DesktopLogin(),
        '/register': (context) => RegisterWrapper(),
        '/user': (context) => MainScreen(),
      },
      theme: ThemeData(
        primaryColor: Colors.blue,
        fontFamily: 'archiaregular',
      ),
      debugShowCheckedModeBanner: false,
      title: 'Falcon Vision',
      home: Scaffold(
        body: DesktopLogin(),
      ),
    );
  }
}
// https://falcon-vision-b63de.web.app/main_web_entrypoint.dart.js.map#/
