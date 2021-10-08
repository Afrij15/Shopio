import 'package:flutter/material.dart';

class Promotions extends StatefulWidget {
  // Cart({Key key}) : super(key: key);
  @override
  _PromotionsState createState() => _PromotionsState();
}

class _PromotionsState extends State<Promotions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Promotions"),
      ),
      body: SafeArea(
        child: Center(
          child: Text(
            "Promotions are yet to come",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
