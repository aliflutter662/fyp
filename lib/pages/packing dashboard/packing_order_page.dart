import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_fyp/Models/myenums.dart';
import 'package:my_fyp/order/cancel_order.dart';
import 'package:my_fyp/order/finished_order.dart';
import 'package:my_fyp/pages/login.dart';
import 'package:my_fyp/showranches/rateusers/rate_other.dart';

class PackingOrder extends StatefulWidget {
  const PackingOrder({Key? key}) : super(key: key);

  @override
  _PackingOrderState createState() => _PackingOrderState();
}

class _PackingOrderState extends State<PackingOrder>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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

          ///crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
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
          PackingOrderTopBar(),
          // Center(
          //   child: Text(
          //     'Home',
          //     style: TextStyle(fontSize: 32),
          //   ),
          // ),

          RateUser(
            role: Roles.packing.name,
          )
          // Column(children: [
          //   Expanded(
          //     child: RatingPage(),
          //   ),
          //   Expanded(
          //     child: Profile(),
          //   ),
          // ]),
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
              icon: Icon(Icons.star_border),
              text: 'Rates',
            ),
          ],
        ),
      ),
    );
  }
}

class PackingOrderTopBar extends StatefulWidget {
  const PackingOrderTopBar({Key? key}) : super(key: key);

  @override
  _PackingOrderTopBarState createState() => _PackingOrderTopBarState();
}

class _PackingOrderTopBarState extends State<PackingOrderTopBar>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
                  text: 'Cancelled'.toUpperCase(),
                ),
                Tab(
                  text: 'finished'.toUpperCase(),
                ),
              ]),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          CancelOrder(role: Roles.packing.name),
          FinishedOrder(role: Roles.packing.name),
        ],
      ),
    );
  }
}
