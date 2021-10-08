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

class Addproducts extends StatefulWidget {
  @override
  _AddproductsState createState() => _AddproductsState();
}

class _AddproductsState extends State<Addproducts> {
  bool isLoading = false;

  AuthMethods authMethods = new AuthMethods();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  final formKey = GlobalKey<FormState>();

  TextEditingController productNameTextEditingController =
      new TextEditingController();
  TextEditingController brandNameTextEditingController =
      new TextEditingController();
  TextEditingController descriptionTextEditingController =
      new TextEditingController();
  TextEditingController colorTextEditingController =
      new TextEditingController();

  addProducts() {
    if (formKey.currentState.validate()) {
      Map<String, String> userInfoMap = {
        "Product name": productNameTextEditingController.text,
        "Brand Name": brandNameTextEditingController.text,
        "Description": descriptionTextEditingController.text,
        "Color": colorTextEditingController.text,
      };
      setState(() {
        isLoading = true;
      });

      databaseMethods.uploadProductsInfo(userInfoMap);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Review()));
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
                                        ? "Enter Product Name"
                                        : null;
                                  },
                                  controller: productNameTextEditingController,
                                  decoration: InputDecoration(
                                    hintText: "Ex: DriFit T-shirt",
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  validator: (val) {
                                    return val.isEmpty
                                        ? "Enter Brand Name"
                                        : null;
                                  },
                                  controller: brandNameTextEditingController,
                                  decoration: InputDecoration(
                                    hintText: "Nike",
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.orange),
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  validator: (val) {
                                    return val.isEmpty
                                        ? "Enter Description"
                                        : null;
                                  },
                                  controller: descriptionTextEditingController,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(bottom: 60.0),
                                    hintText: "Ex: This product is...",
                                  ),
                                ),
                                TextFormField(
                                  validator: (val) {
                                    return val.isEmpty ? "Enter Color" : null;
                                  },
                                  controller: colorTextEditingController,
                                  decoration: InputDecoration(
                                    hintText: "Ex: Blue",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8),
                          GestureDetector(
                            onTap: () {
                              addProducts();
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
