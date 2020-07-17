import 'package:flutter/material.dart';

class Step3 extends StatefulWidget {
  @override
  _Step3State createState() => _Step3State();
}

class _Step3State extends State<Step3> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _place;
  String _city;
  String _state;
  String _pincode;

  Widget inputplace() {
    return TextFormField(
      obscureText: false,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Name',
        prefixIcon: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Icon(Icons.home),
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _place = value;
        print(_place);
      },
    );
  }

  Widget inputCity() {
    return TextFormField(
      obscureText: false,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'City',
        prefixIcon: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Icon(Icons.location_city),
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'This field is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _city = value;
        print(_city);
      },
    );
  }

  Widget inputState() {
    return TextFormField(
      obscureText: false,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'State',
        prefixIcon: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Icon(Icons.map),
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'This field is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _state = value;
        print(_state);
      },
    );
  }

  Widget inputPinCode() {
    return TextFormField(
      obscureText: false,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Pin Code',
        prefixIcon: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Icon(Icons.place),
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'This field is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _pincode = value;
        print(_pincode);
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
                        text: '3 out of 4',
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
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: SelectableText(
                        'Enter the details of the chosen place',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18),
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      inputplace(),
                      SizedBox(
                        height: 10,
                      ),
                      inputCity(),
                      SizedBox(
                        height: 10,
                      ),
                      inputState(),
                      SizedBox(
                        height: 10,
                      ),
                      inputPinCode(),
                      SizedBox(
                        height: 50,
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
