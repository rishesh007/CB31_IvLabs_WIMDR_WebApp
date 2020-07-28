import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:falcon_vision/models/database.dart';
import 'package:falcon_vision/models/users.dart';
import 'package:flutter/material.dart';

class AddUser extends StatefulWidget {
  final double width;
  final Function changeSettingScreen;

  const AddUser({Key key, this.width, this.changeSettingScreen})
      : super(key: key);
  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email;
  String _password;
  String _username;
  bool isPasswordVisible = true;
  // bool isPasswordVisible = true;
  @override
  void initState() {
    getUsers();
    super.initState();
  }

  void changeVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  Widget inputPassword() {
    return TextFormField(
      obscureText: isPasswordVisible ? true : false,
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'This is a required field';
        }
        if (value.length < 6) {
          return 'Password must contains atleast six letters';
        }
        return null;
      },
      onSaved: (String value) {
        _password = value;
        // print(_password);
      },
      decoration: InputDecoration(
        hintText: 'Enter Password',
        // prefixIcon: Padding(
        //   padding: const EdgeInsets.only(bottom: 5),
        //   child: Icon(Icons.lock),
        // ),
        suffixIcon: isPasswordVisible
            ? IconButton(
                icon: Icon(Icons.visibility_off),
                onPressed: changeVisibility,
              )
            : IconButton(
                icon: Icon(Icons.visibility),
                onPressed: changeVisibility,
              ),
      ),
    );
  }

  Widget inputUsername() {
    return TextFormField(
      obscureText: false,
      keyboardType: TextInputType.name,
      validator: (String value) {
        if (value.isEmpty) {
          return 'This is a required field';
        }
        // implement user should not present in UserList

        return null;
      },
      onSaved: (String value) {
        _username = value;
        // print(_password);
      },
      decoration: InputDecoration(
        hintText: 'xyz123',
      ),
    );
  }

  Widget inputEmail() {
    return TextFormField(
      obscureText: false,
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if (value.isEmpty) {
          return 'This is a required field';
        }
        // implement email should not present in UserList
        for (int i = 0; i < allUser.length; i++) {
          if (value == allUser[i].email) {
            return 'User already present';
          }
        }
        if (!RegExp(r"([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})")
            .hasMatch(value)) {
          return 'Enter a valid email';
        }
        return null;
      },
      onSaved: (String value) {
        _email = value;
        // print(_cpassword);
      },
      decoration: InputDecoration(
        hintText: 'you@email.com',
        // prefixIcon: Padding(
        //   padding: const EdgeInsets.only(bottom: 5),
        //   child: Icon(Icons.lock),
        // ),
      ),
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
                  Text('Here you can add a user'),
                  Expanded(child: Container()),
                ],
              ),
              Container(
                width: widget.width - 400,
                height: 400,
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
                              child: Center(child: Text('Username'))),
                          SizedBox(
                            width: 50,
                          ),
                          Container(
                            width: 250,
                            height: 50,
                            child: Center(child: inputUsername()),
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
                              height: 50, child: Center(child: Text('Email'))),
                          SizedBox(
                            width: 75,
                          ),
                          Container(
                            width: 250,
                            height: 50,
                            child: Center(child: inputEmail()),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 50,
                              child: Center(child: Text('Password'))),
                          SizedBox(
                            width: 50,
                          ),
                          Container(
                            width: 250,
                            height: 50,
                            child: Center(child: inputPassword()),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
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
                                Firestore.instance
                                    .collection('user')
                                    .document()
                                    .setData({
                                  'name': _username,
                                  'email': _email,
                                  'password': _password,
                                  'id': mainAuthId,
                                });
                                userList.add(
                                  User(
                                    email: _email,
                                    id: mainAuthId,
                                    name: _username,
                                    password: _password,
                                  ),
                                );
                                widget.changeSettingScreen(0);
                              });
                            },
                            child: Text(
                              'Save Changes',
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold),
                            ),
                            color: Colors.red[900],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 375,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
