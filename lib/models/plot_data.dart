import 'package:flutter/widgets.dart';

class Weekly {
  String day;
  num data;

  Weekly({@required this.data, @required this.day});
}

class Monthly {
  String month;
  num data;

  Monthly({@required this.month, @required this.data});
}

List<Weekly> weeklyData = [];

List<Monthly> monthlyData = [];
