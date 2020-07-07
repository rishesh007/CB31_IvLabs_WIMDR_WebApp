import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isVisible = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email;
  String _password;

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
      body: Container(
        child: Center(
          child: Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(horizontal: 130, vertical: 25),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
            child: Container(
              width: double.infinity,
              height: 650,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 18,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Sign in",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
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
                                SizedBox(height: 15),
                                Center(
                                  child: RaisedButton(
                                    onPressed: (){
                                      if(!_formKey.currentState.validate()){
                                        return;
                                      }

                                      _formKey.currentState.save();
                                    },
                                    child: Text('LOGIN',style: TextStyle(
                                      color: Colors.white,fontWeight: FontWeight.bold,
                                    ),),
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Material(
                        borderRadius: BorderRadius.circular(17),
                        child: Image.network(
                          'https://media.giphy.com/media/H6fu8xp9AHusU/giphy.gif',
                          fit: BoxFit.cover,
                          height: double.infinity,
                          width: double.infinity,
                        ),
                        // child: Text('my'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCustomTextField(String hintText, IconData icon, bool isPassword) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          obscureText: isPassword,
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
        ),
      ],
    );
  }
}
