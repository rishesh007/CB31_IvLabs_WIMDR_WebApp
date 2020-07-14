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

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  // double navBarWidth = 230;
  static num screen = 1;
  AnimationController _animationController;
  Animation<double> widthAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    widthAnimation =
        Tween<double>(begin: 230, end: 70).animate(_animationController);
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
    });
  }

  void navBarAnimation(bool isCollapsed) {
    
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, widget) => Row(
        children: <Widget>[
          NavigationDrawer(
            changeWidth: changeWidth,
            changeScreen: changeScreen,
          ),
          Column(
            children: <Widget>[
              TopNavBar(
                width: MediaQuery.of(context).size.width - widthAnimation.value,
              ),
              if (screen == 1) DashboardView(width: MediaQuery.of(context).size.width - widthAnimation.value,),
              if (screen == 2) NotificationView(),
              if (screen == 3) EventsView(),
              if (screen == 4) SettingsView(),
            ],
          ),
        ],
      ),
    );
  }
}
