import 'package:falcon_vision/models/users.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  final double width;
  final Function changeSettingScreen;

  const ChangePassword({Key key, this.width, this.changeSettingScreen})
      : super(key: key);
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _password;
  String _cpassword;
  String _newpassword;
  bool isPasswordVisible = true;
  // bool isPasswordVisible = true;
  void changeVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  Widget inputNewPassword() {
    return TextFormField(
      obscureText: isPasswordVisible ? true : false,
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'This is a required field';
        }
        if (_password != _cpassword) {
          return 'Password didn\t matched';
        }
        if (value.length < 6) {
          return 'Password must contains atleast six letters';
        }
        return null;
      },
      onSaved: (String value) {
        _newpassword = value;
        // print(_password);
      },
      decoration: InputDecoration(
        hintText: 'New Password',
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

  Widget inputPassword() {
    return TextFormField(
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'This is a required field';
        }
        if (_password != userList[currentUser].password) {
          return 'Current password didn\'t match';
        }
        return null;
      },
      onSaved: (String value) {
        _password = value;
        // print(_password);
      },
      decoration: InputDecoration(
        hintText: 'Password',
        // prefixIcon: Padding(
        //   padding: const EdgeInsets.only(bottom: 5),
        //   child: Icon(Icons.lock),
        // ),
        // suffixIcon: isPasswordVisible
        //     ? IconButton(
        //         icon: Icon(Icons.visibility_off),
        //         onPressed: changeVisibility,
        //       )
        //     : IconButton(
        //         icon: Icon(Icons.visibility),
        //         onPressed: changeVisibility,
        //       ),
      ),
    );
  }

  Widget inputConfirmPassword() {
    return TextFormField(
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'This is a required field';
        }
        if (_password != _cpassword) {
          return 'Password didn\t matched';
        }
        if (value.length < 6) {
          return 'Password must contains atleast six letters';
        }
        return null;
      },
      onSaved: (String value) {
        _cpassword = value;
        // print(_cpassword);
      },
      decoration: InputDecoration(
        hintText: 'Retype Password',
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
                  Text('Here you can change your password'),
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
                              child: Center(child: Text('Current Password'))),
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 50,
                              child: Center(child: Text('New Password'))),
                          SizedBox(
                            width: 75,
                          ),
                          Container(
                            width: 250,
                            height: 50,
                            child: Center(child: inputNewPassword()),
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
                              child: Center(child: Text('Confirm Password'))),
                          SizedBox(
                            width: 50,
                          ),
                          Container(
                            width: 250,
                            height: 50,
                            child: Center(child: inputConfirmPassword()),
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
                height: 375,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
