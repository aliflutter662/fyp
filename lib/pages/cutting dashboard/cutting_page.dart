import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_fyp/pages/boss%20dashboard/add_boss.dart';
import 'package:my_fyp/pages/cutting%20dashboard/cutting_order_page.dart';
import 'package:my_fyp/pages/login.dart';
import 'package:my_fyp/pages/supervisor/add_supervisor.dart';
import 'package:my_fyp/pages/truck%20dashboard/add_truck.dart';

class CuttingDashboard extends StatefulWidget {
  const CuttingDashboard({Key? key}) : super(key: key);

  @override
  _CuttingDashboardState createState() => _CuttingDashboardState();
}

class _CuttingDashboardState extends State<CuttingDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CuttingDrawer(),
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
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: 160,
                              height: 160,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AddBoss()));
                                },
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
                                            CrossAxisAlignment.stretch,
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
                                                          AddBoss()));
                                            },
                                            child: Text('Boss Account',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
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
                          ),
                          Expanded(
                            child: SizedBox(
                              width: 160,
                              height: 160,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AddSupervisor()));
                                },
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
                                            CrossAxisAlignment.stretch,
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
                                                          AddSupervisor()));
                                            },
                                            child: Text('Total Supervisors',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
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
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AddTruck()));
                                },
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
                                            CrossAxisAlignment.stretch,
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
                                                          AddTruck()));
                                            },
                                            child: Text('Total Trucks',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
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
                          ),
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
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextButton(
                                          onPressed: () {},
                                          child: Text('Orders in Progress',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                        ),
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
                                color: Colors.indigo,
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextButton(
                                          onPressed: () {},
                                          child: Text('Orders finished',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                        ),
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
                                color: Colors.purple,
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextButton(
                                          onPressed: () {},
                                          child: Text('Pending Orders',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                        ),
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
                                color: Colors.brown,
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextButton(
                                          onPressed: () {},
                                          child: Text('Orders Accepted',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                        ),
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
                                color: Colors.black54,
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextButton(
                                          onPressed: () {},
                                          child: Text('Orders Rejected',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                        ),
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
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class CuttingDrawer extends StatefulWidget {
  const CuttingDrawer({Key? key}) : super(key: key);

  @override
  _CuttingDrawerState createState() => _CuttingDrawerState();
}

class _CuttingDrawerState extends State<CuttingDrawer> {
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
                title: const Text('Boss Account'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddBoss()));
                  // Get.back();
                  // Get.to(() => LoginUserproductScreen());
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: const Text('Truck Account'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddTruck()));
                  // Get.back();
                  // Get.to(() => LoginUserproductScreen());
                },
              ),
              ListTile(
                leading: Icon(Icons.account_box),
                title: const Text('Supervisor'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddSupervisor()));
                  // Get.back();
                  // Get.to(() => LoginUserproductScreen());
                },
              ),
              ListTile(
                leading: Icon(Icons.account_box),
                title: const Text('Order'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BossOrder()));
                  // Get.back();
                  // Get.to(() => LoginUserproductScreen());
                },
              ),
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
