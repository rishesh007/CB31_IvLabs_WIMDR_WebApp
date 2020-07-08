import 'package:falcon_vision/screens/login/desktop_login.dart';
import 'package:falcon_vision/screens/login/mobile_login.dart';
import 'package:flutter/material.dart';


class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width < 1000 ? MobileLogin(): DesktopLogin(); 
  }
}