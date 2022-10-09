import 'package:flutter/material.dart';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:shopio/Chat/ChatRoom.dart';

class Home_page extends StatefulWidget {
  //Home_page({Key key}) : super(key: key);
  @override
  _Home_pageState createState() => _Home_pageState();
}

void chats(BuildContext ctx) {
  Navigator.of(ctx).push(
    MaterialPageRoute(
      builder: (_) {
        return Chatroom();
      },
    ),
  );
}

class _Home_pageState extends State<Home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            "Hambuna",
            style: TextStyle(
                color: Colors.amber[800], fontFamily: 'lobster', fontSize: 30),
          ),
        ),

        //backgroundColor: Colors.amber[800],
      ),
      /*floatingActionButton: FloatingActionButton(
          child: Icon(Icons.search, color: Colors.amber[800]),
          backgroundColor: Colors.white,
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Search()));
          },
        ),*/
      body: Column(
        children: [
          SizedBox(
            height: 200.0,
            width: 375.0,
            child: Carousel(
              images: [
                ExactAssetImage('assets/images/promotional-analysis.jpg'),
                ExactAssetImage("assets/images/promotions-min-copy.jpg")
              ],
              dotSize: 4.0,
              dotSpacing: 15.0,
              dotColor: Colors.white,
              indicatorBgPadding: 5.0,
              dotBgColor: Colors.amber[800].withOpacity(0.5),
              borderRadius: true,
              autoplayDuration: Duration(milliseconds: 500),
            ),
          ),
          Row(
            children: [
              Text(
                '  Recently Added Stores',
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.black,
                    fontFamily: 'BreeSerif'),
              )
            ],
          )
        ],
      ),
      endDrawer: Drawer(
        elevation: 20.0,
        child: Column(
          children: <Widget>[
            Spacer(),
            ListTile(
              title: (Text("Chats")),
              onTap: () => chats(context),
              leading: (Icon(
                Icons.chat,
              )),
              //onTap: ,
            ),
            Divider(
              height: 2,
            ),
            ListTile(
              title: Text("Notifications"),
              leading: Icon(
                Icons.notifications,
              ),
            ),
            Divider(),
            Spacer(),
            ListTile(
              title: Text("Settings"),
              leading: Icon(
                Icons.settings,
              ),
            ),
            Spacer(),
            ListTile(
              title: Text("Help"),
              leading: Icon(
                Icons.help,
              ),
            ),
            Divider(
              height: 1,
            ),
            ListTile(
              title: Text(
                "Hambuna",
                style: TextStyle(
                  color: Colors.amber[800],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//@override
//bool get wantKeepAlive => true;
