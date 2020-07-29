import 'package:flutter/material.dart';

class Step4 extends StatefulWidget {
  // final Function changeStep;
  final Function setStep4;
  final Function pushData;
  const Step4({Key key, /*this.changeStep,*/ this.setStep4, this.pushData})
      : super(key: key);

  @override
  _Step4State createState() => _Step4State();
}

class _Step4State extends State<Step4> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String gate1;
  String gate2;
  String gate3;
  String code11;
  String code12;
  String code21;
  String code22;
  String code31;
  String code32;

  Widget inputGate1() {
    return TextFormField(
      obscureText: false,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Name of First Gate',
        prefixIcon: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Icon(Icons.home),
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'This field is Required';
        }
        return null;
      },
      onSaved: (String value) {
        gate1 = value;
        // print(gate1);
      },
    );
  }

  Widget inputGate2() {
    return TextFormField(
      obscureText: false,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Name of Second Gate',
        prefixIcon: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Icon(Icons.home),
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'This field is Required';
        }
        return null;
      },
      onSaved: (String value) {
        gate2 = value;
        // print(gate2);
      },
    );
  }

  Widget inputGate3() {
    return TextFormField(
      obscureText: false,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Name of Third Gate',
        prefixIcon: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Icon(Icons.home),
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'This field is Required';
        }
        return null;
      },
      onSaved: (String value) {
        gate3 = value;
        // print(gate3);
      },
    );
  }

  Widget inputCode11() {
    return TextFormField(
      obscureText: false,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Entry Camera Code',
        prefixIcon: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Icon(Icons.vpn_key),
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'This field is Required';
        }
        return null;
      },
      onSaved: (String value) {
        code11 = value;
        // print(code11);
      },
    );
  }

  Widget inputCode12() {
    return TextFormField(
      obscureText: false,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Exit Camera Code',
        prefixIcon: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Icon(Icons.vpn_key),
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'This field is Required';
        }
        return null;
      },
      onSaved: (String value) {
        code12 = value;
        // print(code12);
      },
    );
  }

  Widget inputCode21() {
    return TextFormField(
      obscureText: false,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Entry Camera Code',
        prefixIcon: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Icon(Icons.vpn_key),
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'This field is Required';
        }
        return null;
      },
      onSaved: (String value) {
        code21 = value;
        // print(code21);
      },
    );
  }

  Widget inputCode22() {
    return TextFormField(
      obscureText: false,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Exit Camera Code',
        prefixIcon: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Icon(Icons.vpn_key),
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'This field is Required';
        }
        return null;
      },
      onSaved: (String value) {
        code22 = value;
        // print(code22);
      },
    );
  }

  Widget inputCode31() {
    return TextFormField(
      obscureText: false,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Entry Camera Code',
        prefixIcon: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Icon(Icons.vpn_key),
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'This field is Required';
        }
        return null;
      },
      onSaved: (String value) {
        code31 = value;
        // print(code31);
      },
    );
  }

  Widget inputCode32() {
    return TextFormField(
      obscureText: false,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Exit Camera Code',
        prefixIcon: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Icon(Icons.vpn_key),
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'This field is Required';
        }
        return null;
      },
      onSaved: (String value) {
        code32 = value;
        // print(code32);
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
                  height: 20,
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
                  'Just a little more to complete',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SelectableText.rich(
                  TextSpan(
                    text: 'Steps: ',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                        text: '4 out of 4',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: SelectableText(
                        'Enter the details of each gate',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: SelectableText('Gate 1'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      inputGate1(),
                      Row(
                        children: <Widget>[
                          Container(
                            width: 220,
                            child: inputCode11(),
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          ),
                          Container(
                            width: 220,
                            child: inputCode12(),
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          ),
                        ],
                      ),
                      // inputCode11(),
                      // inputCode12(),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: SelectableText('Gate 2'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      inputGate2(),
                      Row(
                        children: <Widget>[
                          Container(
                            width: 220,
                            child: inputCode21(),
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          ),
                          Container(
                            width: 220,
                            child: inputCode22(),
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: SelectableText('Gate 3'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      inputGate3(),
                      Row(
                        children: <Widget>[
                          Container(
                            width: 220,
                            child: inputCode31(),
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          ),
                          Container(
                            width: 220,
                            child: inputCode32(),
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                          onPressed: ()  {
                            if (!_formKey.currentState.validate()) {
                              return;
                            }
                            _formKey.currentState.save();
                            setState(() {
                              widget.setStep4(
                                  [gate1, gate2, gate3],
                                  [code11, code21, code31],
                                  [code12, code22, code32]);

                              // push database;
                              // pushRegisterData();
                              widget.pushData();
                              Navigator.pushNamed(context, '/user');
                              // widget.changeStep();
                            });
                            
                          },
                          child: Text(
                            'Submit',
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
