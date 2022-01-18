import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_fyp/order/order_page.dart';
import 'package:my_fyp/pages/agent/add_agent.dart';
import 'package:my_fyp/pages/cutting%20dashboard/add_cutting_comp.dart';
import 'package:my_fyp/pages/login.dart';
import 'package:my_fyp/pages/packing%20dashboard/packing_order_page.dart';
import 'package:my_fyp/pages/ranch%20dashboard/add_ranch_comp.dart';

class PackingDashboard extends StatefulWidget {
  const PackingDashboard({Key? key}) : super(key: key);

  @override
  _PackingDashboardState createState() => _PackingDashboardState();
}

class _PackingDashboardState extends State<PackingDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: PackingDrawer(),
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Padding(
              //   padding: EdgeInsets.all(12),
              //   child: Row(
              //     children: [
              //       Icon(
              //         Icons.menu,
              //         color: Colors.black,
              //         size: 50,
              //       ),
              //     ],
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.all(18),
              //   child: Text(
              //     'Dashboard Options',
              //     style: TextStyle(
              //         color: Colors.black,
              //         fontSize: 28,
              //         fontWeight: FontWeight.bold),
              //     textAlign: TextAlign.start,
              //   ),
              // ),
              Padding(
                  padding: EdgeInsets.only(
                    left: 12,
                    right: 12,
                    top: 12,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: 160,
                              height: 160,
                              child: Card(
                                color: Colors.orange,
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          AddCutting()));
                                            },
                                            child: Text('Cutting Company',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Center(
                                          child: Text(
                                            '2 Items',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              width: 160,
                              height: 160,
                              child: Card(
                                color: Colors.red,
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          AddRanch()));
                                            },
                                            child: Text('Ranch Owner',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Center(
                                          child: Text(
                                            '2 Items',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: 160,
                              height: 160,
                              child: Card(
                                color: Colors.blue,
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          AddAgent()));
                                            },
                                            child: Text('Total Agents',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Center(
                                          child: Text(
                                            '2 Items',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              width: 160,
                              height: 160,
                              child: Card(
                                color: Colors.indigo,
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('Total Deliverables',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '2 Items',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: 160,
                              height: 160,
                              child: Card(
                                color: Colors.green,
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('Order Finished',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '2 Items',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              width: 160,
                              height: 160,
                              child: Card(
                                color: Colors.purple,
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('Order in Progress',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '2 Items',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: 160,
                              height: 160,
                              child: Card(
                                color: Colors.brown,
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('Pending Orders',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '2 Items',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              width: 160,
                              height: 160,
                              child: Card(
                                color: Colors.grey,
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('Order Accepted',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '2 Items',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: 160,
                              height: 160,
                              child: Card(
                                color: Colors.black54,
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('Order Rejected',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '2 Items',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(child: Container()),
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class PackingDrawer extends StatefulWidget {
  const PackingDrawer({Key? key}) : super(key: key);

  @override
  _PackingDrawerState createState() => _PackingDrawerState();
}

class _PackingDrawerState extends State<PackingDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 220,
        child: Drawer(
          child: ListView(
            children: [
              Container(
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColor),
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FittedBox(
                      child: Text(
                        'Admin User: ',
                        // ${controller.userProfileData['userName']}',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    FittedBox(
                      child: Text(
                        'Email:',
                        // ${controller.userProfileData['email']} ',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    FittedBox(
                      child: Text(
                        'join date',
                        // 'JoinDate: ${controller.userProfileData['joinDate']} ',
                        //DateFormat.yMMMMd().format(DateTime.fromMillisecondsSinceEpoch(userProfileData['joinDate']))
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              // ListTile(
              //   leading: Icon(Icons.person),
              //   title: const Text('Packaging Company'),
              //   onTap: () {
              //     // Get.back();
              //     // Get.to(() => LoginUserproductScreen());
              //   },
              // ),
              ListTile(
                leading: Icon(Icons.person),
                title: const Text('Cutting Company'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddCutting()));
                  // Get.back();
                  // Get.back();
                  // Get.to(() => LoginUserproductScreen());
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: const Text('Ranch Owner'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddRanch()));
                  // Get.back();
                  // Get.back();
                  // Get.to(() => LoginUserproductScreen());
                },
              ),
              ListTile(
                leading: Icon(Icons.account_box),
                title: const Text('Agent Accounts'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddAgent()));
                  // Get.back();
                  // Get.back();
                  // Get.to(() => LoginUserproductScreen());
                },
              ),
              ListTile(
                leading: Icon(Icons.list),
                title: const Text('Place Order'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OrderPage()));
                  // Get.back();
                  // Get.to(() => LoginUserproductScreen());
                },
              ),
              ListTile(
                leading: Icon(Icons.list),
                title: const Text('Orders'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PackingOrder()));
                  // Get.back();
                  // Get.to(() => LoginUserproductScreen());
                },
              ),
              // ListTile(
              //   leading: Icon(Icons.person),
              //   title: const Text('Supervisor Accounts'),
              //   onTap: () {
              //     // Get.back();
              //     // Get.to(() => LoginUserproductScreen());
              //   },
              // ),
              // ListTile(
              //   leading: Icon(Icons.person),
              //   title: const Text('Packaging Company'),
              //   onTap: () {
              //     // Get.back();
              //     // Get.to(() => LoginUserproductScreen());
              //   },
              // ),
              ListTile(
                leading: Icon(Icons.logout),
                title: const Text('LogOut'),
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                      (route) => false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}