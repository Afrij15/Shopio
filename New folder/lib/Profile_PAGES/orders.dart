import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  // Cart({Key key}) : super(key: key);
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders"),
      ),
      body: TabBar(
        controller: _tabController,
        tabs: <Widget>[
          Tab(
            text: "Delivered Orders",
          ),
          Tab(
            text: "Pending Orders",
          ),
        ],
      ),
    );
  }
}
