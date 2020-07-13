import 'package:falcon_vision/screens/main_screen/dashborad/views/entryExitView.dart';
import 'package:falcon_vision/screens/main_screen/dashborad/views/overViewCard.dart';
import 'package:falcon_vision/widgets/line_chart/plot.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  final double width;
  DashboardView({@required this.width});
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {

  @override
  Widget build(BuildContext context) {
    const double pad = 0.0;
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(pad),
          child: Container(
            width: widget.width - 2*pad,
            child: Row(
              children: <Widget>[
                Expanded(flex: 2, child: OverViewCard()),
                Expanded(
                flex: 1,
                child: Container(
                  color: Colors.transparent,
                  height: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: LineChartSample1(),
                  ),
                ),
              ),
              ],
            ),
          ),
        ),
        EntryExitView(width: widget.width,),
      ],
    );
  }
}
