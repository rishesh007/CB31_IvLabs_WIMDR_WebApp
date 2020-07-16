import 'package:falcon_vision/widgets/custom_drop_down/users/user_items.dart';
import 'package:flutter/material.dart';
import '../../../models/users.dart';

class UserDropDown extends StatefulWidget {
  final num currentUser;
  final Function changeUserData;
  UserDropDown({@required this.currentUser, this.changeUserData});
  @override
  _UserDropDownState createState() => _UserDropDownState();
}

class _UserDropDownState extends State<UserDropDown> {
  GlobalKey actionKey;
  double height, width, xPosition, yPosition;
  bool isDropdownOpened = false;
  OverlayEntry floatingDropdown;

  @override
  void initState() {
    actionKey = LabeledGlobalKey('${widget.currentUser}');
    super.initState();
  }

  void findDropdownData() {
    RenderBox renderBox = actionKey.currentContext.findRenderObject();
    height = renderBox.size.height;
    width = renderBox.size.width;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    xPosition = offset.dx;
    yPosition = offset.dy;
  }

  OverlayEntry _createFloatingDropdown() {
    return OverlayEntry(builder: (context) {
      return Positioned(
        left: xPosition,
        width: width,
        top: yPosition + height,
        height: 1.55*userList.length * height + 40,
        child: Container(
          color: Colors.transparent,
          child: DropDown(
            changeUserData: widget.changeUserData,
            changeDrop: changeDrop,
            itemHeight: height,
          ),
        ),
      );
    });
  }

  void changeDrop() {
    setState(() {
      if (isDropdownOpened) {
        floatingDropdown.remove();
      } else {
        findDropdownData();
        floatingDropdown = _createFloatingDropdown();
        Overlay.of(context).insert(floatingDropdown);
      }

      isDropdownOpened = !isDropdownOpened;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: actionKey,
      onTap: changeDrop,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color(0xFF173F5F),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: <Widget>[
            Text(
              userList[widget.currentUser].name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600),
            ),
            Spacer(),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class DropDown extends StatefulWidget {
  final double itemHeight;
  final Function changeDrop;
  final Function changeUserData;
  DropDown(
      {Key key,
      this.itemHeight,
      this.changeDrop,
      @required this.changeUserData})
      : super(key: key);

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 2,
        ),
        Material(
          elevation: 20,
          color: Colors.transparent,
          child: Container(
            // color: Colors.transparent,
            height: 1.55*userList.length * widget.itemHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.transparent,
            ),
            child: Column(
              children: <Widget>[
                for (num i = 0; i < userList.length; i++)
                  UserItems(
                    text: userList[i].name,
                    changeUserData: widget.changeUserData,
                    userNumber: i,
                    changeDrop: widget.changeDrop,
                    iconData: Icons.accessibility,
                    isSelected: (i == currentUser) ? true : false,
                    isFirstItem: (i == 0) ? true : false,
                    isLastItem: (i == userList.length - 1) ? true : false,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
