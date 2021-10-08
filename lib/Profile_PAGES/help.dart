import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  // Cart({Key key}) : super(key: key);
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help"),
      ),
      body: Column(children: <Widget>[
        ListTile(
          title: (Text("Contact Hambuna")),
          leading: (Icon(
            Icons.call,
            color: Colors.black,
          )),
          //onTap: ,
        ),
        ListTile(
          title: (Text("View help guide")),
          leading: (Icon(
            Icons.book,
            color: Colors.black,
          )),
          //onTap: ,
        ),
      ]),
    );
  }
}
