import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_fyp/Models/myenums.dart';
import 'package:my_fyp/chat/chat_screen.dart';
import 'package:my_fyp/map/current_location_Page.dart';
// import 'package:flutter_fb_auth_emailpass/Models/myenums.dart';
// import 'package:flutter_fb_auth_emailpass/chat/chat_screen.dart';
// import 'package:flutter_fb_auth_emailpass/order/assign_order.dart';
// import 'package:flutter_fb_auth_emailpass/order/show_order.dart';

class FinishedOrder extends StatefulWidget {
  final String role;
  const FinishedOrder({Key? key, required this.role}) : super(key: key);

  @override
  _FinishedOrderState createState() => _FinishedOrderState();
}

class _FinishedOrderState extends State<FinishedOrder> {
  
  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot<Map<String, dynamic>>> quryStream;
    if (widget.role == Roles.packing.name) {
      quryStream = FirebaseFirestore.instance
          .collection("orderlist")
          .where('role', whereIn: [
        Roles.boss.name,
        Roles.truck.name,
        Roles.workers.name,
        Roles.bathPeople.name,
        Roles.supervisor.name
      ]).snapshots();
    } else if (widget.role == Roles.cutting.name) {
      quryStream = FirebaseFirestore.instance
          .collection("orderlist")
          .where('role', whereIn: [
        Roles.truck.name,
        Roles.workers.name,
        Roles.bathPeople.name,
        Roles.supervisor.name
      ]).snapshots();
    } else if (widget.role == Roles.boss.name) {
      quryStream = FirebaseFirestore.instance.collection("orderlist").where(
          'role',
          whereIn: [Roles.bathPeople.name, Roles.workers.name]).snapshots();
    }
    // widget.role == Roles.bathPeople.name ||
    //     widget.role == Roles.workers.name ||
    //     widget.role == Roles.truck.name ||
    //     widget.role == Roles.supervisor.name

    else if (widget.role == Roles.agent.name) {
      quryStream =
          FirebaseFirestore.instance.collection("orderlist").snapshots();
    } else {
      quryStream = FirebaseFirestore.instance
          .collection("orderlist")
          .where('role', isEqualTo: widget.role)
          .where('status', isEqualTo: OrderStatus.delivered.name)
          .snapshots();
    }

    return StreamBuilder<QuerySnapshot>(
        stream: quryStream,
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
                            SizedBox(
                              height: 10,
                            ),
                            Visibility(
                              visible: data["role"] == Roles.truck.name,
                              child: IconButton(
                                  onPressed: () async => {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CurrentLocation("user1"))),
                                      },
                                  icon: Icon(Icons.location_on)),
                            )
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
