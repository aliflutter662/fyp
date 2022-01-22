import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import 'package:my_fyp/Models/myenums.dart';
import 'package:my_fyp/chat/chat_screen.dart';
import 'package:my_fyp/order/assign_order.dart';

// class ShowOrder extends StatefulWidget {
//   final String role;
//   const ShowOrder({Key? key, required this.role}) : super(key: key);
//   @override
//   _ShowOrderState createState() => _ShowOrderState();
// }

// class _ShowOrderState extends State<ShowOrder> {
//   // final DataController controller = Get.put(DataController());
//   // void initState() {
//   //   controller.getLoginUserProduct();
//   //   //_refresh();
//   //   super.initState();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text("Order "),
//       // ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [Expanded(child: Orders())],
//       ),
//     );
//   }
// }

final firebaseInstance = FirebaseFirestore.instance;

class Orders extends StatefulWidget {
  final String role;
  const Orders({Key? key, required this.role}) : super(key: key);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("orderlist")
            .where('role', isEqualTo: widget.role)
            .where('status', isEqualTo: OrderStatus.pending.name)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            physics: ScrollPhysics(),
            primary: true,
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return ListTile(
                title: Column(
                  crossAxisAlignment: loginUser!.email == data['ordertitle']
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    Card(
                      child: Container(
                        decoration: BoxDecoration(
                            color: loginUser!.email == data['ordertitle']
                                ? Colors.white.withOpacity(0.4)
                                : Colors.white.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(18)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  data['ordertitle'],
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  data['orderdesc'],
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      if (widget.role ==
                                              Roles.bathPeople.name ||
                                          widget.role == Roles.workers.name) {
                                        FirebaseFirestore.instance
                                            .collection("orderlist")
                                            .doc(document.id)
                                            .update({
                                          "role": widget.role,
                                          "status": OrderStatus.delivered.name
                                        });
                                      } else {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AssignOrder(
                                                      role: widget.role,
                                                      documentId: document.id,
                                                    )));
                                      }
                                    },
                                    child: Text('accept'))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                    onPressed: () async {
                                      String roleName = "";
                                      if (widget.role == Roles.cutting.name) {
                                        roleName = Roles.packing.name;
                                      } else if (widget.role ==
                                          Roles.boss.name) {
                                        roleName = Roles.cutting.name;
                                      } else if (widget.role ==
                                              Roles.bathPeople.name ||
                                          widget.role == Roles.workers.name) {
                                        roleName = Roles.boss.name;
                                      }

                                      await firebaseInstance
                                          .collection("orderlist")
                                          .doc(document.id)
                                          .update({
                                        "role": roleName,
                                        "status": OrderStatus.cancelled.name
                                      });
                                    },
                                    child: Text('Reject'))
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(data['status'])
                          ],
                          // title:
                          // subtitle: Text(data['user']),
                        ),
                      ),
                    )
                    // Text(data['user']),
                  ],
                ),
              );
            }).toList(),
          );
          // return ListView.builder(
          //   itemCount: snapshot.data.doc.lenth,
          //   itemBuilder: (context, i) {
          //   QueryDocumentSnapshot x = snapshot.data!.[i];
          //   return ListTile(

          //     title: Text(x['messages']),
          //   );
          // });
        });
  }
}
