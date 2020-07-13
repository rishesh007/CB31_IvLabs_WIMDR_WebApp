import 'package:falcon_vision/widgets/table_widget/table.dart';
import 'package:flutter/material.dart';

class EntryExitView extends StatefulWidget {
  final double width;
  EntryExitView({@required this.width});
  @override
  _EntryExitViewState createState() => _EntryExitViewState();
}

class _EntryExitViewState extends State<EntryExitView> {
  
  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size.height);
    return Container(
      width: widget.width,
      height: MediaQuery.of(context).size.height - 70 - 300,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 0, 10.0, 10.0),
        child: Container(
          color: Colors.transparent,
          child: Card(
            elevation: 5,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                FlatButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Entry',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Container(
                                    color: Colors.blue, height: 3, width: 150),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                FlatButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Exit',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    )),
                                Container(
                                    color: Colors.red, height: 3, width: 150),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Date: ',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '3rd Feb 2020',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Expanded(child: Container()),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 15.0,
                                height: 15.0,
                                decoration: new BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Allowed',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: 15.0,
                                height: 15.0,
                                decoration: new BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Not Allowed',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                TableData(
                  width: widget.width,
                ),
                // Expanded(child: Container())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
