import 'package:falcon_vision/authenticate/authenticate.dart';
import 'package:falcon_vision/screens/main_screen/main_screen.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool isDashboard = false;

  void changeToDashboard() {
    setState(() {
      isDashboard = !isDashboard;
      print(isDashboard.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    // return either the Home or Authenticate widget

    if (isDashboard == false) {
      return Authenticate(
        // changeToDashboard: changeToDashboard,
      );
    } else {
      return MainScreen(
        // changeToDashboard: changeToDashboard,
      );
    }
  }
}
