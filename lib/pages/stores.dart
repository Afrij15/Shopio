import 'package:flutter/material.dart';

class Stores extends StatefulWidget {
  //Stores({Key key}) : super(key: key);
  @override
  _StoresState createState() => _StoresState();
}

class _StoresState extends State<Stores> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, title: Text("Stores")),
    );
  }
}
