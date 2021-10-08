import 'package:flutter/material.dart';

import 'package:shopio/Profile_PAGES/Promotions.dart';
import 'package:shopio/Profile_PAGES/favorites.dart';
import 'package:shopio/Profile_PAGES/help.dart';
import 'package:shopio/Profile_PAGES/orders.dart';
import 'package:shopio/Profile_PAGES/payment.dart';
import 'package:shopio/Services/Auth.dart';
import 'package:shopio/SignUpNew/signup.dart';
import 'package:shopio/pages/Settings.dart';
import 'package:shopio/pages/cart.dart';

void selectFavorites(BuildContext ctx) {
  Navigator.of(ctx).push(
    MaterialPageRoute(
      builder: (_) {
        return Favorites();
      },
    ),
  );
}

void selectCart(BuildContext ctx) {
  Navigator.of(ctx).push(
    MaterialPageRoute(
      builder: (_) {
        return Cart();
      },
    ),
  );
}

void selectOrders(BuildContext ctx) {
  Navigator.of(ctx).push(
    MaterialPageRoute(
      builder: (_) {
        return Orders();
      },
    ),
  );
}

void selectPromotions(BuildContext ctx) {
  Navigator.of(ctx).push(
    MaterialPageRoute(
      builder: (_) {
        return Promotions();
      },
    ),
  );
}

void selectPayment(BuildContext ctx) {
  Navigator.of(ctx).push(
    MaterialPageRoute(
      builder: (_) {
        return Payment();
      },
    ),
  );
}

void selectHelp(BuildContext ctx) {
  Navigator.of(ctx).push(
    MaterialPageRoute(
      builder: (_) {
        return Help();
      },
    ),
  );
}

class Profile extends StatefulWidget {
  //Stores({Key key}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  AuthMethods authMethods = new AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Profile"),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.settings),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Settings()),
                );
              })
        ],
      ),
      body:
          //Container(),

          Column(
        children: <Widget>[
          Container(
            //color: Colors.amber[800],
            height: 120.0,
            child: UserAccountsDrawerHeader(
              accountName: Text(
                "Afrij",
                style: TextStyle(color: Colors.amber[800], fontSize: 16),
              ),
              accountEmail: Text(
                "abdullahafrijs3@gmail.com",
                style: TextStyle(color: Colors.amber[700], fontSize: 14),
              ),
              /*currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.amber[800],
                radius: 10,
              ),*/
            ),
          ),
          Divider(),
          ListTile(
            title: Text("Favorites"),
            leading: Icon(Icons.favorite),
            onTap: () => selectFavorites(context),
          ),
          ListTile(
            title: Text("Cart"),
            leading: Icon(Icons.shopping_cart),
            onTap: () => selectCart(context),
          ),
          ListTile(
            title: Text("Orders"),
            leading: Icon(Icons.shop),
            onTap: () => selectOrders(context),
          ),
          ListTile(
            title: Text("Promotions"),
            leading: Icon(Icons.local_offer),
            onTap: () => selectPromotions(context),
          ),
          ListTile(
            title: Text("Payment"),
            leading: Icon(Icons.payment),
            onTap: () => selectPayment(context),
          ),
          ListTile(
            title: Text("Help"),
            leading: Icon(Icons.help),
            onTap: () => selectHelp(context),
          ),
          ListTile(
            title: Text(
              "Signout",
              style: TextStyle(color: Colors.red, fontSize: 22),
            ),
            leading: Icon(Icons.mobile_screen_share),
            onTap: () {
              authMethods.signOut();
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Signup()));
            },
          ),
        ],
      ),
    );
  }
}
