import 'package:flutter/material.dart';
import 'package:shopio/SignUpNew/Signin.dart';
import 'package:shopio/SignUpNew/signup.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Welcome to Hambuna"),
              GestureDetector(
                onTap: () => signUp(context),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                      child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.black),
                  )),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.amberAccent[700]),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () => signIn(context),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                      child: Text(
                    "Sign In",
                    style: TextStyle(color: Colors.black),
                  )),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.amberAccent[700]),
                ),
              ),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}

void signUp(BuildContext ctx) {
  Navigator.of(ctx).push(
    MaterialPageRoute(
      builder: (_) {
        return Signup();
      },
    ),
  );
}

void signIn(BuildContext ctx) {
  Navigator.of(ctx).push(
    MaterialPageRoute(
      builder: (_) {
        return SignIn();
      },
    ),
  );
}
