import 'package:falcon_vision/models/users.dart';
import 'package:flutter/material.dart';

class UserItems extends StatefulWidget {
  final Function changeUserData;
  final String text;
  final IconData iconData;
  final bool isSelected;
  final bool isFirstItem;
  final bool isLastItem;
  final num userNumber;
  final Function changeDrop;

  const UserItems(
      {Key key,
      @required this.changeUserData,
      this.changeDrop,
      this.text,
      this.iconData,
      this.isSelected = false,
      this.isFirstItem = false,
      this.isLastItem = false,
      @required this.userNumber})
      : super(key: key);

  @override
  _UserItemsState createState() => _UserItemsState();
}

class _UserItemsState extends State<UserItems> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.changeDrop();
          widget.changeUserData(widget.userNumber);
          // print('changeDrop');
        });
      },
      child: Container(
        // color: Colors.transparent,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: widget.isFirstItem ? Radius.circular(8) : Radius.zero,
            bottom: widget.isLastItem ? Radius.circular(8) : Radius.zero,
          ),
          color: widget.isSelected ? Color(0xFF206398) : Color(0xFF173F5F),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: <Widget>[
            // Icon(
            //   widget.iconData,
            //   color: Colors.white,
            // ),
            ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: userList[widget.userNumber].image,
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  widget.text.toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                // Spacer(),
                SizedBox(height: 4,),
                Text(
                  userList[widget.userNumber].email.toLowerCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            // Spacer(),
          ],
        ),
      ),
    );
  }
}
