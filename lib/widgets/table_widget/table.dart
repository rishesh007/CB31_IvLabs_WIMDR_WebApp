import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:falcon_vision/models/gate.dart';
import 'package:falcon_vision/widgets/table_widget/table_model.dart';

class TableData extends StatefulWidget {
  final double width;
  final Function funcFilter;
  final Function getVehicleData;
  TableData({
    Key key,
    this.width,
    this.funcFilter,
    this.getVehicleData,
  }) : super(key: key);
  @override
  _TableDataState createState() => _TableDataState();
}

class _TableDataState extends State<TableData> {
  var dts = DTS();
  bool _sortTimeAsc = true;
  bool _sortNumberPlateAsc = true;
  bool _sortAuthAsc = true;
  bool _sortVehicleType = true;
  bool _sortNoOfVisits = true;
  bool _sortAsc = true;
  int _sortColumnIndex = 1;
  OverlayEntry _overlayEntry;
  @override
  void initState() {
    super.initState();
  }

  Future<void> getIndex(int index) async {

    OverlayState _overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: (MediaQuery.of(context).size.width / 2) - 200,
        width: 400,
        top: MediaQuery.of(context).size.height / 3,
        height: 300,
        child: Card(
          child: Container(
            padding: EdgeInsets.all(20),
            color: Colors.blue[100],
            child: Image.network(
              vehicleData[index].url,
              width: 400,
              height: 400,
            ),
          ),
        ),
      ),
    );
    print(vehicleData[index].url);
    _overlayState.insert(_overlayEntry);
    await Future.delayed(Duration(seconds: 5));
    _overlayEntry.remove();
  }

  List<String> vehicleType = ['Car', 'Motorbike', 'Truck', 'Others'];
  List<String> vehicleAuth = ['Authorised', 'Non Authorised'];
  List<bool> checkVehicleType = [false, false, false, false];
  List<String> countList = [
    '12:00 AM - 01:00 AM',
    '01:00 AM - 02:00 AM',
    '02:00 AM - 03:00 AM',
    '03:00 AM - 04:00 AM',
    '04:00 AM - 05:00 AM',
    '05:00 AM - 06:00 AM',
    '06:00 AM - 07:00 AM',
    '07:00 AM - 08:00 AM',
    '08:00 AM - 09:00 AM',
    '09:00 AM - 10:00 AM',
    '10:00 AM - 11:00 AM',
    '11:00 AM - 12:00 PM',
    '12:00 PM - 01:00 PM',
    '01:00 PM - 02:00 PM',
    '02:00 PM - 03:00 PM',
    '03:00 PM - 04:00 PM',
    '04:00 PM - 05:00 PM',
    '05:00 PM - 06:00 PM',
    '06:00 PM - 07:00 PM',
    '07:00 PM - 08:00 PM',
    '08:00 PM - 09:00 PM',
    '09:00 PM - 10:00 PM',
    '10:00 PM - 11:00 PM',
    '11:00 PM - 12:00 AM',
    'Car',
    'Motorbike',
    'Truck',
    'Authorised',
    'Non Authorised',
  ];
  List<String> selectedCountList = [];

  Future<void> _openFilterList() async {
    var list = await FilterList.showFilterList(
      context,
      allTextList: countList,
      width: 800,
      height: 480,
      borderRadius: 20,
      headlineText: "Select Count",
      searchFieldHintText: "Search Here",
      selectedTextList: selectedCountList,
      hideSearchField: true,
    );

    if (list != null) {
      setState(() {
        if (list.length == 0) {
          widget.getVehicleData();
          selectedCountList = [];
        } else {
          selectedCountList = List.from(list);
          widget.funcFilter(selectedCountList, countList);
        }
      });
    }
  }

  Widget filterGenerator() {
    return selectedCountList == null || selectedCountList.length == 0
        ? Center(
            child: Text('No text selected'),
          )
        : ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  selectedCountList[index],
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: selectedCountList.length,
          );
  }

  @override
  Widget build(BuildContext context) {
    dts = DTS(getIndex: getIndex);
    return Container(
      padding: EdgeInsets.fromLTRB(250, 0, 250, 0),
      child: PaginatedDataTable(
        rowsPerPage: 5,
        header: Container(
          height: 50,
          // color: Colors.grey[300],
          child: InkWell(
            onTap: () async {
              // for (int i = 0; i < vehicleData.length; i++) {
              //   print(vehicleData[i].auth);
              // }
              await _openFilterList();

              // print('do');
              // for (int i = 0; i < vehicleData.length; i++) {
              //   print(vehicleData[i].auth);
              // }
            },
            child: Row(
              children: <Widget>[
                Icon(Icons.filter_list),
                SizedBox(
                  width: 50,
                ),
                Text('Filter')
              ],
            ),
          ),
        ),
        columns: [
          DataColumn(
            label: Container(
              width: 150,
              child: Center(
                child: Text(
                  'Vehicle Number',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
              ),
            ),
            onSort: (columnIndex, sortAscending) {
              setState(() {
                if (columnIndex == _sortColumnIndex) {
                  _sortAsc = _sortNumberPlateAsc = sortAscending;
                } else {
                  _sortColumnIndex = columnIndex;
                  _sortAsc = _sortNumberPlateAsc;
                }
                vehicleData
                    .sort((a, b) => a.numberPlate.compareTo(b.numberPlate));
                if (!_sortAsc) {
                  vehicleData = vehicleData.reversed.toList();
                }
                dts = DTS(getIndex: getIndex);
              });
            },
          ),
          DataColumn(
            label: Container(
              width: 150,
              child: Center(
                child: Text(
                  'Time',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
              ),
            ),
            onSort: (columnIndex, sortAscending) {
              setState(() {
                if (columnIndex == _sortColumnIndex) {
                  _sortAsc = _sortTimeAsc = sortAscending;
                } else {
                  _sortColumnIndex = columnIndex;
                  _sortAsc = _sortTimeAsc;
                }
                vehicleData.sort((a, b) => a.time.compareTo(b.time));
                if (!_sortAsc) {
                  vehicleData = vehicleData.reversed.toList();
                }
                dts = DTS(getIndex: getIndex);
              });
              // for (int i = 0; i < vehicleData.length; i++) {
              //   print(vehicleData[i].time);
              // }
            },
          ),
          DataColumn(
            label: Container(
              width: 150,
              child: Center(
                child: Text(
                  'Authenticate',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
              ),
            ),
            onSort: (columnIndex, sortAscending) {
              setState(() {
                if (columnIndex == _sortColumnIndex) {
                  _sortAsc = _sortAuthAsc = sortAscending;
                } else {
                  _sortColumnIndex = columnIndex;
                  _sortAsc = _sortAuthAsc;
                }
                vehicleData.sort((a, b) => a.auth.compareTo(b.auth));
                if (!_sortAsc) {
                  vehicleData = vehicleData.reversed.toList();
                }
                dts = DTS(getIndex: getIndex);
              });
            },
          ),
          DataColumn(
            label: Container(
              width: 150,
              child: Center(
                child: Text(
                  'Vehicle Type',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
              ),
            ),
            onSort: (columnIndex, sortAscending) {
              setState(() {
                if (columnIndex == _sortColumnIndex) {
                  _sortAsc = _sortVehicleType = sortAscending;
                } else {
                  _sortColumnIndex = columnIndex;
                  _sortAsc = _sortVehicleType;
                }
                vehicleData
                    .sort((a, b) => a.vehicleType.compareTo(b.vehicleType));
                if (!_sortAsc) {
                  vehicleData = vehicleData.reversed.toList();
                }
                dts = DTS(getIndex: getIndex);
              });
            },
          ),
          DataColumn(
            label: Container(
              width: 150,
              child: Center(
                child: Text(
                  'Visits',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
              ),
            ),
            onSort: (columnIndex, sortAscending) {
              print(sortAscending.toString());
              setState(() {
                if (columnIndex == _sortColumnIndex) {
                  _sortAsc = _sortNoOfVisits = sortAscending;
                } else {
                  _sortColumnIndex = columnIndex;
                  _sortAsc = _sortNoOfVisits;
                }
                vehicleData
                    .sort((a, b) => a.noOfVisits.compareTo(b.noOfVisits));
                if (!_sortAsc) {
                  vehicleData = vehicleData.reversed.toList();
                }
                dts = DTS(getIndex: getIndex);
              });
            },
          ),
        ],
        sortColumnIndex: _sortColumnIndex,
        sortAscending: _sortAsc,
        source: dts,
        horizontalMargin: 18,
        // columnSpacing: 150,
      ),
    );
  }
}

class DTS extends DataTableSource {
  Function getIndex;
  DTS({this.getIndex});

  @override
  DataRow getRow(int index) {
    return DataRow.byIndex(cells: [
      DataCell(
        Container(
          width: 150,
          child: Center(
            child: GestureDetector(
              onTap: () {
                getIndex(index);
              },
              child: Text(
                vehicleData[index].numberPlate,
                style: TextStyle(
                    color: vehicleData[index].auth == 'FALSE'
                        ? Colors.red[900]
                        : Colors.blue[900],
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
      ),
      DataCell(
        Container(
          width: 150,
          child: Center(
            child: GestureDetector(
              child: Text(
                vehicleData[index].time.substring(0, 5),
                style: TextStyle(
                  color: vehicleData[index].auth == 'FALSE'
                      ? Colors.red[900]
                      : Colors.blue[900],
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              onTap: () async {
                getIndex(index);
              },
            ),
          ),
        ),
      ),
      DataCell(
        Container(
          width: 150,
          child: Center(
            child: GestureDetector(
              onTap: () {
                getIndex(index);
              },
              child: Text(
                vehicleData[index].auth,
                style: TextStyle(
                    color: vehicleData[index].auth == 'FALSE'
                        ? Colors.red[900]
                        : Colors.blue[900],
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
      ),
      DataCell(
        Container(
          width: 150,
          child: Center(
            child: GestureDetector(
              onTap: () {
                getIndex(index);
              },
              child: Text(
                vehicleData[index].vehicleType,
                style: TextStyle(
                    color: vehicleData[index].auth == 'FALSE'
                        ? Colors.red[900]
                        : Colors.blue[900],
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
      ),
      DataCell(
        Container(
          width: 150,
          child: Center(
            child: GestureDetector(
              onTap: () {
                getIndex(index);
              },
              child: Text(
                '${vehicleData[index].noOfVisits}',
                style: TextStyle(
                    color: vehicleData[index].auth == 'FALSE'
                        ? Colors.red[900]
                        : Colors.blue[900],
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
      ),
    ], index: index);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => vehicleData.length;

  @override
  int get selectedRowCount => 0;
}
