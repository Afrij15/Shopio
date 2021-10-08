import 'package:flutter/material.dart';
import 'package:shopio/Services/Auth.dart';
import 'package:shopio/Services/Database.dart';
import 'package:shopio/SignUpNew/Sellersignup.dart';
import 'package:shopio/SignUpNew/Signin.dart';
import 'package:shopio/pages/home.dart';

void signIn(BuildContext ctx) {
  Navigator.of(ctx).push(
    MaterialPageRoute(
      builder: (_) {
        return SignIn();
      },
    ),
  );
}

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isLoading = false;

  AuthMethods authMethods = new AuthMethods();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  final formKey = GlobalKey<FormState>();

  TextEditingController nameTextEditingController = new TextEditingController();
  TextEditingController emailTextEditingController =
      new TextEditingController();
  TextEditingController passwordTextEditingController =
      new TextEditingController();

  signMeUP() {
    if (formKey.currentState.validate()) {
      Map<String, String> userInfoMap = {
        "name": nameTextEditingController.text,
        "email": emailTextEditingController.text
      };
      setState(() {
        isLoading = true;
      });

      authMethods
          .signUpwithEmailAndPassword(emailTextEditingController.text,
              passwordTextEditingController.text)
          .then((val) {
        // print("${val.uid}");

        databaseMethods.uploadUserInfo(userInfoMap);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoading
            ? Container(child: Center(child: CircularProgressIndicator()))
            : SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height - 20,
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Form(
                            key: formKey,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  validator: (val) {
                                    return val.isEmpty || val.length < 3
                                        ? "Enter correct Name"
                                        : null;
                                  },
                                  controller: nameTextEditingController,
                                  decoration: InputDecoration(
                                    hintText: "Name",
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  validator: (val) {
                                    return RegExp(
                                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                            .hasMatch(val)
                                        ? null
                                        : "Please enter valid email";
                                  },
                                  controller: emailTextEditingController,
                                  decoration: InputDecoration(
                                    hintText: "Email",
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  obscureText: true,
                                  validator: (val) {
                                    return val.isEmpty || val.length < 7
                                        ? "Password must be greater than 8 characters"
                                        : null;
                                  },
                                  controller: passwordTextEditingController,
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8),
                          /*    Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  alignment: Alignment.centerRight,
                  child: Text("Forgot Password?"),
              ),
              SizedBox(height: 8),*/
                          GestureDetector(
                            onTap: () {
                              signMeUP();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(vertical: 20),
                              decoration: BoxDecoration(
                                  color: Colors.amber[800],
                                  borderRadius: BorderRadius.circular(30)),
                              child: Text("Sign Up"),
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                                color: Colors.amber[100],
                                borderRadius: BorderRadius.circular(30)),
                            child: Text("Sign Up with Google"),
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have an Account?"),
                              GestureDetector(
                                onTap: () => signIn(context),
                                child: Container(
                                  child: Text(
                                    "SignIn Now",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                              ),
                              SizedBox(height: 70),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              iamSeller(context);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(vertical: 20),
                              decoration: BoxDecoration(
                                  color: Colors.lime[700],
                                  borderRadius: BorderRadius.circular(30)),
                              child: Text("I am a Seller"),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ));
  }
}

void iamSeller(BuildContext ctx) {
  Navigator.of(ctx).push(
    MaterialPageRoute(
      builder: (_) {
        return SellerSignup();
      },
    ),
  );
}
