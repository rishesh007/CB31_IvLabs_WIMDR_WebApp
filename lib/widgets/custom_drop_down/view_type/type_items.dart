import 'package:flutter/material.dart';

class TypeItems extends StatefulWidget {
  final Function changeTypeData;
  final String text;
  final IconData iconData;
  final bool isSelected;
  final bool isFirstItem;
  final bool isLastItem;
  final num typeNumber;
  final Function changeDrop;
  const TypeItems(
      {Key key,
      @required this.changeTypeData,
      @required this.changeDrop,
      @required this.text,
      @required this.iconData,
      @required this.isSelected,
      @required this.isFirstItem,
      @required this.isLastItem,
      @required @required this.typeNumber})
      : super(key: key);

  @override
  _TypeItemsState createState() => _TypeItemsState();
}

class _TypeItemsState extends State<TypeItems> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.changeDrop();
          widget.changeTypeData(widget.typeNumber);
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
            SelectableText(
              widget.text.toUpperCase(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600),
            ),
            Spacer(),
            Icon(
              widget.iconData,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
