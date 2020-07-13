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
  String dropdownValue = 'Bajaj Nagar Gate';

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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: 190.0,
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(
                    Icons.arrow_downward,
                    color: Colors.blueGrey[800],
                  ),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.blueGrey[800], fontSize: 16),
                  underline: Container(
                    height: 0,
                    color: Colors.blueGrey[800],
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>[
                    'Bajaj Nagar Gate',
                    'Yashwant Nagar Gate',
                    'IT Park Gate'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          color: Colors.blueGrey[800],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Expanded(
              child: Container(),
            ),
            SizedBox(
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
            SizedBox(
              width: 20.0,
            ),
            IconButton(icon: Icon(Icons.person), onPressed: () {}),
            SizedBox(
              width: 15,
            ),
          ],
        ),
      ),
    );
  }
}
