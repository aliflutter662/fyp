import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_fyp/Models/myenums.dart';
import 'package:my_fyp/chat/chat_screen.dart';

class ShowRanches extends StatelessWidget {
  const ShowRanches({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot<Map<String, dynamic>>> quryStream;
    quryStream = FirebaseFirestore.instance
        .collection("userlist")
        .where('role', isEqualTo: Roles.ranchOwner.name)
        .snapshots();
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
                  crossAxisAlignment: loginUser!.email == data['email']
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    Card(
                      child: Container(
                        decoration: BoxDecoration(
                            color: loginUser!.email == data['name']
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
                                  data['name'],
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  data['email'],
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
                            // Text(data['status'])
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
