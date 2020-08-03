import 'package:falcon_vision/models/gate.dart';
import 'package:falcon_vision/widgets/table_widget/table.dart';
import 'package:falcon_vision/widgets/table_widget/table_model.dart';
import 'package:flutter/material.dart';

class EntryExitView extends StatefulWidget {
  final double width;
  EntryExitView({@required this.width});
  @override
  _EntryExitViewState createState() => _EntryExitViewState();
}

class _EntryExitViewState extends State<EntryExitView> {
  bool view = true;
  var now = new DateTime.now();

  @override
  void initState() {
    getVehicleData();
    super.initState();
  }

  void chageView() {
    setState(() {
      view = !view;
    });
  }

  void getVehicleData() {
    setState(() {
      if (view) {
        vehicleData = entryData;
      } else {
        vehicleData = exitData;
      }
    });
  }

  void funcFilter(List<String> selectedCountList, List<String> countList) {
    setState(() {
      List<bool> visited = [];
      for (int i = 0; i < vehicleData.length; i++) {
        visited.add(false);
      }
      getVehicleData();
      List<VehicleData> _v = [];
      List<num> _query = [];
      for (int i = 0; i < selectedCountList.length; i++) {
        for (int j = 0; j < countList.length; j++) {
          if (selectedCountList[i] == countList[j]) {
            _query.add(j);
          }
        }
      }
      for (int i = 0; i < _query.length; i++) {
        for (int j = 0; j < vehicleData.length; j++) {
          if (_query[i] < 24) {
            String _s = vehicleData[j].time.substring(0, 2);
            int time = int.parse(_s);
            // print(_query[i].toString() + " " + time.toString());
            if (time == _query[i]) {
              // print("in if");
              visited[j] = true;
            }
          } else if (_query[i] == 24) {
            if (vehicleData[j].vehicleType.toUpperCase() == countList[24].toUpperCase()) {
              visited[j] = true;
            }
          } else if (_query[i] == 25) {
            if (vehicleData[j].vehicleType.toUpperCase() == countList[25].toUpperCase()) {
              visited[j] = true;
            }
          } else if (_query[i] == 26) {
            if (vehicleData[j].vehicleType.toUpperCase() == countList[26].toUpperCase()) {
              visited[j] = true;
            }
          } else if (_query[i] == 27) {
            if (vehicleData[j].auth != "FALSE") {
              visited[j] = true;
            }
          } else if (_query[i] == 28) {
            if (vehicleData[j].auth == "FALSE") {
              visited[j] = true;
            }
          }
        }
      }
      for (int i = 0; i < visited.length; i++) {
        // print(visited[i].toString());
        if (visited[i]) {
          _v.add(vehicleData[i]);
          // print(vehicleData[i].numberPlate +
          //     " " +
          //     gateItems[gateNumber].name +
          //     " ");
        }
      }

      vehicleData = _v;
    });
  }

  @override
  Widget build(BuildContext context) {
    // getVehicleData();
    // print(entryData.length);
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
                                Container(
                                  width: 150,
                                  height: 50,
                                  child: FlatButton(
                                    onPressed: () {
                                      if (!view) {
                                        setState(() {
                                          chageView();
                                          getVehicleData();
                                        });
                                      }
                                    },
                                    color: view
                                        ? Colors.blue.withOpacity(.1)
                                        : Colors.transparent,
                                    child: Text(
                                      'Entry',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                    color:
                                        view ? Colors.blue : Colors.transparent,
                                    height: 3,
                                    width: 150),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Container(
                                  width: 150,
                                  height: 50,
                                  child: FlatButton(
                                    onPressed: () {
                                      if (view) {
                                        setState(() {
                                          chageView();
                                          getVehicleData();
                                        });
                                      }
                                    },
                                    color: !view
                                        ? Colors.blue.withOpacity(.1)
                                        : Colors.transparent,
                                    child: Text(
                                      'Exit',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                Container(
                                    color: !view
                                        ? Colors.blue
                                        : Colors.transparent,
                                    height: 3,
                                    width: 150),
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
                                now.day.toString() +
                                    "-" +
                                    now.month.toString() +
                                    "-" +
                                    now.year.toString(),
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
                                'Registered',
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
                                'Non Registered',
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
                  funcFilter: funcFilter,
                  getVehicleData: getVehicleData,
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
