import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:falcon_vision/widgets/table_widget/table_model.dart';
import 'package:flutter/material.dart';

class TryIt extends StatefulWidget {
  @override
  _TryItState createState() => _TryItState();
}

class _TryItState extends State<TryIt> {
  Future<void> k() async {
    List<DocumentSnapshot> templist;
    List<Map<dynamic, dynamic>> list = new List();
    CollectionReference collectionReference =
        Firestore.instance.collection('user');
    QuerySnapshot collectionSnapshot = await collectionReference.getDocuments();
    templist = collectionSnapshot.documents;
    list = templist.map((DocumentSnapshot docSnapshot) {
      print(docSnapshot.documentID);
      return docSnapshot.data;
    }).toList();
    // print(collectionSnapshot.documents);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RaisedButton(
          onPressed: () {
            k();
          },
          child: Text('Fuck You'),
        ),
      ),
    );
  }
}
