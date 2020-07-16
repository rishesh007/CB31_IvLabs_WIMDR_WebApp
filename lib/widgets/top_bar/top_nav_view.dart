import 'package:falcon_vision/models/gate.dart';
import 'package:falcon_vision/models/users.dart';
import 'package:falcon_vision/widgets/custom_drop_down/gates/gate_dropdown.dart';
import 'package:falcon_vision/widgets/custom_drop_down/users/user_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TopNavBar extends StatefulWidget {
  final double width;
  TopNavBar({@required this.width});
  @override
  _TopNavBarState createState() => _TopNavBarState();
}

class _TopNavBarState extends State<TopNavBar> {
  String _search;

  @override
  void initState() {
    super.initState();
    dropdownValue = gateItems[0].name;
    currentUser = 0;
  }

  void changeDropDownValue(num number) {
    setState(() {
      dropdownValue = gateItems[number].name;
    });
  }

  void changeUserData(num val) {
    setState(() {
      currentUser = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: widget.width,
      child: Material(
        elevation: 5,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
              color: Colors.transparent,
              width: 300.0,
              child: GateDropDown(
                changeDropDownValue: changeDropDownValue,
                text: dropdownValue,
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(35)),
                  color: Colors.blue.withOpacity(0.2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        child: TextFormField(
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Search',
                          ),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Email is Required';
                            }
                            return null;
                          },
                          onSaved: (String value) {
                            _search = value;
                            print(_search);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Container(
              width: 250,
              child: UserDropDown(
                currentUser: currentUser,
                changeUserData: changeUserData,
              ),
            ),
            // IconButton(icon: Icon(Icons.person), onPressed: () {}),
            SizedBox(
              width: 15,
            ),
          ],
        ),
      ),
    );
  }
}
