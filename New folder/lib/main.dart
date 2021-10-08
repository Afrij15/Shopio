import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopio/SellerPages/Addproducts.dart';
import 'package:shopio/SellerPages/Sellerhome.dart';
import 'package:shopio/SignUpNew/signup.dart';
import 'package:shopio/WelcomeScreen.dart';
import 'package:shopio/pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter',
      theme: ThemeData(
        primaryColor: Colors.lightGreenAccent[500],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Addproducts(),
    );
  }
}
