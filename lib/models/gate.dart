import 'package:falcon_vision/models/overview.dart';
import 'package:falcon_vision/widgets/table_widget/table_model.dart';
import 'package:flutter/material.dart';

class Gate {
  String name;
  num gateNumber;
  bool isSelected;
  List<OverviewData> overviewData;
  List<VehicleData> vehicleEntryData;
  List<VehicleData> vehicleExitData;
  Gate({
    @required this.gateNumber,
    @required this.name,
    @required this.isSelected,
    @required this.overviewData,
    this.vehicleEntryData,
    this.vehicleExitData,
  });
}

List<Gate> gateItems = [];
String dropdownValue = gateItems[0].name;
num gateNumber = 0;

void changeGate(int number) {
  gateNumber = number;
  for (int i = 0; i < gateItems.length; i++) {
    gateItems[i].isSelected = false;
  }
  gateItems[number].isSelected = true;
  dropdownValue = gateItems[number].name;
}
