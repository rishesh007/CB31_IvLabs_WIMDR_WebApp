class VehicleData {
  String time;
  String numberPlate;
  num auth;
  String vehicleType;
  num noOfVisits;
  String url;
  VehicleData({
    this.time,
    this.numberPlate,
    this.auth,
    this.vehicleType,
    this.url,
    this.noOfVisits,
  });

  Map<String, dynamic> toMap() {
    return {
      'time': time,
      'numberPlate': numberPlate,
      'auth': auth,
      'url' : url,
      'vehicleType': vehicleType,
      'noOfVisits': noOfVisits,
    };
  }

  static VehicleData fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return VehicleData(
      time: map['time'],
      numberPlate: map['numberPlate'],
      auth: map['auth'],
      url: map['url'],
      vehicleType: map['vehicleType'],
      noOfVisits: map['noOfVisits'],
    );
  }
}

List<VehicleData> entryData = [];
List<VehicleData> exitData = [];
List<VehicleData> vehicleData = [
  // VehicleData(
  //   time: '16:00',
  //   numberPlate: 'MH02GF1834',
  //   auth: 'Yes',
  //   vehicleType: 'Car',
  //   noOfVisits: 3,
  // ),
  // VehicleData(
  //   time: '13:00',
  //   numberPlate: 'MH02MF1834',
  //   auth: 'Yes',
  //   vehicleType: 'Car',
  //   noOfVisits: 13,
  // ),
  // VehicleData(
  //   time: '08:00',
  //   numberPlate: 'MH02MR1834',
  //   auth: 'No',
  //   vehicleType: 'Car',
  //   noOfVisits: 31,
  // ),
  // VehicleData(
  //   time: '01:00',
  //   numberPlate: 'MH02TY1834',
  //   auth: 'Yes',
  //   vehicleType: 'Car',
  //   noOfVisits: 45,
  // ),
  // VehicleData(
  //   time: '05:00',
  //   numberPlate: 'MH02MP1834',
  //   auth: 'Yes',
  //   vehicleType: 'Car',
  //   noOfVisits: 23,
  // ),
  // VehicleData(
  //   time: '16:00',
  //   numberPlate: 'MH02GF1834',
  //   auth: 'Yes',
  //   vehicleType: 'Car',
  //   noOfVisits: 3,
  // ),
  // VehicleData(
  //   time: '13:00',
  //   numberPlate: 'MH02MF1834',
  //   auth: 'Yes',
  //   vehicleType: 'Car',
  //   noOfVisits: 13,
  // ),
  // VehicleData(
  //   time: '08:00',
  //   numberPlate: 'MH02MR1834',
  //   auth: 'No',
  //   vehicleType: 'Car',
  //   noOfVisits: 31,
  // ),
  // VehicleData(
  //   time: '01:00',
  //   numberPlate: 'MH02TY1834',
  //   auth: 'Yes',
  //   vehicleType: 'Car',
  //   noOfVisits: 45,
  // ),
  // VehicleData(
  //   time: '05:00',
  //   numberPlate: 'MH02MP1834',
  //   auth: 'Yes',
  //   vehicleType: 'Car',
  //   noOfVisits: 23,
  // ),
  // VehicleData(
  //   time: '16:00',
  //   numberPlate: 'MH02GF1834',
  //   auth: 'Yes',
  //   vehicleType: 'Car',
  //   noOfVisits: 3,
  // ),
  // VehicleData(
  //   time: '13:00',
  //   numberPlate: 'MH02MF1834',
  //   auth: 'Yes',
  //   vehicleType: 'Car',
  //   noOfVisits: 13,
  // ),
  // VehicleData(
  //   time: '08:00',
  //   numberPlate: 'MH02MR1834',
  //   auth: 'No',
  //   vehicleType: 'Car',
  //   noOfVisits: 31,
  // ),
  // VehicleData(
  //   time: '01:00',
  //   numberPlate: 'MH02TY1834',
  //   auth: 'Yes',
  //   vehicleType: 'Car',
  //   noOfVisits: 45,
  // ),
  // VehicleData(
  //   time: '05:00',
  //   numberPlate: 'MH02MP1834',
  //   auth: 'Yes',
  //   vehicleType: 'Car',
  //   noOfVisits: 23,
  // ),
];
