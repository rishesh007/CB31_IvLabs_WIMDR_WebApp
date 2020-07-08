import 'package:flutter/material.dart';

class MobileLogin extends StatefulWidget {
  @override
  _MobileLoginState createState() => _MobileLoginState();
}

class _MobileLoginState extends State<MobileLogin> {
  bool isVisible = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email;
  String _password;
  bool checkedValue = false;
  void changeVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  Widget inputEmail(String hintText, IconData icon, bool isPassword) {
    return TextFormField(
      obscureText: isPassword,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Icon(icon),
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(r"([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})")
            .hasMatch(value)) {
          return 'Enter a valid email';
        }

        return null;
      },
      onSaved: (String value) {
        _email = value;
        print(_email);
      },
    );
  }

  Widget inputPassword(String hintText, IconData icon, bool isPassword) {
    return TextFormField(
      obscureText: isPassword,
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
        print(_password);
      },
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Icon(icon),
        ),
        suffixIcon: (hintText == 'Enter your Password')
            ? (isPassword
                ? IconButton(
                    icon: Icon(Icons.visibility_off),
                    onPressed: changeVisibility,
                  )
                : IconButton(
                    icon: Icon(Icons.visibility),
                    onPressed: changeVisibility,
                  ))
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.indigo[50],
      body: Center(
        child: Container(
          width: 500.0,
          height: double.infinity,
          child: Card(
            elevation: 2,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 20.0,
                      ),
                      Center(
                        child: Image(
                          image: AssetImage('images/falcon.png'),
                          width: 120.0,
                          height: 120.0,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Center(
                        child: Text(
                          "Welcome Back",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Center(
                        child: Text(
                          "Sign in if you have account in here",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            inputEmail(
                              "you@email.com",
                              Icons.mail,
                              false,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            inputPassword(
                              "Enter your Password",
                              Icons.lock,
                              isVisible,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Checkbox(
                                    value: checkedValue,
                                    onChanged: (newValue) {
                                      setState(() {
                                        checkedValue = newValue;
                                      });
                                    }),
                                Text('Remember Me'),
                                Expanded(
                                  child: Container(),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: FlatButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Forgot Password',
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: double.infinity,
                              height: 50.0,
                              child: RaisedButton(
                                onPressed: () {
                                  if (!_formKey.currentState.validate()) {
                                    return;
                                  }

                                  _formKey.currentState.save();
                                },
                                child: Text(
                                  'Log in',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Don\'t have an account yet? ',
                                  style: TextStyle(color: Colors.grey[400]),
                                ),
                                new GestureDetector(
                                  onTap: () {
                                    print('gesture detected');
                                  },
                                  child: Text(
                                    'Sign up',
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
