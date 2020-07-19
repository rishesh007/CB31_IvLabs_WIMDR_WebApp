import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:falcon_vision/models/database.dart';
import 'package:falcon_vision/models/gate.dart';
import 'package:falcon_vision/models/overview.dart';
import 'package:falcon_vision/models/plot_data.dart';
import 'package:falcon_vision/models/users.dart';
import 'package:falcon_vision/screens/loading/loading.dart';
import 'package:falcon_vision/screens/main_screen/dashborad/dashboard.dart';
import 'package:falcon_vision/screens/main_screen/notification/notifcation.dart';
import 'package:falcon_vision/screens/main_screen/settings/settings.dart';
import 'package:falcon_vision/widgets/navigation_drawer/navigation_drawer_widger.dart';
import 'package:falcon_vision/widgets/top_bar/top_nav_view.dart';

// import 'dart:html' as html;

class MainScreen extends StatefulWidget {
  final Function changeToDashboard;
  const MainScreen({
    Key key,
    this.changeToDashboard,
  }) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  // double navBarWidth = 230;
  var iskebaad = false;
  static num screen = 1;
  AnimationController _animationController;
  Animation<double> widthAnimation;

  @override
  void initState() {
    super.initState();
    // html.window.location.reload();
    getData();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    widthAnimation =
        Tween<double>(begin: 230, end: 70).animate(_animationController);
  }

  Future<void> getData() async {
    List<DocumentSnapshot> templist;
    List<Map<dynamic, dynamic>> list = new List();
    CollectionReference collectionRef = Firestore.instance.collection("user");
    QuerySnapshot collectionSnapshot = await collectionRef.getDocuments();
    templist = collectionSnapshot.documents;

    list = templist.map((DocumentSnapshot docSnapshot) {
      return docSnapshot.data;
    }).toList();
    setState(() {
      for (int i = 0; i < list.length; i++) {
        if (list[i]['email'] == mainEmail) {
          mainAuthId = list[i]['id'];
          break;
        }
      }
      for (int i = 0; i < list.length; i++) {
        if (list[i]['id'] == mainAuthId) {
          User _u = User.fromMap(list[i]);
          userList.add(_u);
        }
      }
    });

    var v = await getAllData();
    setState(() {
      iskebaad = v;
    });
    // return v;
  }

  Future<bool> getAllData() async {
    List<DocumentSnapshot> templist;
    List<Map<dynamic, dynamic>> list = new List();
    CollectionReference collectionReference =
        Firestore.instance.collection(mainAuthId);
    QuerySnapshot collectionSnapshot = await collectionReference.getDocuments();
    templist = collectionSnapshot.documents;
    list = templist.map((DocumentSnapshot docSnapshot) {
      return docSnapshot.data;
    }).toList();
    List<String> _list = [];
    setState(() {
      for (int i = 0; i < list[0]['gateName'].length; i++) {
        _list.add(list[0]['gateName'][i].toString());
      }
    });

    var v = await getAllGateData(_list);
    return v;
  }

  Future<bool> getAllGateData(List<String> _list) async {
    for (int i = 0; i < 3; i++) {
      List<DocumentSnapshot> templist;
      List<Map<dynamic, dynamic>> list = new List();
      CollectionReference collectionReference = Firestore.instance
          .collection(mainAuthId)
          .document('gates')
          .collection('gate' + (i + 1).toString())
          .document('data')
          .collection('data');
      QuerySnapshot collectionSnapshot =
          await collectionReference.getDocuments();
      templist = collectionSnapshot.documents;
      list = templist.map((DocumentSnapshot docSnapshot) {
        return docSnapshot.data;
      }).toList();

      setState(() {
        List<OverviewData> _over = [];
        for (int j = 1; j <= list.length; j++) {
          OverviewData _o = OverviewData(
              entry: list[j % 3]['entry'],
              exit: list[j % 3]['exit'],
              incEntry: list[j % 3]['incEntry'],
              incExit: list[j % 3]['incExit'],
              incTotal: list[j % 3]['incTotal'],
              total: list[j % 3]['total'],
              type: (j - 1 + 3) % 3);
          _over.add(_o);
        }

        Gate _g = Gate(
          gateNumber: i,
          isSelected: (i == 0) ? true : false,
          name: _list[i],
          overviewData: _over,
        );
        gateItems.add(_g);
      });
    }
    var v = getPlotData();
    return v;
  }

