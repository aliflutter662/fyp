import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    setState(() {
      getUserProfileData();
    });
    //getData();
  }

  final firebaseInstance = FirebaseFirestore.instance;
  Map userProfileData = {'userName': '', 'joinDate': '', 'email': ''};

  // AuthController controller = AuthController();

  // void onReady() {
  //   super.onReady();
  //   //getAllProduct();
  //   getUserProfileData();
  // }

  Future<void> getUserProfileData() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    print("user id ${uid}");
    try {
      var response = await firebaseInstance
          .collection('userlist')
          .where('user_Id', isEqualTo: uid)
          .get();
      // response.docs.forEach((result) {
      //   print(result.data());
      // });
      if (response.docs.length > 0) {
        userProfileData['userName'] = response.docs[0]['user_name'];
        userProfileData['joinDate'] = response.docs[0]['joinDate'];
        userProfileData['email'] = response.docs[0]['email'];
      }
      print(userProfileData);
    } on FirebaseException catch (e) {
      print(e);
    } catch (error) {
      print(error);
    }
  }

  final uid = FirebaseAuth.instance.currentUser!.uid;
  final email = FirebaseAuth.instance.currentUser!.email;
  final creationTime = FirebaseAuth.instance.currentUser!.metadata.creationTime;

  User? user = FirebaseAuth.instance.currentUser;

  verifyEmail() async {
    if (user != null && !user!.emailVerified) {
      await user!.sendEmailVerification();
      print('Verification Email has benn sent');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            'Verification Email has benn sent',
            style: TextStyle(fontSize: 18.0, color: Colors.black),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        children: [
          Text(
            'User ID: $uid',
            style: TextStyle(fontSize: 18.0),
          ),
          Row(
            children: [
              Text(
                'Email: $email',
                style: TextStyle(fontSize: 18.0),
              ),
              user!.emailVerified
                  ? Text(
                      'verified',
                      style: TextStyle(fontSize: 18.0, color: Colors.blueGrey),
                    )
                  : TextButton(
                      onPressed: () => {
                            // getUserProfileData(),
                            verifyEmail()
                          },
                      child: Text('Verify Email'))
            ],
          ),
          Text(
            'Created: $creationTime',
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}
