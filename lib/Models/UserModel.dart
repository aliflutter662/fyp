import 'package:cloud_firestore/cloud_firestore.dart';

import 'myenums.dart';

class UserModel {
  CollectionReference user = FirebaseFirestore.instance.collection('userlist');

  bool addUser(String id, String email, String role, String name,
      String password, String uid) {
    bool status = false;
    // Call the user's CollectionReference to add a new user
    user
        .add({
          'id': id,
          'email': email,
          'role': role,
          'name': name,
          'password': password,
          'user_Id': uid
        })
        .then((value) => () => {status = true})
        .catchError((error) => () => {status = false});

    return status;
  }
}
