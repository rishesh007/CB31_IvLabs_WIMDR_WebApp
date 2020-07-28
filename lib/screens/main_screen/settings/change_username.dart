import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:falcon_vision/models/database.dart';
import 'package:falcon_vision/models/users.dart';
import 'package:flutter/material.dart';

class ChangeUsername extends StatefulWidget {
  final double width;
  final Function changeSettingScreen;

  const ChangeUsername({Key key, this.width, this.changeSettingScreen})
      : super(key: key);
  @override
  _ChangeUsernameState createState() => _ChangeUsernameState();
}

class _ChangeUsernameState extends State<ChangeUsername> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // String _email;
  String _user;
  String _newuser;
  Widget inputUserName() {
    return TextFormField(
      obscureText: false,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Username',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'This Field is required';
        }
        if (userList[currentUser].name != value) {
          return 'Enter correct user name';
        }
        return null;
      },
      onSaved: (String value) {
        _user = value;
        // print(_user);
      },
    );
  }

  Widget inputNewUserName() {
    return TextFormField(
      obscureText: false,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'New Username',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'This field is required';
        }
        if (userList[currentUser].name == value) {
          return 'Enter Different Username';
        }

        return null;
      },
      onSaved: (String value) {
        _newuser = value;
        // print(_user);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      padding: EdgeInsets.all(10),
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.fromLTRB(150, 50, 150, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white54),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        setState(() {
                          widget.changeSettingScreen(0);
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Here you can change your username'),
                  Expanded(child: Container()),
                ],
              ),
              Container(
                width: widget.width - 400,
                height: 300,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 40),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 50,
                              child: Center(child: Text('Current Username'))),
                          SizedBox(
                            width: 50,
                          ),
                          Container(
                            width: 250,
                            height: 50,
                            child: Center(child: inputUserName()),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 50,
                              child: Center(child: Text('New Username'))),
                          SizedBox(
                            width: 75,
                          ),
                          Container(
                            width: 250,
                            height: 50,
                            child: Center(child: inputNewUserName()),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: <Widget>[
                          Spacer(),
                          RaisedButton(
                              onPressed: () {
                                if (!_formKey.currentState.validate()) {
                                  return;
                                }
                                _formKey.currentState.save();
                                setState(() {
                                  userList[currentUser].name = _newuser;
                                  int i;
                                  for (i = 0; i < allUser.length; i++) {
                                    if (allUser[i].email ==
                                        userList[currentUser].email) {
                                      allUser[i].name = _newuser;
                                      break;
                                    }
                                  }
                                  Firestore.instance
                                    .collection('user')
                                    .document(userDocumentIds[i])
                                    .setData({
                                  'name': _newuser,
                                  'email': allUser[i].email,
                                  'password': allUser[i].password,
                                  'id': mainAuthId,
                                });
                                  widget.changeSettingScreen(0);
                                });
                              },
                              child: Text(
                                'Save Changes',
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.bold),
                              ),
                              color: Colors.red[900]),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 475,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
