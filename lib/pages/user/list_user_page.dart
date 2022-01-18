import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_fyp/pages/controllers/data_controller.dart';
import 'package:my_fyp/pages/user/update_user_page.dart';

class ListStudentPage extends StatefulWidget {
  // final Future Function() onRefresh;
  // ListStudentPage({required this.onRefresh});
  @override
  _ListStudentPageState createState() => _ListStudentPageState();
}

class _ListStudentPageState extends State<ListStudentPage> {
  final DataController controller = Get.find();
  final editPriceValue = TextEditingController();
  final editname = TextEditingController();

  editProduct(productID, produtPrice, productname) {
    editPriceValue.text = produtPrice.toString();
    editname.text = productname.toString();
    Get.bottomSheet(
      ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
        child: Container(
          color: Colors.white,
          height: 200,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: "Enter email"),
                  controller: editPriceValue,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Enter user name"),
                  controller: editname,
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                    controller.editProduct(
                        productID, editPriceValue.text, editname.text);
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _refresh() {
    return controller.getLoginUserProduct();
  }

  CollectionReference productlist =
      FirebaseFirestore.instance.collection('productlist');
  Future<void> deleteUser(id) {
    return productlist
        .doc(id)
        .delete()
        .then((value) => print('user deleted$id'))
        .catchError((error) => print('delete Failed$error'));
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      controller.getLoginUserProduct();
    });
    return Scaffold(
      body: GetBuilder<DataController>(
        builder: (controller) => controller.loginUserData.isEmpty
            ? Center(
                child: Text('😔 NO DATA FOUND PLEASE ADD DATA 😔'),
              )
            : RefreshIndicator(
                triggerMode: RefreshIndicatorTriggerMode.onEdge,
                edgeOffset: 20,
                displacement: 0,
                strokeWidth: 2,
                color: Colors.black,
                backgroundColor: Colors.white,
                onRefresh: () async {
                  await _refresh();
                },
                child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: controller.loginUserData.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "User Name: ${controller.loginUserData[index].username}",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Email: ${controller.loginUserData[index].useremail.toString()}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                UpdateStudentPage(
                                                    id: controller
                                                        .loginUserData[index]
                                                        .productId)));
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => editProduct(
                                    //             controller
                                    //                 .loginUserData[index].userId,
                                    //             controller.loginUserData[index]
                                    //                 .useremail,
                                    //             controller.loginUserData[index]
                                    //                 .username)));
                                    // editProduct(
                                    //     controller.loginUserData[index].productId,
                                    //     controller.loginUserData[index].useremail,
                                    //     controller.loginUserData[index].username);
                                    // editProduct(
                                    //   controller.loginUserData[index].productId,
                                    //   controller
                                    //       .loginUserData[index].productprice,
                                    // );
                                  },
                                  child: Text('Edit'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    controller.deleteProduct(controller
                                        .loginUserData[index].productId);
                                    // controller.deleteProduct(
                                    //     controller.loginUserData[index].userId);
                                    //   controller.deleteProduct(controller
                                    //       .loginUserData[index].productId);
                                  },
                                  child: Text('Delete'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}

// Container(
//                   margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//                   child: SingleChildScrollView(
//                     scrollDirection: Axis.vertical,
//                     child: Table(
//                         border: TableBorder.all(),
//                         columnWidths: const <int, TableColumnWidth>{
//                           1: FixedColumnWidth(140),
//                         },
//                         defaultVerticalAlignment:
//                             TableCellVerticalAlignment.middle,
//                         children: [
//                           TableRow(
//                             children: [
//                               TableCell(
//                                   child: Container(
//                                 color: Colors.greenAccent,
//                                 child: Center(
//                                   child: Text(
//                                     "Name",
//                                     style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                               )),
//                               TableCell(
//                                   child: Container(
//                                 color: Colors.greenAccent,
//                                 child: Center(
//                                   child: Text(
//                                     "Email",
//                                     style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                               )),
//                               TableCell(
//                                   child: Container(
//                                 color: Colors.greenAccent,
//                                 child: Center(
//                                   child: Text(
//                                     "Action",
//                                     style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                               )),
//                             ],
//                           ),
//                           for (var i = 0; i < 5; i++) ...[
//                             TableRow(children: [
//                               TableCell(
//                                 child: Center(
//                                   child: Text(
//                                     'name',
//                                     style: TextStyle(fontSize: 18),
//                                   ),
//                                 ),
//                               ),
//                               TableCell(
//                                 child: Center(
//                                   child: Text(
//                                     'email',
//                                     style: TextStyle(fontSize: 18),
//                                   ),
//                                 ),
//                               ),
//                               TableCell(
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     IconButton(
//                                       onPressed: () {
//                                         Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                                   UpdateStudentPage()),
//                                         );
//                                       },
//                                       icon: Icon(
//                                         Icons.edit,
//                                         color: Colors.orange,
//                                       ),
//                                     ),
//                                     IconButton(
//                                       onPressed: () {
//                                         Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                                   AddStudentPage()),
//                                         );
//                                       },
//                                       icon: Icon(
//                                         Icons.add,
//                                         color: Colors.orange,
//                                       ),
//                                     ),
//                                     IconButton(
//                                       onPressed: () async {
//                                         //   DocumentSnapshot variable
//                                         //   =await FirebaseFirestore.instance.collection('students').doc('email').get();
//                                         // print(variable);
//                                         print('');
//                                       },
//                                       icon: Icon(
//                                         Icons.delete,
//                                         color: Colors.red,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ]),
//                           ],
//                         ]),
//                   ),
//                 ),
