import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:falcon_vision/models/database.dart';
import 'package:flutter/material.dart';

class AuthVehicle extends StatefulWidget {
  final double width;

  const AuthVehicle({Key key, this.width}) : super(key: key);
  @override
  _AuthVehicleState createState() => _AuthVehicleState();
}

class _AuthVehicleState extends State<AuthVehicle> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _vehicleNumber;
  bool _block = false;
  String dropdownValue = 'Register';
  String message = "";
  Widget inputVehicleNumber() {
    return TextFormField(
      obscureText: false,
      keyboardType: TextInputType.name,
      validator: (String value) {
        if (value.isEmpty) {
          return 'This is a required field';
        }
        if (value.length < 9) {
          return 'Enter valid Vehicle number';
        }
        // implement user should not present in UserList

        return null;
      },
      onSaved: (String value) {
        _vehicleNumber = value;
        print(_vehicleNumber);
      },
      decoration: InputDecoration(
        hintText: 'MH02AF1234',
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Here you can Register or Block a vehicle',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(
                height: 20,
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
                              child: Center(child: Text('Vehicle Number\t'))),
                          SizedBox(
                            width: 50,
                          ),
                          Container(
                            width: 250,
                            height: 50,
                            child: Center(child: inputVehicleNumber()),
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
                              child: Center(child: Text('Register/Block'))),
                          SizedBox(
                            width: 75,
                          ),
                          Container(
                            width: 250,
                            height: 50,
                            child: DropdownButton<String>(
                              value: dropdownValue,
                              icon: Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 16,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                              underline: Container(
                                height: 2,
                                color: Colors.black,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  if (newValue == 'Register') {
                                    _block = false;
                                  } else {
                                    _block = true;
                                  }
                                  dropdownValue = newValue;
                                  print(dropdownValue);
                                });
                              },
                              items: <String>[
                                'Register',
                                'Block',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
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
                              if (_block) {
                                num visits = 0;
                                Firestore.instance
                                  .collection(mainAuthId)
                                  .document('reg_vehicle').collection('verified').document(_vehicleNumber)
                                  .get()
                                  .then((DocumentSnapshot ds) {
                                    visits = ds.data['visits'];
                                // use ds as a snapshot
                                });
                                Firestore.instance
                                    .collection(mainAuthId)
                                    .document('reg_vehicle').collection('verified').document(_vehicleNumber)
                                    .setData({
                                  'number': _vehicleNumber,
                                  'visits': visits,
                                  'block': _block,
                                });
                                
                              } else {
                                Firestore.instance
                                    .collection(mainAuthId)
                                    .document('reg_vehicle').collection('verified').document(_vehicleNumber)
                                    .setData({
                                  'number': _vehicleNumber,
                                  'visits': 0,
                                  'block': _block,
                                });
                              }
                              setState(() {
                                message = "Vechile is " + dropdownValue;
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
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            message,
                            style: TextStyle(
                              color: Colors.red[800],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )
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
