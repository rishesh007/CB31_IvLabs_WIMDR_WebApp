import 'package:flutter/material.dart';

class OverViewCard extends StatefulWidget {
  @override
  _OverViewCardState createState() => _OverViewCardState();
}

class _OverViewCardState extends State<OverViewCard> {
  String dropdownValue = 'Today';
  @override
  Widget build(BuildContext context) {
    
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 8, 10, 16),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    SizedBox(
                      width: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Overview',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Container(
                        width: 130.0,
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          icon: Icon(
                            Icons.arrow_downward,
                            color: Colors.blueGrey[800],
                          ),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(
                              color: Colors.blueGrey[800], fontSize: 20),
                          underline: Container(
                            height: 0,
                            color: Colors.blueGrey[800],
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                          items: <String>['Today', 'Last Week', 'Last Month']
                              .map<DropdownMenuItem<String>>((String value) {
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
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 0, 20, 20),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Enteries ',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                Text(
                                  '+234',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.red[900],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                '2087',
                                style: TextStyle(
                                  fontSize: 35,
                                  color: Colors.blueGrey[600],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Exit ',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                Text(
                                  '-98',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.red[900],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              '2074',
                              style: TextStyle(
                                fontSize: 35,
                                color: Colors.blueGrey[600],
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  'Total ',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                Text(
                                  '+145',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.red[900],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                '3184',
                                style: TextStyle(
                                  fontSize: 35,
                                  color: Colors.blueGrey[600],
                                ),
                              ),
                            )
                          ],
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
