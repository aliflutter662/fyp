import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_fyp/chat/chat_screen.dart';
// import 'package:flutter_fb_auth_emailpass/chat/chat_screen.dart';

class Dataa extends StatefulWidget {
  const Dataa({Key? key}) : super(key: key);

  @override
  _DataaState createState() => _DataaState();
}

class _DataaState extends State<Dataa> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance.collection("productlist").snapshots(),
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
                  crossAxisAlignment: loginUser!.email == data['user_email']
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    Card(
                      child: Container(
                        decoration: BoxDecoration(
                            color: loginUser!.email == data['user_email']
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
                                  data['user_email'],
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.end,
                            //   children: [
                            //     ElevatedButton(
                            //         onPressed: () {
                            //           Navigator.push(
                            //               context,
                            //               MaterialPageRoute(
                            //                   builder: (context) =>
                            //                       AssignOrder()));
                            //         },
                            //         child: Text('accept'))
                            //   ],
                            // )
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
