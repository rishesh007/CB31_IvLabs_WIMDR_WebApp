import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:falcon_vision/screens/register/steps/step1.dart';
import 'package:falcon_vision/screens/register/steps/step2.dart';
import 'package:falcon_vision/screens/register/steps/step3.dart';
import 'package:falcon_vision/screens/register/steps/step4.dart';
import 'package:flutter/material.dart';

import 'register_view.dart';

class RegisterWrapper extends StatefulWidget {
  final Function changeToDashboard;
  final Function toggleView;

  const RegisterWrapper(
      {Key key, @required this.toggleView, this.changeToDashboard})
      : super(key: key);

  @override
  _RegisterWrapperState createState() => _RegisterWrapperState();
}

class _RegisterWrapperState extends State<RegisterWrapper> {
  num steps = 0;
  String _authId;
  String _username;
  String _email;
  String _phoneNo;
  String _password;
  String _installationPlace;
  String _city;
  String _state;
  String _pincode;
  List<String> _gateName;
  List<String> _entryCode;
  List<String> _exitCode;

  void setStep0(String username, String email, String phone, String password) {
    // print(email);
    setState(() {
      _username = username;
      _email = email;
      _phoneNo = phone;
      _password = password;
    });
  }

  void setStep1(String authId) {
    setState(() {
      _authId = authId;
    });
  }

  void setStep3(String name, String city, String state, String pincode) {
    setState(() {
      _installationPlace = name;
      _city = city;
      _state = state;
      _pincode = pincode;
    });
  }

  void setStep4(
      List<String> gate, List<String> entryCode, List<String> exitCode) {
    setState(() {
      _gateName = gate;
      _entryCode = entryCode;
      _exitCode = exitCode;
    });
    // print(_gateName);
  }

  void pushDataIntoDatabase() async {
    print({
      'authId': _authId,
      'username': _username,
      'email': _email,
      'phoneNo': _phoneNo,
      'password': _password,
      'installationPlace': _installationPlace,
      'city': _city,
      'state': _state,
      'pincode': _pincode,
      'gateName': _gateName,
      'entryCode': _entryCode,
      'exitCode': _exitCode,
    });
    await Firestore.instance.collection(_authId).document('1').setData({
      'authId': _authId,
      'username': _username,
      'email': _email,
      'phoneNo': _phoneNo,
      'password': _password,
      'installationPlace': _installationPlace,
      'city': _city,
      'state': _state,
      'pincode': _pincode,
      'gateName': _gateName,
      'entryCode': _entryCode,
      'exitCode': _exitCode,
    });
    print({
      'name': _username,
      'id': _authId,
      'email': _email,
    });

    await Firestore.instance.collection('user').document().setData({
      'name': _username,
      'id': _authId,
      'email': _email,
    });
  }

  void changeSteps(num val) {
    setState(() {
      steps = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (steps == 0) {
      return RegisterView(
        setStep0: setStep0,
        toggleView: widget.toggleView,
        changeStep: changeSteps,
      );
    } else if (steps == 1) {
      return Step1(
        setStep1: setStep1,
        changeStep: changeSteps,
      );
    } else if (steps == 2) {
      return Step2(
        changeStep: changeSteps,
      );
    } else if (steps == 3) {
      return Step3(
        setStep3: setStep3,
        changeStep: changeSteps,
      );
    } else if (steps == 4) {
      return Step4(
        pushData: pushDataIntoDatabase,
        setStep4: setStep4,
        changeStep: widget.changeToDashboard,
      );
    }
    return null;
  }
}
