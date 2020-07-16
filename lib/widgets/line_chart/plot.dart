import 'package:falcon_vision/models/plot_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PlotView extends StatefulWidget {
  @override
  _PlotViewState createState() => _PlotViewState();
}

class _PlotViewState extends State<PlotView> {
  bool isMonthly;

  @override
  void initState() {
    super.initState();
    isMonthly = true;
  }

  void changePlot() {
    setState(() {
      isMonthly = !isMonthly;
    });
  }

  Widget monthly() {
    return Container(
      height: 220,
      padding: EdgeInsets.all(10.0),
      child: SfCartesianChart(

        primaryXAxis: CategoryAxis(
          title: AxisTitle(
            text: 'Month',
            textStyle: TextStyle(
              fontFamily: 'archiaregular',
              fontSize: 12,
            ),
          ),
          majorGridLines: MajorGridLines(width: 0),
          axisLine: AxisLine(width: 0),
        ),
        primaryYAxis: NumericAxis(
          title: AxisTitle(
            text: 'No of Vehicles',
            textStyle: TextStyle(
              fontFamily: 'archiaregular',
              fontSize: 12,
            ),
          ),
          majorGridLines: MajorGridLines(width: 2),
          axisLine: AxisLine(width: 0,),
        ),
        borderWidth: 0,
        
        series: <ChartSeries>[
          LineSeries<Monthly, String>(
             
            enableTooltip: true,
            markerSettings: MarkerSettings(
                borderColor: Colors.blue, color: Colors.blue, isVisible: true),
            dataSource: monthlyData,
            xValueMapper: (Monthly month, _) => month.month,
            yValueMapper: (Monthly month, _) => month.data,
            dataLabelSettings: DataLabelSettings(isVisible: true),
          ),
        ],
      ),
    );
  }

  Widget weekly() {
    return Container(
      height: 220,
      padding: EdgeInsets.all(10.0),
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(
          title: AxisTitle(
            text: 'Day',
            textStyle: TextStyle(
              fontFamily: 'archiaregular',
              fontSize: 12,
            ),
          ),
          majorGridLines: MajorGridLines(width: 0),
          axisLine: AxisLine(width: 0),
        ),
        primaryYAxis: NumericAxis(
          title: AxisTitle(
            text: 'No of Vehicles',
            textStyle: TextStyle(
              fontFamily: 'archiaregular',
              fontSize: 12,
            ),
          ),
          majorGridLines: MajorGridLines(width: 2),
          axisLine: AxisLine(width: 0),
        ),
        series: <ChartSeries>[
          LineSeries<Weekly, String>(
            enableTooltip: true,
            markerSettings: MarkerSettings(
                borderColor: Colors.blue, color: Colors.blue, isVisible: true),
            dataSource: weeklyData,
            xValueMapper: (Weekly day, _) => day.day,
            yValueMapper: (Weekly day, _) => day.data,
            dataLabelSettings: DataLabelSettings(isVisible: true),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RaisedButton(
                  color: isMonthly ? Colors.blue : Colors.blue.withOpacity(0.3),
                  onPressed: changePlot,
                  child: Text('Monthly'),
                  elevation: (isMonthly ? 5:1),
                ),
                RaisedButton(
                  color: !isMonthly ? Colors.blue : Colors.blue.withOpacity(0.3),
                  onPressed: changePlot,
                  child: Text('Daily'),
                  elevation: (!isMonthly ? 5:1),
                ),
              ],
            ),
          ),
          isMonthly ? monthly() : weekly(),
        ],
      ),
    );
  }
}
