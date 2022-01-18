import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_fyp/Models/myenums.dart';
// import 'package:flutter_fb_auth_emailpass/Models/myenums.dart';
// import 'package:flutter_fb_auth_emailpass/order/show_order.dart';
// import 'package:flutter_fb_auth_emailpass/pages/cutting%20dashboard/cutting_order_page.dart';
// import 'package:flutter_fb_auth_emailpass/pages/login.dart';
// import 'package:flutter_fb_auth_emailpass/pages/truck%20dashboard/truck_page.dart';

class AssignOrder extends StatefulWidget {
  final String role;

  const AssignOrder({Key? key, required this.role}) : super(key: key);

  @override
  _AssignOrderState createState() => _AssignOrderState();
}

class _AssignOrderState extends State<AssignOrder> {
  TextEditingController _text = TextEditingController();

  // controller _text=text;
  var uid = FirebaseAuth.instance.currentUser!.uid;
  var auth = FirebaseAuth.instance;
  String id = "";
  getData() async {
    var vari =
        await FirebaseFirestore.instance.collection('userlist').doc().get();
    setState(() {
      id = vari.data()!['id'];
    });
  }

  getCurrentUser() {
    var user = auth.currentUser!.uid;
    //final userid = auth.currentUser!.uid;
    //if user not empty it assign to login user
    if (user != null) {
      uid = user.toString();
    }
  }

  Future<void> Orderassigned(assignedOrder) async {
    try {
      var response =
          await FirebaseFirestore.instance.collection('orderlist').add({
        'user_Id': uid,
        'orderAssigned': assignedOrder,
      });
      print("Firebase response1111 ${response.id}");
    } catch (exception) {
      print("Error Saving Data at firestore $exception");
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    getData();
  }

  String? dropdownValue;
  final items = [
    Roles.boss.name,
    Roles.supervisor.name,
    Roles.truck.name,
  ];

  final bossItems = [
    Roles.workers.name,
    Roles.bathPeople.name,
  ];
  String rolee = "";
  final _assignorderKey = GlobalKey<FormState>();
  var order = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assign Order'),
      ),
      body: SafeArea(
        child: Form(
          key: _assignorderKey,
          child: Column(
            children: [
              SizedBox(height: 50),
              Center(
                child: Container(
                  width: 400,
                  padding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.horizontal(),
                    color: Colors.black38,
                    // border: Border.all(color: Colors.deepOrange, width: 3)
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      // value: newValue,
                      items: widget.role == Roles.cutting.name
                          ? items.map(buildMenuItem).toList()
                          : bossItems.map(buildMenuItem).toList(),
                      dropdownColor: Colors.grey,
                      onChanged: (value) =>
                          setState(() => this.dropdownValue = value),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 10,
              ),
              //Text('UId : $uid'),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, otherwise false.
                        if (_assignorderKey.currentState!.validate()) {
                          setState(() {
                            rolee = dropdownValue!;
                            Orderassigned(rolee);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.black,
                                content: Text(
                                  "Order Assigned",
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.white),
                                ),
                              ),
                            );
                            print(rolee);
                            if (rolee == 'truck') {
                              print(uid);

                              print('order assigned to truck');
                            } else if (rolee == 'supervisor') {
                              print('order assigned to Supervisor');
                            } else if (rolee == 'boss') {
                              print('order assigned to boss');
                            }
                          });
                          // registration(confirmPassword, confirmRole, rolee);
                        }
                      },
                      child: Text(
                        'Assgin Order',
                        style: TextStyle(fontSize: 18.0),
                      ),
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

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ));
}
