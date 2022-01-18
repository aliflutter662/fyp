import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_fyp/Models/UserModel.dart';

class AddStudentPage extends StatefulWidget {
  final String role;
  const AddStudentPage({Key? key, required this.role}) : super(key: key);

  @override
  _AddStudentPageState createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  final firebaseInstance = FirebaseFirestore.instance;
  Future<void> addNewProduct(Map userdata) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    // var pathimage = image.toString();
    // var temp = pathimage.lastIndexOf('/');
    // var result = pathimage.substring(temp + 1);
    // print(result);
    // final ref =
    //     FirebaseStorage.instance.ref().child('product_images').child(result);
    // var response = await ref.putFile(image);
    // print("Updated $response");
    // var imageUrl = await ref.getDownloadURL();

    try {
      // CommanDialog.showLoading();
      // var response = await firebaseInstance.collection('productlist').add({
      //   'user_name': userdata['u_name'],
      //   'user_email': userdata['u_email'],
      //   'user_password': userdata['u_password'],
      //   "product_upload_date": userdata['u_upload_date'],
      //   'user_Id': uid,
      //   'ID': userdata['u_ID'],
      // });
      var user = new UserModel();
      user.addUser(userdata['u_ID'], userdata['u_email'], widget.role,
          userdata['u_name'], userdata['u_password'], uid);
      print("Firebase response1111 $user");
      // CommanDialog.hideLoading();
      // Get.back();
    } catch (exception) {
      // CommanDialog.hideLoading();
      print("Error Saving Data at firestore $exception");
    }
  }

  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> userdata = {
    "u_name": "",
    "u_email": "",
    "u_password": "",
    "role": "",
    "u_upload_date": DateTime.now().millisecondsSinceEpoch,
    "u_ID": "",
  };
  addProduct() {
    _formKey.currentState!.save();
    if (_formKey.currentState!.validate()) {
      print("Form is vaid ");

      print('Data for new product $userdata');
      addNewProduct(userdata);
    }
  }

  var name = "";
  var email = "";
  var password = "";
  var id = "";
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final uidController = TextEditingController();

  clearText() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    uidController.clear();
  }

  addUser() {
    print('User Added');
  }

  @override
  void dispose() {
    // Clean up the controller when the widget  is disposed.
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    uidController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: true,
        // leading: IconButton(
        //     icon: Icon(Icons.arrow_back),
        //     onPressed: () {
        //       Navigator.push(
        //         context,
        //         new MaterialPageRoute(
        //           builder: (context) => UserMain(),
        //         ),
        //       );
        //     }),
        title: Text('Add New User'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Name: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    userdata['u_name'] = value;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Email: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Email';
                    } else if (!value.contains('@')) {
                      return 'Please Enter Valid Email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    userdata['u_email'] = value;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Password';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    userdata['u_password'] = value;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Id: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: uidController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Id';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    userdata['u_ID'] = value;
                  },
                ),
              ),
              Text(widget.role),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, otherwise false.
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            name = nameController.text;
                            email = emailController.text;
                            password = passwordController.text;
                            id = uidController.text;
                            addProduct();
                            clearText();
                          });
                        }
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => {clearText()},
                      child: Text(
                        'Reset',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
