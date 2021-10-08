import 'package:flutter/material.dart';
import 'package:shopio/Services/Auth.dart';
import 'package:shopio/Services/Database.dart';
import 'package:shopio/SignUpNew/Signin.dart';
import 'package:shopio/SignUpNew/review.dart';
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

class SellerSignup extends StatefulWidget {
  @override
  _SellerSignupState createState() => _SellerSignupState();
}

class _SellerSignupState extends State<SellerSignup> {
  bool isLoading = false;

  AuthMethods authMethods = new AuthMethods();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  final formKey = GlobalKey<FormState>();

  TextEditingController shopNameTextEditingController =
      new TextEditingController();
  TextEditingController emailTextEditingController =
      new TextEditingController();
  TextEditingController passwordTextEditingController =
      new TextEditingController();
  TextEditingController ownerNameTextEditingController =
      new TextEditingController();
  TextEditingController mobileTextEditingController =
      new TextEditingController();
  TextEditingController shopAddressTextEditingController =
      new TextEditingController();
  TextEditingController shopCategoryTextEditingController =
      new TextEditingController();

  sellerSignMeUP() {
    if (formKey.currentState.validate()) {
      Map<String, String> userInfoMap = {
        "Owner name": ownerNameTextEditingController.text,
        "Shop Name": shopNameTextEditingController.text,
        "Email": emailTextEditingController.text,
        "Password": passwordTextEditingController.text,
        "Mobile": mobileTextEditingController.text,
        "Shop Address": shopAddressTextEditingController.text,
        "Shop Category": shopCategoryTextEditingController.text,
      };
      setState(() {
        isLoading = true;
      });

      authMethods
          .signUpwithEmailAndPassword(emailTextEditingController.text,
              passwordTextEditingController.text)
          .then((val) {
        // print("${val.uid}");

        databaseMethods.uploadSellerInfo(userInfoMap);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Review()));
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
                    height: MediaQuery.of(context).size.height - 70,
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
                                    return val.isEmpty
                                        ? "Enter Owner Name"
                                        : null;
                                  },
                                  controller: ownerNameTextEditingController,
                                  decoration: InputDecoration(
                                    hintText: "Owner Name",
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
                                  validator: (val) {
                                    return val.isEmpty
                                        ? "Enter Shop Name"
                                        : null;
                                  },
                                  controller: shopNameTextEditingController,
                                  decoration: InputDecoration(
                                    hintText: "Shop Name",
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  validator: (val) {
                                    return val.isEmpty || val.length < 7
                                        ? "Password must be greater than 8 characters"
                                        : null;
                                  },
                                  controller: passwordTextEditingController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  validator: (val) {
                                    return val.isEmpty || val.length < 7
                                        ? "Enter Mobile No"
                                        : null;
                                  },
                                  controller: mobileTextEditingController,
                                  decoration: InputDecoration(
                                    hintText: "Mobile",
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  validator: (val) {
                                    return val.isEmpty || val.length < 20
                                        ? "Enter Valid Address"
                                        : null;
                                  },
                                  controller: shopAddressTextEditingController,
                                  decoration: InputDecoration(
                                    hintText: "Shop Address",
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  validator: (val) {
                                    return val.isEmpty
                                        ? "Enter Shop Category"
                                        : null;
                                  },
                                  controller: shopCategoryTextEditingController,
                                  decoration: InputDecoration(
                                    hintText: "Shop Category",
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
                              sellerSignMeUP();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(vertical: 20),
                              decoration: BoxDecoration(
                                  color: Colors.lime[700],
                                  borderRadius: BorderRadius.circular(30)),
                              child: Text("Sign Up"),
                            ),
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
                                    style: TextStyle(color: Colors.lime[700]),
                                  ),
                                ),
                              ),
                              SizedBox(height: 70)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ));
  }
}
