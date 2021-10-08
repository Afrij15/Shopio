import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  getProducts(String name) async {
    return await FirebaseFirestore.instance
        .collection("Products Details")
        .where("name", isEqualTo: name)
        .get();
  }

  uploadUserInfo(userMap) {
    FirebaseFirestore.instance.collection("users").add(userMap).catchError((e) {
      print(e.toString());
    });
  }

  uploadSellerInfo(userMap) {
    FirebaseFirestore.instance
        .collection("SellerDetails")
        .add(userMap)
        .catchError((e) {
      print(e.toString());
    });
  }

  uploadProductsInfo(userMap) {
    FirebaseFirestore.instance
        .collection("Produts Details")
        .add(userMap)
        .catchError((e) {
      print(e.toString());
    });
  }
}
