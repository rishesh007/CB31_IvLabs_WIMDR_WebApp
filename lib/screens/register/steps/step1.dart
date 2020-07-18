import 'package:falcon_vision/models/database.dart';
import 'package:flutter/material.dart';

class Step1 extends StatefulWidget {
  final Function changeStep;
  final Function setStep1;
  const Step1({Key key, this.changeStep, this.setStep1}) : super(key: key);
  @override
  _Step1State createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // String _activationKey = '12345834593'; // Enter Activation Key
  String _authId;
  @override
  void initState() {
    super.initState();
    getAuthenticationId();
  }

  Widget inputActivationName() {
    return TextFormField(
      obscureText: false,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Activation Key',
        prefixIcon: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Icon(Icons.vpn_key),
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Activation Key is required';
        }
        for (int i = 0; i < authIds.length; i++) {
          if (value == authIds[i]) {
            return null;
          }
        }

        return 'Activation Key didn\t match';
      },
      onSaved: (String value) {
        _authId = value;
        // print(_authId);
      },
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
                  'Let\'s move to next step',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                SelectableText.rich(
                  TextSpan(
                    text: 'Steps: ',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                        text: '1 out of 4',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50,
                ),
                SelectableText(
                  'Enter your Activation key from your purchased subscription',
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      inputActivationName(),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () {
                            // Future<List<dynamic>> _list = getAuthenticationId();
                            if (!_formKey.currentState.validate()) {
                              return;
                            }
                            _formKey.currentState.save();
                            setState(() {
                              widget.setStep1(_authId);
                              widget.changeStep(2);
                            });
                          },
                          child: Text(
                            'Next Step',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
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
      ),
    );
  }
}
