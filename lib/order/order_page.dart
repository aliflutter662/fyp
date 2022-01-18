import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:my_fyp/Models/myenums.dart';
// import 'package:flutter_fb_auth_emailpass/Models/OrderModel.dart';
// import 'package:flutter_fb_auth_emailpass/Models/myenums.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final _orderKey = GlobalKey<FormState>();
  var order = "";
  var desc = "";
  final TitleController = TextEditingController();
  final DescController = TextEditingController();
  final uid = FirebaseAuth.instance.currentUser!.uid;
  Future<void> Order(order) async {
    try {
      var response =
          await FirebaseFirestore.instance.collection('orderlist').add({
        'user_Id': uid,
        'ordertitle': order,
        'orderdesc': desc,
        'joinDate': DateTime.now().microsecondsSinceEpoch,
        'role': Roles.cutting.name,
        'status': OrderStatus.pending.name
      });
      print("Firebase response1111 ${response.id}");
    } catch (exception) {
      print("Error Saving Data at firestore $exception");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order'),
      ),
      body: Form(
        key: _orderKey,
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Place Order',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: TitleController,
                    decoration: InputDecoration(
                        hintMaxLines: 2, hintText: 'Enter Title'),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: DescController,
                    decoration: InputDecoration(
                        hintMaxLines: 2, hintText: 'Enter Description'),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            if (_orderKey.currentState!.validate()) {
                              setState(() {
                                order = TitleController.text;
                                desc = DescController.text;
                              });
                              Order(order);
                            }
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.black,
                                content: Text(
                                  "Order Placed",
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.white),
                                ),
                              ),
                            );
                          },
                          child: Text('Make an Order')),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
