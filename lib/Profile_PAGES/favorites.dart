import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  //Stores({Key key}) : super(key: key);
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favorites")),
      body: SafeArea(
        child: Center(
          child: Text(
            "Empty!",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
