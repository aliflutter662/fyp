import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

var loginUser = FirebaseAuth.instance.currentUser;
var uid = FirebaseAuth.instance.currentUser!.uid;

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final auth = FirebaseAuth.instance;
  getCurrentUser() {
    final user = auth.currentUser;
    final userid = auth.currentUser!.uid;
    //if user not empty it assign to login user
    if (user != null && userid != null) {
      loginUser = user;
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(loginUser!.email.toString()),
        ],
      ),
    );
  }
}
