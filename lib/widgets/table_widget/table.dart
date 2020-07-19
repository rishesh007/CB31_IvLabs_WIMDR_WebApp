import 'package:falcon_vision/widgets/table_widget/table_model.dart';
import 'package:flutter/material.dart';

class TableData extends StatefulWidget {
  final double width;
  TableData({@required this.width});
  @override
  _TableDataState createState() => _TableDataState();
}

class _TableDataState extends State<TableData> {
  bool _sortTimeAsc = true;
  bool _sortNumberPlateAsc = true;
  bool _sortAuthAsc = true;
  bool _sortVehicleType = true;
  bool _sortNoOfVisits = true;
  bool _sortAsc = true;
  int _sortColumnIndex;
  List<VehicleData> _vehicleData;

  @override
  void initState() {
    super.initState();
    _vehicleData = [
      VehicleData(
        time: '12:00 AM',
        numberPlate: 'MH02GF2034',
        auth: 'Yes',
        vehicleType: 'Car',
        noOfVisits: 3,
      ),
      VehicleData(
        time: '11:00 AM',
        numberPlate: 'MH02MF2034',
        auth: 'Yes',
        vehicleType: 'Car',
        noOfVisits: 13,
      ),
      VehicleData(
        time: '08:00 AM',
        numberPlate: 'MH02MR2034',
        auth: 'No',
        vehicleType: 'Car',
        noOfVisits: 31,
      ),
      VehicleData(
        time: '12:00 PM',
        numberPlate: 'MH02TY2034',
        auth: 'Yes',
        vehicleType: 'Car',
        noOfVisits: 45,
      ),
      VehicleData(
        time: '05:00 PM',
        numberPlate: 'MH02MP2034',
        auth: 'Yes',
        vehicleType: 'Car',
        noOfVisits: 23,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var myColumns = [
      DataColumn(
        label: Align(
            alignment: Alignment.center,
            child: Text(
              'TIME',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
            )),
        onSort: (columnIndex, sortAscending) {
          setState(() {
            if (columnIndex == _sortColumnIndex) {
              _sortAsc = _sortTimeAsc = sortAscending;
            } else {
              _sortColumnIndex = columnIndex;
              _sortAsc = _sortTimeAsc;
            }
            _vehicleData.sort((a, b) => a.time.compareTo(b.time));
            if (!_sortAsc) {
              _vehicleData = _vehicleData.reversed.toList();
            }
          });
        },
      ),
      DataColumn(
        label: Align(
            alignment: Alignment.center,
            child: Text(
              'Number Plate',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
            )),
        onSort: (columnIndex, sortAscending) {
          setState(() {
            if (columnIndex == _sortColumnIndex) {
              _sortAsc = _sortNumberPlateAsc = sortAscending;
            } else {
              _sortColumnIndex = columnIndex;
              _sortAsc = _sortNumberPlateAsc;
            }
            _vehicleData.sort((a, b) => a.numberPlate.compareTo(b.numberPlate));
            if (!_sortAsc) {
              _vehicleData = _vehicleData.reversed.toList();
            }
          });
        },
      ),
      DataColumn(
        label: Align(
            alignment: Alignment.center,
            child: Text(
              'Allowed',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
            )),
        onSort: (columnIndex, sortAscending) {
          setState(() {
            if (columnIndex == _sortColumnIndex) {
              _sortAsc = _sortAuthAsc = sortAscending;
            } else {
              _sortColumnIndex = columnIndex;
              _sortAsc = _sortAuthAsc;
            }
            _vehicleData.sort((a, b) => a.auth.compareTo(b.auth));
            if (!_sortAsc) {
              _vehicleData = _vehicleData.reversed.toList();
            }
          });
        },
      ),
      DataColumn(
        label: Align(
            alignment: Alignment.center,
            child: Text(
              'Vehicle Type',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
            )),
        onSort: (columnIndex, sortAscending) {
          setState(() {
            if (columnIndex == _sortColumnIndex) {
              _sortAsc = _sortVehicleType = sortAscending;
            } else {
              _sortColumnIndex = columnIndex;
              _sortAsc = _sortVehicleType;
            }
            _vehicleData.sort((a, b) => a.vehicleType.compareTo(b.vehicleType));
            if (!_sortAsc) {
              _vehicleData = _vehicleData.reversed.toList();
            }
          });
        },
      ),
      DataColumn(
        label: Align(
            alignment: Alignment.center,
            child: Text(
              'No Of Visits',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
            )),
        onSort: (columnIndex, sortAscending) {
          setState(() {
            if (columnIndex == _sortColumnIndex) {
              _sortAsc = _sortNoOfVisits = sortAscending;
            } else {
              _sortColumnIndex = columnIndex;
              _sortAsc = _sortNoOfVisits;
            }
            _vehicleData.sort((a, b) => a.noOfVisits.compareTo(b.noOfVisits));
            if (!_sortAsc) {
              _vehicleData = _vehicleData.reversed.toList();
            }
          });
        },
      ),
    ];

    var myRows = _vehicleData.map((data) {
      return DataRow(cells: [
        DataCell(Align(
            alignment: Alignment.center,
            child: Text(
              data.time,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
            ))),
        DataCell(Align(
            alignment: Alignment.center,
            child: Text(
              data.numberPlate,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
            ))),
        DataCell(Align(
            alignment: Alignment.center,
            child: Text(
              data.auth,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
            ))),
        DataCell(Align(
            alignment: Alignment.center,
            child: Text(
              data.vehicleType,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
            ))),
        DataCell(Align(
            alignment: Alignment.center,
            child: Text(
              '${data.noOfVisits}',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
            ))),
      ]);
    }).toList();

    return Center(
      child: SingleChildScrollView(
        child: Container(
          width: widget.width,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
          ),
          child: DataTable(
            horizontalMargin: 13,
            columnSpacing: 100,
            columns: myColumns,
            dataRowHeight: 45,
            dividerThickness: 2.5,
            headingRowHeight: 40,
            rows: myRows,
            sortColumnIndex: _sortColumnIndex,
            sortAscending: _sortAsc,
          ),
        ),
      ),
    );
  }
}
