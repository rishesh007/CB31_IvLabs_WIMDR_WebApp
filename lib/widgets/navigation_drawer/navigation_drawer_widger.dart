import 'package:flutter/material.dart';
import 'list_tile_widget.dart';
import 'navigation_model.dart';
import 'navigation_theme.dart';

class NavigationDrawer extends StatefulWidget {
  // double navBarWidth;
  final Function changeScreen;
  final Function changeWidth;
  NavigationDrawer({this.changeScreen, this.changeWidth});
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer>
    with SingleTickerProviderStateMixin {
  double maxWidth = 230;
  double minWidth = 70;
  bool isCollapsed = false;
  AnimationController _animationController;
  Animation<double> widthAnimation;
  int currentSelectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth)
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    Function changeWidth = widget.changeWidth;
    Function changeScreen = widget.changeScreen;
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, widget) =>
          getWidget(context, widget, changeWidth, changeScreen),
    );
  }

  Widget getWidget(context, widget, changeWidth, changeScreen) {
    return Material(
      elevation: 80.0,
      child: Container(
        width: widthAnimation.value,
        color: drawerBackgroundColor,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0,8,0,0),
              child: ListTileView(
                onTap: () {
                  setState(() {
                    isCollapsed = !isCollapsed;
                    isCollapsed
                        ? _animationController.forward()
                        : _animationController.reverse();
                    changeWidth(isCollapsed);
                  });
                },
                title: 'IvLabs',
                icon: Icons.person,
                isAnimatedIcon: true,
                animationController: _animationController,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.fromLTRB(8,8,8,15),
              child: Container(
                height: 2.0,
                color: Colors.grey,
              ),
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, counter) {
                  return Divider(height: 12.0);
                },
                itemBuilder: (context, counter) {
                  return ListTileView(
                    onTap: () {
                      setState(() {
                        currentSelectedIndex = counter;
                        changeScreen(counter);
                      });
                    },
                    isSelected: currentSelectedIndex == counter,
                    title: navigationItems[counter].title,
                    icon: navigationItems[counter].icon,
                    animationController: _animationController,
                  );
                },
                itemCount: navigationItems.length,
              ),
            ),
            // InkWell(
            //   onTap: () {
            //     setState(() {
            //       isCollapsed = !isCollapsed;
            //       isCollapsed
            //           ? _animationController.forward()
            //           : _animationController.reverse();
            //     });
            //   },
            //   child: AnimatedIcon(
            //     icon: AnimatedIcons.close_menu,
            //     progress: _animationController,
            //     color: selectedColor,
            //     size: 50.0,
            //   ),
            // ),
            SizedBox(
              height: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
