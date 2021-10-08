import 'package:flutter/material.dart';

class Cat1 extends StatefulWidget {
  // Cart({Key key}) : super(key: key);
  @override
  _Cat1State createState() => _Cat1State();
}

class _Cat1State extends State<Cat1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("cart"),
      ),
      body: Container(color: Colors.grey, height: 75.0),
    );
  }
}
