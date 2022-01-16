import 'package:clima/utilities/location.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            //Get the current location
            // requestPermission();
            Location location = Location();
            location.getCurrentLocation();

          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
