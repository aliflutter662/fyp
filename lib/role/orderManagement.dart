import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_fyp/Models/myenums.dart';
import 'package:my_fyp/order/show_order.dart';

class OrderManagement {
  Widget handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return authorizeAccess(context);
        }
        return Container(
          child: Text('no order assign'),
        );
      },
    );
  }

  final uid = FirebaseAuth.instance.currentUser?.uid;
  authorizeAccess(BuildContext context) {
    FirebaseFirestore.instance
        .collection('orderAssigned')
        .where('user_Id', isEqualTo: uid)
        .get()
        .then((docs) {
      if (docs.docs[0].exists) {
        if (docs.docs[0].data()['orderAssigned'] == 'boss') {
          return Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Orders(role: Roles.admin.name),
          ));
        } else if (docs.docs[0].data()['orderAssigned'] == 'supervisor') {
          return Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Orders(role: Roles.admin.name),
          ));
        } else if (docs.docs[0].data()['orderAssigned'] == 'truck') {
          return Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Orders(role: Roles.admin.name),
          ));
        }
      } else {
        print('not Authorized');
        return ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.deepPurple,
            content: Text(
              "Order not Assigned",
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
          ),
        );
      }
    });
  }
}
