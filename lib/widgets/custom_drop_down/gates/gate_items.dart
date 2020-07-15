import 'package:falcon_vision/models/gate.dart';
import 'package:flutter/material.dart';

class GateDropDownItem extends StatefulWidget {
  final Function changeDropDownValue;
  final String text;
  final IconData iconData;
  final bool isSelected;
  final bool isFirstItem;
  final bool isLastItem;
  final num gateNumber;
  final Function changeDrop;
  const GateDropDownItem(
      {Key key,
      @required this.changeDropDownValue,
      this.changeDrop,
      this.text,
      this.iconData,
      this.isSelected = false,
      this.isFirstItem = false,
      this.isLastItem = false,
      @required this.gateNumber})
      : super(key: key);

  @override
  _GateDropDownItemState createState() => _GateDropDownItemState();
}

class _GateDropDownItemState extends State<GateDropDownItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          gateNumber = widget.gateNumber;
          for (int i = 0; i < gateItems.length; i++) {
            gateItems[i].isSelected = false;
          }
          gateItems[gateNumber].isSelected = true;
          dropdownValue = gateItems[gateNumber].name;
          widget.changeDrop();
          widget.changeDropDownValue(widget.gateNumber);
          print('changeDrop');
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
            Text(
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
