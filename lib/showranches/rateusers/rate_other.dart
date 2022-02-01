import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_fyp/Models/myenums.dart';
// import 'package:flutter_fb_auth_emailpass/Models/myenums.dart';
// import 'package:flutter_fb_auth_emailpass/order/show_order.dart';
// import 'package:flutter_fb_auth_emailpass/pages/cutting%20dashboard/cutting_order_page.dart';
// import 'package:flutter_fb_auth_emailpass/pages/login.dart';
// import 'package:flutter_fb_auth_emailpass/pages/truck%20dashboard/truck_page.dart';

class RateUser extends StatefulWidget {
  final String role;
  // final String documentId;
  const RateUser({
    Key? key,
    required this.role,
  }) : super(key: key);

  @override
  _RateUserState createState() => _RateUserState();
}

class _RateUserState extends State<RateUser> {
  TextEditingController _text = TextEditingController();

  // controller _text=text;
  var uid = FirebaseAuth.instance.currentUser!.uid;
  var auth = FirebaseAuth.instance;
  String id = "";
  getData() async {
    var vari =
        await FirebaseFirestore.instance.collection('userlist').doc().get();
    setState(() {
      id = vari.data()!['id'];
    });
  }

  getCurrentUser() {
    var user = auth.currentUser!.uid;
    //final userid = auth.currentUser!.uid;
    //if user not empty it assign to login user
    if (user != null) {
      uid = user.toString();
    }
  }

  Future<void> Orderassigned(assignedOrder) async {
    try {
      String orderStatus = OrderStatus.delivered.name;
      if (rolee == Roles.boss.name ||
          rolee == Roles.bathPeople.name ||
          rolee == Roles.workers.name) {
        orderStatus = OrderStatus.pending.name;
      }
      await FirebaseFirestore.instance
          .collection("orderlist")
          .doc()
          .update({"role": rolee, "status": orderStatus});
      print("Firebase response");
    } catch (exception) {
      print("Error Saving Data at firestore $exception");
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    getData();
  }

  String? dropdownValue;
  final pakcingitems = [Roles.cutting.name];
  final cuttingItems = [
    Roles.supervisor.name,
    Roles.truck.name,
    Roles.boss.name
  ];
  final bossItems = [
    Roles.workers.name,
    Roles.bathPeople.name,
  ];
  final ranchItems = [
    Roles.boss.name,
  ];

  final agentItems = [
    Roles.boss.name,
  ];
  String rolee = "";
  final _assignorderKey = GlobalKey<FormState>();
  var order = "";
  double rating = 0;
  List<DropdownMenuItem<String>> getItems() {
    List<DropdownMenuItem<String>> items;

    if (widget.role == Roles.packing.name) {
      items = pakcingitems.map(buildMenuItem).toList();
    } else if (widget.role == Roles.cutting.name) {
      items = cuttingItems.map(buildMenuItem).toList();
    } else if (widget.role == Roles.boss.name) {
      items = bossItems.map(buildMenuItem).toList();
    } else if (widget.role == Roles.ranchOwner.name) {
      items = ranchItems.map(buildMenuItem).toList();
    } else if (widget.role == Roles.agent.name) {
      items = agentItems.map(buildMenuItem).toList();
    } else {
      items = pakcingitems.map(buildMenuItem).toList();
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Assign Order'),
      // ),
      body: SafeArea(
        child: Form(
          key: _assignorderKey,
          child: Column(
            children: [
              SizedBox(height: 50),
              Center(
                child: Container(
                  width: 400,
                  padding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.horizontal(),
                    color: Colors.black38,
                    // border: Border.all(color: Colors.deepOrange, width: 3)
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      // value: newValue,
                      items: getItems(),
                      dropdownColor: Colors.grey,
                      onChanged: (value) =>
                          setState(() => this.dropdownValue = value),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Rating: $rating'),
              RatingBar.builder(
                minRating: 1,
                itemSize: 46,
                itemPadding: EdgeInsets.symmetric(horizontal: 4),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                updateOnDrag: true,
                onRatingUpdate: (rating) {
                  setState(() {
                    print(rating);
                    this.rating = rating;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              //Text('UId : $uid'),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, otherwise false.
                        rolee = dropdownValue!;
                        FirebaseFirestore.instance
                            .collection('ratings')
                            .add({'rating': rating, 'role': rolee});

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("User Rated Successfully"),
                          duration: Duration(milliseconds: 500),
                        ));
                      },
                      child: Text(
                        'Rate',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ));
}
