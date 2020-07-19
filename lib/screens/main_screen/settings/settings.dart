import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  final double width;
  const SettingsView({
    Key key,
    this.width,
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

  Widget functionWidget(Function onTap, String mainText, String subText) {
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
                  onPressed: onTap,
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
                        side: BorderSide(color: Colors.grey[300])),
                    onPressed: onTap,
                    child: Text('change'),
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
              fieldQuery('Username\t', 'Rishesh Agarwal'),
              SizedBox(height: 10),
              fieldQuery('Email  \t\t', 'rishesh.pro@gmail.com'),
              SizedBox(height: 10),
              fieldQuery('Password\t', '123456'),
              SizedBox(height: 10),
              fieldQuery('City  \t\t', 'Nagpur'),
              SizedBox(height: 10),
              fieldQuery('Place  \t\t', 'VNIT'),
              SizedBox(height: 10),
              fieldQuery('State  \t\t', 'Maharashtra'),
              SizedBox(height: 10),
              fieldQuery('Pincode \t\t', '440010'),
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
              fieldQuery('Gate1 \t\t', 'Ambazari Gate'),
              SizedBox(height: 10),
              fieldQuery('Gate2 \t\t', 'Yashwant Nagar Gate'),
              SizedBox(height: 10),
              fieldQuery('Gare3 \t\t', 'IT Park Gate'),
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
              functionWidget(null, 'Change Username',
                  'you can change your current username to something else'),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 2,
                color: Colors.grey[300],
              ),
              functionWidget(null, 'Change Password',
                  'you can change your current password to something else'),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 2,
                color: Colors.grey[300],
              ),

              functionWidget(null, 'Add User', 'you can add upto 2 users'),
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
