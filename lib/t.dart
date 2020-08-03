import 'package:firebase_storage/firebase_storage.dart' as fs;
import 'package:flutter/material.dart';

class TryIt extends StatefulWidget {
  @override
  _TryItState createState() => _TryItState();
}

class _TryItState extends State<TryIt> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: RaisedButton(
        onPressed: () {
          fs.StorageReference storageReference =
              fs.FirebaseStorage.instance.ref().child('car_pics');
          print(storageReference.getDownloadURL().toString());
        },
        child: Text('Press Me'),
        color: Colors.pink,
      ),
    );
  }
}
