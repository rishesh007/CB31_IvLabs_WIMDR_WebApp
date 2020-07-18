import 'package:falcon_vision/screens/login/desktop_login.dart';
import 'package:falcon_vision/screens/register/registerWrapper.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  final Function changeToDashboard;

  const Authenticate({Key key, this.changeToDashboard}) : super(key: key);
  
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    print(showSignIn.toString());
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return DesktopLogin(toggleView: toggleView,changeToDashboard: widget.changeToDashboard,);
    } else {
      return RegisterWrapper(toggleView: toggleView,changeToDashboard: widget.changeToDashboard,);
    }
  }
}
