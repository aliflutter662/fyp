import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingPage extends StatefulWidget {
  final String role;
  const RatingPage({Key? key, required this.role}) : super(key: key);

  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  Future<void> updateRating() async {
    //   var response = await FirebaseFirestore.instance
    //       .collection('ratings')
    //       .where('role', isEqualTo: widget.role)
    //       .get();

    //   int totalRating = 0;
    //   double obtainedRating = 0.0;
    //   if (response.docs.length > 0) {
    //     response.docs.forEach(
    //       (result) {
    //         totalRating += 5;
    //         obtainedRating += result['rating'].toDouble();
    //       },
    //     );
    //   }

    //   rating = (obtainedRating / totalRating) * 5;
  }

  double rating = 0;

  @override
  void initState() {
    super.initState();
    updateRating();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('ratings')
            .where('role', isEqualTo: widget.role)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          double getRating() {
            if (snapshot.hasData) {
              int totalRating = 0;
              double obtainedRating = 0.0;
              snapshot!.data!.docs.forEach((result) {
                totalRating += 5;
                obtainedRating += result['rating'].toDouble();
              });

              rating = (obtainedRating / totalRating) * 5;
              return rating;
            }
            rating = 0;
            return rating;
          }

          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RatingBarIndicator(
                    // minRating: 1,
                    // initialRating: rating,
                    // allowHalfRating: true,
                    // glowRadius: 10,
                    // itemSize: 46,
                    rating: getRating(),
                    itemPadding: EdgeInsets.symmetric(horizontal: 4),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    // updateOnDrag: true,
                    // onRatingUpdate: (rating) {
                    //   setState(() {
                    //     print(rating);
                    //     this.rating = rating;
                    //   });
                    // },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
