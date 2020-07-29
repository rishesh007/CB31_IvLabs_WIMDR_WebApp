import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  // final Function toggleView;
  final Function changeStep;
  final Function setStep0;
  const RegisterView({Key key, /*this.toggleView,*/ this.changeStep, this.setStep0})
      : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool loading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _user;
  String _number;
  String _email;
  String _password;
  String _cpassword;
  var isPasswordVisible = false;
  bool checkedValue = false;

  void changeVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  Widget inputNumber() {
    return TextFormField(
      obscureText: false,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: 'Mobile Number',
        prefixIcon: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Icon(Icons.dialpad),
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Mobile Number is Required';
        }
        // {^\+?[0-9-]+$}
        if (value.length < 10) {
          return 'Enter a valid Mobile Number';
        }

        return null;
      },
      onSaved: (String value) {
        _number = value;
        // // print(_number);
      },
    );
  }

  Widget inputEmail() {
    return TextFormField(
      obscureText: false,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Email',
        prefixIcon: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Icon(Icons.email),
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

  Widget inputUserName() {
    return TextFormField(
      obscureText: false,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Userame',
        prefixIcon: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Icon(Icons.verified_user),
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'First name is required';
        }

        return null;
      },
      onSaved: (String value) {
        _user = value;
        // print(_user);
      },
    );
  }

  Widget inputPassword() {
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
        _password = value;
        // print(_password);
      },
      decoration: InputDecoration(
        hintText: 'Password',
        prefixIcon: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Icon(Icons.lock),
        ),
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
        prefixIcon: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Icon(Icons.lock),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 500,
        height: MediaQuery.of(context).size.height,
        child: Card(
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Image(
                    image: AssetImage('images/falcon.png'),
                    width: 120.0,
                    height: 120.0,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SelectableText(
                  'Sign Up',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                SelectableText(
                  'Let\'s get you on board',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      inputUserName(),
                      SizedBox(
                        height: 10,
                      ),
                      inputEmail(),
                      SizedBox(
                        height: 10,
                      ),
                      inputNumber(),
                      SizedBox(
                        height: 10,
                      ),
                      inputPassword(),
                      SizedBox(
                        height: 10,
                      ),
                      inputConfirmPassword(),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          Checkbox(
                            value: checkedValue,
                            onChanged: (newValue) {
                              setState(() {
                                checkedValue = newValue;
                              });
                            },
                          ),
                          SelectableText('I agree to your terms and conditons'),
                          Expanded(
                            child: Container(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () async {
                            if (!_formKey.currentState.validate()) {
                              // setState(() => loading = true);

                              return;
                            }
                            _formKey.currentState.save();
                            setState(() {
                              // print(_email);
                              widget.setStep0(
                                  _user, _email, _number, _password);
                              widget.changeStep(1);
                            });
                            
                          },
                          child: Text(
                            'Register',
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
                          SelectableText('Alredy have an Account?'),
                          GestureDetector(
                            onTap: () {
                              // widget.toggleView();
                              Navigator.pop(context);
                              // print('change to login');
                            },
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
