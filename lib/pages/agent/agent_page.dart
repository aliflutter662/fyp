import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:my_fyp/Models/myenums.dart';
import 'package:my_fyp/main.dart';
import 'package:my_fyp/order/finished_order.dart';
import 'package:my_fyp/pages/login.dart';
import 'package:my_fyp/pages/user/profile.dart';
import 'package:my_fyp/rating/Rating_page.dart';
import 'package:my_fyp/showranches/rateusers/rate_other.dart';
import 'package:my_fyp/showranches/show_ranches.dart';

class AgentTabBottom extends StatefulWidget {
  // const AgentTabBottom({Key? key}) : super(key: key);

  @override
  _AgentTabBottomState createState() => _AgentTabBottomState();
}

class _AgentTabBottomState extends State<AgentTabBottom>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification!.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode, // id
          notification.title, // title
          notification.body, // body
          NotificationDetails(
            // notificationDetails
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: 'My First message',
              color: Colors.blue,
              playSound: true,
              icon: '@mipmap/ic_launcher',
            ),
          ),
        );
        FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
          print('A new onMessageOpenedApp event was published!');
          RemoteNotification notification = message.notification!;
          AndroidNotification? andriod = message.notification!.android;
          if (notification != null && android != null) {
            showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: Text(notification.title.toString()),
                    content: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text(notification.body.toString())],
                      ),
                    ),
                  );
                });
          }
        });
      }
    });
    // FirebaseMessaging.instance.getToken().then((token) {
    //   print('token :$token');
    // });
    _tabController = TabController(length: 4, vsync: this);
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
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "History",
              style: TextStyle(color: Colors.black),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     setState(() {
            //       flutterLocalNotificationsPlugin.show(
            //           0,
            //           'Testing',
            //           'How you doing ?',
            //           NotificationDetails(
            //               android: AndroidNotificationDetails(
            //                   channel.id, channel.name,
            //                   channelDescription: 'hi',
            //                   importance: Importance.high,
            //                   color: Colors.blue,
            //                   playSound: true,
            //                   icon: '@mipmap/ic_launcher')));
            //     });
            //   },
            //   child: Text('notify'),
            //   style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
            // ),
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
          AgentTopBar(),
          ShowRanches(),
          Column(children: [
            Expanded(
              child: Text(''),
            ),
            Expanded(
              child: Profile(),
            ),
          ]),
          RateUser(
            role: Roles.agent.name,
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
              icon: Icon(Icons.person_search),
              text: 'Ranches',
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

class AgentTopBar extends StatefulWidget {
  const AgentTopBar({Key? key}) : super(key: key);

  @override
  _AgentTopBarState createState() => _AgentTopBarState();
}

class _AgentTopBarState extends State<AgentTopBar>
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
                  text: 'All Jobs(completed,in progress,pending)'.toUpperCase(),
                ),
              ]),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [FinishedOrder(role: Roles.agent.name)],
      ),
    );
  }
}
