import 'package:flutter/material.dart';
import 'gate_items.dart';
import '../../../models/gate.dart';

class GateDropDown extends StatefulWidget {
  final String text;
  final Function changeDropDownValue;

  const GateDropDown(
      {Key key, @required this.text, @required this.changeDropDownValue})
      : super(key: key);
  @override
  _GateDropDownState createState() => _GateDropDownState();
}

class _GateDropDownState extends State<GateDropDown> {
  GlobalKey actionKey;
  double height, width, xPosition, yPosition;
  bool isDropdownOpened = false;
  OverlayEntry floatingDropdown;

  @override
  void initState() {
    actionKey = LabeledGlobalKey(widget.text);
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
        height: 4 * height + 40,
        child: Container(
          color: Colors.transparent,
          child: DropDown(
            changeDropDownValue: widget.changeDropDownValue,
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
              widget.text.toUpperCase(),
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
  final Function changeDropDownValue;
  DropDown({Key key, this.itemHeight, this.changeDrop, @required this.changeDropDownValue}) : super(key: key);

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
          // shape: ,
          child: Container(
            // color: Colors.transparent,
            height: gateItems.length * widget.itemHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.transparent,
            ),
            child: Column(
              children: <Widget>[
                for (num i = 0; i < gateItems.length; i++)
                  GateDropDownItem(
                    changeDropDownValue: widget.changeDropDownValue,
                    changeDrop: widget.changeDrop,
                    gateNumber: i,
                    text: gateItems[i].name,
                    iconData: Icons.ac_unit,
                    isSelected: gateItems[i].isSelected,
                    isFirstItem: (i == 0) ? true : false,
                    isLastItem: (i == gateItems.length - 1) ? true : false,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
