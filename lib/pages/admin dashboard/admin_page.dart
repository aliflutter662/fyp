import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_fyp/pages/Bath%20People/add_bathpeople.dart';
import 'package:my_fyp/pages/agent/add_agent.dart';
import 'package:my_fyp/pages/boss%20dashboard/add_boss.dart';
import 'package:my_fyp/pages/cutting%20dashboard/add_cutting_comp.dart';
import 'package:my_fyp/pages/login.dart';
import 'package:my_fyp/pages/packing%20dashboard/add_packing_comp.dart';
import 'package:my_fyp/pages/ranch%20dashboard/add_ranch_comp.dart';
import 'package:my_fyp/pages/supervisor/add_supervisor.dart';
import 'package:my_fyp/pages/truck%20dashboard/add_truck.dart';
import 'package:my_fyp/pages/worker%20dashboard/add_worker.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
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
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: 160,
                        height: 160,
                        child: Card(
                          color: Colors.pink,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                                    AddPacking()));
                                      },
                                      child: Text('Packaging Company',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold))),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '2 Items',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   width: 10,
                    // ),
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
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                              fontWeight: FontWeight.bold))),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '2 Items',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
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
                          color: Colors.red,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                              fontWeight: FontWeight.bold))),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '2 Items',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(),
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
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                      child: Text('Boss',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold))),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '2 Items',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
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
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                      child: Text('Supervisor',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold))),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '2 Items',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(),
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
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                      child: Text('Truck',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold))),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '2 Items',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
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
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AddAgent()));
                                      },
                                      child: Text('Agent',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold))),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '2 Items',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(),
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
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                                    AddWorker()));
                                      },
                                      child: Text('Worker',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold))),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '2 Items',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
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
                          color: Colors.grey,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                                    AddBathPeople()));
                                      },
                                      child: Text('Bath People',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold))),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '2 Items',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
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
                      height: 160,
                      width: 160,
                    ))
                  ],
                ),

                // Padding(
                //   padding: EdgeInsets.all(12),
                //   child: Center(
                //     child: Wrap(
                //       spacing: 20,
                //       runSpacing: 20,
                //       children: [],
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
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
              ListTile(
                leading: Icon(Icons.person),
                title: const Text('Packaging Company'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddPacking()));
                  // Get.back();
                  // Get.to(() => LoginUserproductScreen());
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: const Text('Cutting Company'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddCutting()));
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
                  // Get.to(() => LoginUserproductScreen());
                },
              ),
              ListTile(
                leading: Icon(Icons.account_box),
                title: const Text('Boss Accounts'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddBoss()));
                  // Get.back();
                  // Get.to(() => LoginUserproductScreen());
                },
              ),
              ListTile(
                leading: Icon(Icons.account_box),
                title: const Text('Truck Accounts'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddTruck()));
                  // Get.back();
                  // Get.to(() => LoginUserproductScreen());
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: const Text('Supervisor Accounts'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddSupervisor()));
                  // Get.back();
                  // Get.to(() => LoginUserproductScreen());
                },
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
