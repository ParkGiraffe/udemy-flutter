import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  // void requestPermission() async {
  //   LocationPermission permission = await Geolocator.requestPermission();
  // }

  void getLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    print(permission);
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            //Get the current location
            // requestPermission();
            getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
