import 'package:falcon_vision/screens/main_screen/dashborad/dashboard.dart';
import 'package:falcon_vision/screens/main_screen/events/events.dart';
import 'package:falcon_vision/screens/main_screen/notification/notifcation.dart';
import 'package:falcon_vision/screens/main_screen/settings/settings.dart';
import 'package:falcon_vision/widgets/navigation_drawer/navigation_drawer_widger.dart';
import 'package:falcon_vision/widgets/top_bar/top_nav_view.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double navBarWidth = 210;
  static num screen = 1;

  void changeWidth() {
    setState(() {
      navBarWidth = (navBarWidth == 210) ? 70 : 210;
      // print(navBarWidth);
    });
  }

  void changeScreen(num val) {
    setState(() {
      screen = val+1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        NavigationDrawer(
          changeWidth: changeWidth,
          changeScreen: changeScreen,
        ),
        Column(
          children: <Widget>[
            TopNavBar(
              width: MediaQuery.of(context).size.width - navBarWidth,
            ),
            if (screen == 1) DashboardView(width: MediaQuery.of(context).size.width - navBarWidth,),
            if (screen == 2) NotificationView(),
            if (screen == 3) EventsView(),
            if (screen == 4) SettingsView(),
          ],
        ),
      ],
    );
  }
}
