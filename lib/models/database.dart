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
