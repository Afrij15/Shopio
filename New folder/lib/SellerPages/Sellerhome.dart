import 'package:flutter/material.dart';

class SellerHome extends StatefulWidget {
  @override
  _SellerHomeState createState() => _SellerHomeState();
}

class _SellerHomeState extends State<SellerHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hambuna Seller Center")),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            // alignment: Alignment.bottomCenter,
            padding: EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(color: Colors.limeAccent[800]),
            child: Text("Add Products"),
          ),
          Row(
            children: [Icon(Icons.add), Icon(Icons.view_agenda)],
          )
        ],
      ),
    );
  }
}
