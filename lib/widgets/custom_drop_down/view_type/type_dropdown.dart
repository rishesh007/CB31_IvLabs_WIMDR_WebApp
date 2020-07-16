import 'package:falcon_vision/models/overview.dart';
import 'package:falcon_vision/widgets/custom_drop_down/view_type/type_items.dart';
import 'package:flutter/material.dart';

class TypeDropDown extends StatefulWidget {
  final num currentType;
  final Function changeTypeData;

  const TypeDropDown(
      {Key key, @required this.currentType, @required this.changeTypeData})
      : super(key: key);
  @override
  _TypeDropDownState createState() => _TypeDropDownState();
}

class _TypeDropDownState extends State<TypeDropDown> {
  GlobalKey actionKey;
  double height, width, xPosition, yPosition;
  bool isDropdownOpened = false;
  OverlayEntry floatingDropdown;

  @override
  void initState() {
    actionKey = LabeledGlobalKey(widget.currentType.toString());
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
            changeTypeData: widget.changeTypeData,
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
            SelectableText(
              viewType[widget.currentType],
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
  final Function changeTypeData;
  DropDown(
      {Key key,
      @required this.itemHeight,
      @required this.changeDrop,
      @required @required this.changeTypeData})
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
          // shape: ,
          child: Container(
            // color: Colors.transparent,
            height: viewType.length * widget.itemHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.transparent,
            ),
            child: Column(
              children: <Widget>[
                for (num i = 0; i < viewType.length; i++)
                  TypeItems(
                    changeTypeData: widget.changeTypeData,
                    changeDrop: widget.changeDrop,
                    typeNumber: i,
                    iconData: Icons.calendar_view_day,
                    text: viewType[i],
                    isSelected: (i == currentEnabledData) ? true : false,
                    isFirstItem: (i == 0) ? true : false,
                    isLastItem: (i == viewType.length - 1) ? true : false,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
