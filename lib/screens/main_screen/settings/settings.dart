import 'package:falcon_vision/models/database.dart';
import 'package:falcon_vision/models/gate.dart';
import 'package:falcon_vision/models/users.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  final double width;
  final Function changeSettingScreen;
  const SettingsView({
    Key key,
    this.width,
    this.changeSettingScreen,
  }) : super(key: key);
  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  Widget fieldQuery(String hintText, String mainText) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(hintText),
          SizedBox(
            width: 30,
          ),
          Text(mainText),
        ],
      ),
    );
  }

  Widget functionWidget(
      Function onTap, String mainText, String subText, num screen) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                mainText,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Text(subText,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal))
            ],
          ),
          Spacer(),
          mainText == 'Add User'
              ? RawMaterialButton(
                  onPressed: () {
                    if (userList.length <= 3) {
                      setState(() {
                        onTap(screen);
                      });
                    }
                  },
                  elevation: 2.0,
                  fillColor: Colors.blue[600],
                  child: Icon(
                    Icons.add,
                    size: 25.0,
                    color: Colors.blue[100],
                  ),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                )
              : Container(
                  width: 150,
                  child: RaisedButton(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.red[900]),
                    ),
                    color: Colors.red[900],
                    onPressed: () {
                      setState(() {
                        onTap(screen);
                      });
                    },
                    child: Text(
                      'change',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      // height: double.infinity,
      padding: EdgeInsets.all(10),
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.fromLTRB(150, 50, 150, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SelectableText(
                'Account Settings',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              SelectableText('This is your basic account settngs'),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.grey,
                height: 2,
              ),
              SizedBox(
                height: 30,
              ),
              fieldQuery('Username\t', userList[currentUser].name),
              SizedBox(height: 10),
              fieldQuery('Email  \t\t', userList[currentUser].email),
              SizedBox(height: 10),
              fieldQuery('Password\t', userList[currentUser].password),
              SizedBox(height: 10),
              fieldQuery('City  \t\t', city),
              SizedBox(height: 10),
              fieldQuery('Place  \t\t', place),
              SizedBox(height: 10),
              fieldQuery('State  \t\t', state),
              SizedBox(height: 10),
              fieldQuery('Pincode \t\t', pincode),
              SizedBox(
                height: 30,
              ),
              SelectableText(
                'Gate Settings',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              SelectableText('This is your basic gates settngs'),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.grey,
                height: 2,
              ),
              SizedBox(
                height: 30,
              ),
              fieldQuery('Gate1 \t\t', gateItems[0].name),
              SizedBox(height: 10),
              fieldQuery('Gate2 \t\t', gateItems[1].name),
              SizedBox(height: 10),
              fieldQuery('Gare3 \t\t', gateItems[2].name),
              SizedBox(
                height: 30,
              ),
              SelectableText(
                'General Settings',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              SelectableText('Change your general settngs here'),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.grey,
                height: 2,
              ),
              SizedBox(
                height: 20,
              ),
              functionWidget(widget.changeSettingScreen, 'Change Username',
                  'you can change your current username to something else', 1),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 2,
                color: Colors.grey[300],
              ),
              functionWidget(widget.changeSettingScreen, 'Change Password',
                  'you can change your current password to something else', 2),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 2,
                color: Colors.grey[300],
              ),

              functionWidget(widget.changeSettingScreen, 'Add User',
                  'you can add upto 3 users, Total users = ${userList.length}', 3),
              // Spacer(),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
