import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_fyp/Models/myenums.dart';
import 'package:my_fyp/pages/Bath%20People/Bath_People_page.dart';
import 'package:my_fyp/pages/admin%20dashboard/admin_page.dart';
import 'package:my_fyp/pages/agent/agent_page.dart';
import 'package:my_fyp/pages/boss%20dashboard/boss_page.dart';
import 'package:my_fyp/pages/cutting%20dashboard/cutting_page.dart';
import 'package:my_fyp/pages/packing%20dashboard/packing_page.dart';
import 'package:my_fyp/pages/ranch%20dashboard/ranch_page.dart';
import 'package:my_fyp/pages/supervisor/supervisor_page.dart';
import 'package:my_fyp/pages/truck%20dashboard/truck_page.dart';
import 'package:my_fyp/pages/worker%20dashboard/worker_page.dart';

class UserManagement {
  // Widget handleAuth() {
  //   return StreamBuilder(
  //     stream: FirebaseAuth.instance.authStateChanges(),
  //     builder: (BuildContext context, snapshot) {
  //       if (snapshot.hasData) {
  //         return authorizeAccess(context);
  //       }
  //       return Login();
  //     },
  //   );
  // }

  final uid = FirebaseAuth.instance.currentUser?.uid;
  authorizeAccess(BuildContext context, String email, String pass) async {
    final firebaseInstance = FirebaseFirestore.instance;

    var response = await firebaseInstance
        .collection('userlist')
        .where('email', isEqualTo: email)
        .where('password', isEqualTo: pass)
        .get();

    if (response.docs.length > 0) {
      if (response.docs[0].exists) {
        if (response.docs[0].data()['role'] == Roles.boss.name) {
          return Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => BossTabBottom()));
        } else if (response.docs[0].data()['role'] == Roles.admin.name) {
          return Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AdminDashboard()));
        } else if (response.docs[0].data()['role'] == Roles.truck.name) {
          return Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => TabBottom()));
        } else if (response.docs[0].data()['role'] == Roles.supervisor.name) {
          return Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => SupervisorTabBottom()));
        } else if (response.docs[0].data()['role'] == Roles.cutting.name) {
          return Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => CuttingDashboard()));
        } else if (response.docs[0].data()['role'] == Roles.packing.name) {
          return Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => PackingDashboard()));
        } else if (response.docs[0].data()['role'] == Roles.ranchOwner.name) {
          return Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RanchTabBottom(),
          ));
        } else if (response.docs[0].data()['role'] == Roles.bathPeople.name) {
          return Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BathTabBottom(),
          ));
        } else if (response.docs[0].data()['role'] == Roles.agent.name) {
          return Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AgentTabBottom(),
          ));
        } else if (response.docs[0].data()['role'] == Roles.workers.name) {
          return Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => WorkerTabBottom(),
          ));
        }
      } else {
        print('not Authorized');
        return ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.deepPurple,
            content: Text(
              "Not Authorized for admin",
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
          ),
        );
      }
    }
  }
}
