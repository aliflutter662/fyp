import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_fyp/Models/myenums.dart';
import 'package:my_fyp/order/finished_order.dart';
import 'package:my_fyp/pages/login.dart';
import 'package:my_fyp/pages/user/profile.dart';
import 'package:my_fyp/rating/Rating_page.dart';
import 'package:my_fyp/showranches/rateusers/rate_other.dart';

class RanchTabBottom extends StatefulWidget {
  const RanchTabBottom({Key? key}) : super(key: key);

  @override
  _RanchTabBottomState createState() => _RanchTabBottomState();
}

class _RanchTabBottomState extends State<RanchTabBottom>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "History",
              style: TextStyle(color: Colors.black),
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
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: TabBarView(
        controller: _tabController,
        // physics: NeverScrollableScrollPhysics(), // stop swipe scroll
        children: [
          RanchTopTabBar(),
          // Center(
          //   child: Text(
          //     'Home',
          //     style: TextStyle(fontSize: 32),
          //   ),
          // ),

          Column(children: [
            Expanded(
              child: Text(''),
            ),
            Expanded(
              child: Profile(),
            ),
          ]),
          RateUser(
            role: Roles.ranchOwner.name,
          )
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: TabBar(
          controller: _tabController,
          unselectedLabelColor: Colors.black45,
          indicator: UnderlineTabIndicator(borderSide: BorderSide(width: 0)),
          labelColor: Colors.black,
          // labelStyle: TextStyle(fontSize: 15),
          tabs: [
            Tab(
              icon: Icon(Icons.home),
              text: 'Home',
            ),
            Tab(
              icon: Icon(Icons.person),
              text: 'Profile',
            ),
            Tab(
              icon: Icon(Icons.star),
              text: 'Rates',
            ),
          ],
        ),
      ),
    );
  }
}

class RanchTopTabBar extends StatefulWidget {
  const RanchTopTabBar({Key? key}) : super(key: key);

  @override
  _RanchTopTabBarState createState() => _RanchTopTabBarState();
}

class _RanchTopTabBarState extends State<RanchTopTabBar>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          color: Colors.white,
          child: TabBar(
              controller: _tabController,
              indicator:
                  UnderlineTabIndicator(borderSide: BorderSide(width: 0)),
              indicatorColor: Colors.white,
              unselectedLabelColor: Colors.black45,
              labelColor: Colors.black,
              indicatorWeight: 5,
              tabs: [
                Tab(
                  text: 'Completed jobs'.toUpperCase(),
                ),
              ]),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [FinishedOrder(role: Roles.packing.name)],
      ),
    );
  }
}
