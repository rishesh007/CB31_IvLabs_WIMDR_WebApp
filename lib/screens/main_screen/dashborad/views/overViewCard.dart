import 'package:falcon_vision/models/overview.dart';
import 'package:falcon_vision/widgets/custom_drop_down/view_type/type_dropdown.dart';
import 'package:flutter/material.dart';

class OverViewCard extends StatefulWidget {
  @override
  _OverViewCardState createState() => _OverViewCardState();
}

class _OverViewCardState extends State<OverViewCard> {
  String dropdownValue = 'Today';

  void changeTypeData(num val) {
    setState(() {
      currentEnabledData = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 300,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 16),
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      SizedBox(
                        width: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: SelectableText(
                          'Overview',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Container(
                          width: 220,
                          child: TypeDropDown(
                            currentType: currentEnabledData,
                            changeTypeData: changeTypeData,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    // color: Colors.green,
                    // width: 700,
                    height: 150,
                    child: DataWidget(
                      dataSeq: currentEnabledData,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DataWidget extends StatefulWidget {
  final num dataSeq;
  DataWidget({@required this.dataSeq});

  @override
  _DataWidgetState createState() => _DataWidgetState();
}

class _DataWidgetState extends State<DataWidget> {
  Widget dataBox(text, incData, tData) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            SelectableText(
              text,
              style: TextStyle(
                fontSize: 20,
                color: Colors.blueGrey,
              ),
            ),
            SelectableText(
              (incData < 0) ? incData.toString() : '+' + incData.toString(),
              style: TextStyle(
                fontSize: 20,
                color: Colors.red[900],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5.0,
        ),
        SelectableText(
          tData.toString(),
          style: TextStyle(
            fontSize: 35,
            color: Colors.blueGrey[600],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        dataBox(
          'Entry ',
          overviewData[widget.dataSeq].incEntry,
          overviewData[widget.dataSeq].entry,
        ),
        Expanded(child: Container()),
        dataBox(
          'Exit ',
          overviewData[widget.dataSeq].incExit,
          overviewData[widget.dataSeq].exit,
        ),
        Expanded(child: Container()),
        dataBox(
          'Total ',
          overviewData[widget.dataSeq].incTotal,
          overviewData[widget.dataSeq].total,
        ),
      ],
    );
  }
}
