import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:flutter_polyline_points/flutter_polyline_points.dart';
//import 'package:geolocator/geolocator.dart';
//import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:location/location.dart' as loc;
//import 'package:google_maps_flutter/google_maps_flutter.dart';

class CurrentLocation extends StatefulWidget {
  final String user_id;
  CurrentLocation(this.user_id);

  @override
  _CurrentLocationState createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
  final loc.Location location = loc.Location();
  late GoogleMapController _controller;
  bool _added = false;
  @override
  Widget build(BuildContext context) {
    // Completer<GoogleMapController> _controllerGoogleMap = Completer();
    // GoogleMapController? newGoogleMapControler;
    // Position currentPostion;
    // var geoLocator = Geolocator();

    // void locatePosition() async {
    //   Position position = await Geolocator.getCurrentPosition(
    //       desiredAccuracy: LocationAccuracy.high);
    //   LatLng latlatPosition = LatLng(position.latitude, position.longitude);

    //   CameraPosition cameraPosition =
    //       new CameraPosition(target: latlatPosition, zoom: 14);
    //   newGoogleMapControler
    //       ?.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    // }

    // final CameraPosition _kGooglePlex = CameraPosition(
    //   target: LatLng(37.42796133580664, -122.085749655962),
    //   zoom: 14.4746,
    // );

    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('location').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (_added) {
              mymap(snapshot);
            }
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return GoogleMap(
              mapType: MapType.normal,
              markers: {
                Marker(
                    position: LatLng(
                      snapshot.data!.docs.singleWhere((element) =>
                          element.id == widget.user_id)['latitude'],
                      snapshot.data!.docs.singleWhere((element) =>
                          element.id == widget.user_id)['longitude'],
                    ),
                    markerId: MarkerId('id'),
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueMagenta)),
              },
              initialCameraPosition: CameraPosition(
                  target: LatLng(
                    snapshot.data!.docs.singleWhere(
                        (element) => element.id == widget.user_id)['latitude'],
                    snapshot.data!.docs.singleWhere(
                        (element) => element.id == widget.user_id)['longitude'],
                  ),
                  zoom: 14.47),
              onMapCreated: (GoogleMapController controller) async {
                setState(() {
                  _controller = controller;
                  _added = true;
                });
              },
            );
          }),

      // appBar: AppBar(
      //   title: Text('Location'),
      // ),
      // body: Stack(
      //   children: [
      //     GoogleMap(
      //         mapType: MapType.normal,
      //         myLocationButtonEnabled: true,
      //         initialCameraPosition: _kGooglePlex,
      //         myLocationEnabled: true,
      //         zoomGesturesEnabled: true,
      //         zoomControlsEnabled: true,
      //         onMapCreated: (GoogleMapController controller) {
      //           _controllerGoogleMap.complete(controller);
      //           newGoogleMapControler = controller;
      //           locatePosition();
      //         }),
      //   ],
      // ),
    );
  }

  Future<void> mymap(AsyncSnapshot<QuerySnapshot> snapshot) async {
    await _controller
        .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
            target: LatLng(
              snapshot.data!.docs.singleWhere(
                  (element) => element.id == widget.user_id)['latitude'],
              snapshot.data!.docs.singleWhere(
                  (element) => element.id == widget.user_id)['longitude'],
            ),
            zoom: 14.47)));
  }
}
