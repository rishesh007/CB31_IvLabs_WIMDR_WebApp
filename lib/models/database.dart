import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:falcon_vision/models/gate.dart';
import 'package:falcon_vision/models/overview.dart';
import 'package:falcon_vision/models/users.dart';

List<String> authIds = [];
List<User> allUser = [];
String mainEmail;
String mainPassword;
String mainAuthId;
void getAuthenticationId() async {
  List<DocumentSnapshot> templist;
  List<Map<dynamic, dynamic>> list = new List();
  CollectionReference collectionRef = Firestore.instance.collection("auth_id");
  QuerySnapshot collectionSnapshot = await collectionRef.getDocuments();

  templist = collectionSnapshot.documents; // <--- ERROR

  list = templist.map((DocumentSnapshot docSnapshot) {
    return docSnapshot.data;
  }).toList();

  for (int i = 0; i < list.length; i++) {
    authIds.add(list[i]['id']);
  }
}

Future<void> getUsers() async {
  List<DocumentSnapshot> templist;
  List<Map<dynamic, dynamic>> list = new List();
  CollectionReference collectionRef = Firestore.instance.collection("user");
  QuerySnapshot collectionSnapshot = await collectionRef.getDocuments();
  templist = collectionSnapshot.documents;

  list = templist.map((DocumentSnapshot docSnapshot) {
    return docSnapshot.data;
  }).toList();
  // print(list);
  for (int i = 0; i < list.length; i++) {
    User _u = User.fromMap(list[i]);
    allUser.add(_u);
  }
  // // print(userList.length);
}

bool checkUserInDataBase(String email, String password) {
  for (int i = 0; i < allUser.length; i++) {
    if (allUser[i].email == email && allUser[i].password == password) {
      return true;
    }
  }
  return false;
}

// Future<String> getUser() async {
//   List<DocumentSnapshot> templist;
//   List<Map<dynamic, dynamic>> list = new List();
//   CollectionReference collectionRef = Firestore.instance.collection("user");
//   QuerySnapshot collectionSnapshot = await collectionRef.getDocuments();
//   templist = collectionSnapshot.documents;

//   list = templist.map((DocumentSnapshot docSnapshot) {
//     return docSnapshot.data;
//   }).toList();
//   for (int i = 0; i < list.length; i++) {
//     if (list[i]['email'] == mainEmail) {
//       mainAuthId = list[i]['id'];
//       break;
//     }
//   }
//   for (int i = 0; i < list.length; i++) {
//     if (list[i]['id'] == mainAuthId) {
//       User _u = User.fromMap(list[i]);
//       userList.add(_u);
//     }
//   }
//   return mainAuthId;
//   // print(mainAuthId);

//   // getAllData();
//   // // print(userList.length);
// }

// Future<void> getAllData() async {
//   List<DocumentSnapshot> templist;
//   List<Map<dynamic, dynamic>> list = new List();
//   CollectionReference collectionReference =
//       Firestore.instance.collection(mainAuthId);
//   QuerySnapshot collectionSnapshot = await collectionReference.getDocuments();
//   templist = collectionSnapshot.documents;
//   list = templist.map((DocumentSnapshot docSnapshot) {
//     return docSnapshot.data;
//   }).toList();
//   List<String> _list = [];
//   for (int i = 0; i < list[0]['gateName'].length; i++) {
//     _list.add(list[0]['gateName'][i].toString());
//   }
//   // print(_list);
//   // getAllGateData(_list);
// }

// Future<void> getAllGateData(List<String> _list) async {
//   for (int i = 0; i < 3; i++) {
//     List<DocumentSnapshot> templist;
//     List<Map<dynamic, dynamic>> list = new List();
//     CollectionReference collectionReference = Firestore.instance
//         .collection(mainAuthId)
//         .document('gates')
//         .collection('gate' + i.toString())
//         .document('data')
//         .collection('data');
//     QuerySnapshot collectionSnapshot = await collectionReference.getDocuments();
//     templist = collectionSnapshot.documents;
//     list = templist.map((DocumentSnapshot docSnapshot) {
//       return docSnapshot.data;
//     }).toList();
//     // for (int i = 0; i < list.length; i++) {
//     //   // print(list);
//     // }
//     // print('here');
//     List<OverviewData> _over = [];
//     for (int j = 1; j <= list.length; j++) {
//       OverviewData _o = OverviewData(
//           entry: list[j % 3]['entry'],
//           exit: list[j % 3]['exit'],
//           incEntry: list[j % 3]['incEntry'],
//           incExit: list[j % 3]['incExit'],
//           incTotal: list[j % 3]['incTotal'],
//           total: list[j % 3]['total'],
//           type: (j - 1 + 3) % 3);
//       _over.add(_o);
//     }
//     Gate _g = Gate(
//       gateNumber: i,
//       isSelected: (i == 0) ? true : false,
//       name: _list[i],
//       overviewData: _over,
//     );
//     gateItems.add(_g);
//   }
//   // print(gateItems.length);
// }
