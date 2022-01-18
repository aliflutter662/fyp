import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_fyp/Models/myenums.dart';

class OrderModel {
  CollectionReference order =
      FirebaseFirestore.instance.collection('orderlist');

  bool addOrder(String title, String Desc, String Date, Roles role,
      OrderStatus orderStatus) {
    bool status = false;
    // Call the order's CollectionReference to add a new order
    order
        .add({
          'title': title,
          'desc': Desc,
          'date': Date,
          'role': role,
          'orderStatus': orderStatus
        })
        .then((value) => () => {status = true})
        .catchError((error) => () => {status = false});

    return status;
  }
}
