import 'package:flutter/material.dart';
import 'package:shopio/Profile_PAGES/CardDetails.dart';

class Payment extends StatefulWidget {
  // Cart({Key key}) : super(key: key);
  @override
  _PaymentState createState() => _PaymentState();
}

enum SingingCharacter { cash, card }
SingingCharacter _character = SingingCharacter.cash;

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preferred Payment Method"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          RadioListTile<SingingCharacter>(
            title: const Text('Cash'),
            value: SingingCharacter.cash,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
              });
            },
          ),
          RadioListTile<SingingCharacter>(
            title: const Text('Card'),
            value: SingingCharacter.card,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
              });
            },
          ),
          Row(children: <Widget>[
            new FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CardDetails()));
              },
              child: new Text("Add Card Details"),
            )
          ])
        ],
      ),
    );
  }
}
