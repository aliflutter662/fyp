import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_fyp/Models/myenums.dart';
import 'package:my_fyp/pages/controllers/data_controller.dart';
import 'package:my_fyp/pages/user/list_user_page.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DataController controller = Get.put(DataController(Roles.admin.name));
  final uid = FirebaseAuth.instance.currentUser!.uid;
  authorizeAccess(BuildContext context) {
    FirebaseFirestore.instance
        .collection('userlist')
        .where('user_Id', isEqualTo: uid)
        .get()
        .then((docs) {
      if (docs.docs[0].exists) {
        if (docs.docs[0].data()['role'] == 'admin') {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Dashboard()));
        } else {
          print('not Authorized');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListStudentPage(),
    );
  }
}
