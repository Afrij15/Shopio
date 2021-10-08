import 'package:flutter/material.dart';

class CardDetails extends StatefulWidget {
  //Stores({Key key}) : super(key: key);
  @override
  _CardDetailsState createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Card Details")),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              hintText: "Card Number",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            onChanged: (value) {},
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "Name on Card",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "Date",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            onChanged: (value) {},
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "CVV",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            onChanged: (value) {},
          ),
          RaisedButton(
            onPressed: () {},
            child: Text("Add card"),
          )
          /*Row(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  hintText: "Expire Date",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onChanged: (value) {},
              ),
            ],
          )*/
        ],
      )),
    );
  }
}
