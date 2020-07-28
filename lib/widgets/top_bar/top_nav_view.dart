import 'package:falcon_vision/models/gate.dart';
import 'package:falcon_vision/models/users.dart';
import 'package:falcon_vision/widgets/custom_drop_down/gates/gate_dropdown.dart';
import 'package:falcon_vision/widgets/custom_drop_down/users/user_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TopNavBar extends StatefulWidget {
  final Function changeDropDownValue;
  final double width;
  final Function changeUserData;
  TopNavBar({@required this.width, @required this.changeDropDownValue, this.changeUserData});
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

  // void changeDropDownValue(num number) {
  //   setState(() {
  //     dropdownValue = gateItems[number].name;
  //     overviewData.clear();
  //     overviewData = gateItems[number].overviewData;
  //   });
  // }

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
              width: 350.0,
              child: GateDropDown(
                changeDropDownValue: widget.changeDropDownValue,
                text: dropdownValue,
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Container(
              width: 250,
              child: UserDropDown(
                currentUser: currentUser,
                changeUserData: widget.changeUserData,
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
