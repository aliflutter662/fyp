import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_fyp/Models/myenums.dart';
import 'package:my_fyp/pages/controllers/data_controller.dart';
import 'package:my_fyp/pages/login.dart';
import 'package:my_fyp/pages/user/add_user_data.dart';

class AddWorker extends StatefulWidget {
  const AddWorker({Key? key}) : super(key: key);

  @override
  _AddWorkerState createState() => _AddWorkerState();
}

class _AddWorkerState extends State<AddWorker> {
  final DataController controller = Get.put(DataController(Roles.workers.name));
  void initState() {
    controller.getLoginUserProduct();
    //_refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _refresh() {
      return controller.getLoginUserProduct();
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Worker"),
            ElevatedButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AddStudentPage(role: Roles.workers.name),
                  ),
                ),
              },
              child: Text('Add'),
              style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
            ),
            ElevatedButton(
              onPressed: () async => {
                await FirebaseAuth.instance.signOut(),
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ),
                    (route) => false)
              },
              child: Text('Logout'),
              style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
            )
          ],
        ),
      ),
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
                            padding: const EdgeInsets.all(2.0),
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
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // ElevatedButton(
                                //   onPressed: () {
                                //     Navigator.push(
                                //         context,
                                //         MaterialPageRoute(
                                //             builder: (context) =>
                                //                 UpdateStudentPage(
                                //                     id: controller
                                //                         .loginUserData[index]
                                //                         .productId)));
                                //     // Navigator.push(
                                //     //     context,
                                //     //     MaterialPageRoute(
                                //     //         builder: (context) => editProduct(
                                //     //             controller
                                //     //                 .loginUserData[index].userId,
                                //     //             controller.loginUserData[index]
                                //     //                 .useremail,
                                //     //             controller.loginUserData[index]
                                //     //                 .username)));
                                //     // editProduct(
                                //     //     controller.loginUserData[index].productId,
                                //     //     controller.loginUserData[index].useremail,
                                //     //     controller.loginUserData[index].username);
                                //     // editProduct(
                                //     //   controller.loginUserData[index].productId,
                                //     //   controller
                                //     //       .loginUserData[index].productprice,
                                //     // );
                                //   },
                                //   child: Text('Edit'),
                                // ),
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