  Future<bool> getPlotData() async {
    List<DocumentSnapshot> templist;
    List<Map<dynamic, dynamic>> list = new List();
    CollectionReference collectionReference =
        Firestore.instance.collection(mainAuthId);
    QuerySnapshot collectionSnapshot = await collectionReference.getDocuments();
    templist = collectionSnapshot.documents;
    list = templist.map((DocumentSnapshot docSnapshot) {
      return docSnapshot.data;
    }).toList();
    // print(list);
    setState(() {
      monthlyData = [
        Monthly(month: 'Jan', data: list[1]['Jan']),
        Monthly(month: 'Feb', data: list[1]['Feb']),
        Monthly(month: 'Mar', data: list[1]['Mar']),
        Monthly(month: 'Apr', data: list[1]['Apr']),
        Monthly(month: 'May', data: list[1]['May']),
        Monthly(month: 'Jun', data: list[1]['Jun']),
        Monthly(month: 'Jul', data: list[1]['Jul']),
        Monthly(month: 'Aug', data: list[1]['Aug']),
        Monthly(month: 'Sep', data: list[1]['Sep']),
        Monthly(month: 'Oct', data: list[1]['Oct']),
        Monthly(month: 'Nov', data: list[1]['Nov']),
        Monthly(month: 'Dec', data: list[1]['Dec']),
      ];

      weeklyData = [
        Weekly(data: list[2]['Mon'], day: 'Mon'),
        Weekly(data: list[2]['Tue'], day: 'Tue'),
        Weekly(data: list[2]['Wed'], day: 'Wed'),
        Weekly(data: list[2]['Thr'], day: 'Thr'),
        Weekly(data: list[2]['Fri'], day: 'Fri'),
        Weekly(data: list[2]['Sat'], day: 'Sat'),
        Weekly(data: list[2]['Sun'], day: 'Sun'),
      ];
    });

    return true;
  }

  void changeWidth(bool isCollapsed) {
    setState(() {
      // isCollapsed = !isCollapsed;
      isCollapsed
          ? _animationController.forward()
          : _animationController.reverse();
    });
  }

  void changeScreen(num val) {
    setState(() {
      screen = val + 1;
      if (screen == 4) {
        widget.changeToDashboard();
      }
    });
  }

  void changeDropDownValue(num number) {
    setState(() {
      dropdownValue = gateItems[number].name;
      // overviewData.clear();
      overviewData = gateItems[number].overviewData;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(gateItems[]);
    // Function changeToDashboard = widget.changeToDashboard;
    if (iskebaad) {
      setState(() {
        overviewData = gateItems[gateNumber].overviewData;
      });
      Function changeToDashboard = widget.changeToDashboard;
      // print(gateItems[gateNumber].overviewData);
      return AnimatedBuilder(
        animation: _animationController,
        builder: (context, widget) => Row(
          children: <Widget>[
            NavigationDrawer(
              changeToDashboard: changeToDashboard,
              changeWidth: changeWidth,
              changeScreen: changeScreen,
            ),
            Column(
              children: <Widget>[
                TopNavBar(
                  changeDropDownValue: changeDropDownValue,
                  width:
                      MediaQuery.of(context).size.width - widthAnimation.value,
                ),
                if (screen == 1)
                  DashboardView(
                    width: MediaQuery.of(context).size.width -
                        widthAnimation.value,
                  ),
                if (screen == 2)
                  NotificationView(
                    width: MediaQuery.of(context).size.width -
                        widthAnimation.value,
                  ),
                if (screen == 3)
                  SettingsView(
                    width: MediaQuery.of(context).size.width -
                        widthAnimation.value,
                  ),
              ],
            ),
          ],
        ),
      );
    } else {
      return Loading();
    }
  }
}
