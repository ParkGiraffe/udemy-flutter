import 'package:clima/services/networking.dart';
import 'package:clima/utilities/location.dart';
import 'package:flutter/material.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude;
  double? longitude;

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation(); // await를 쓸려면 반환형이 Future여야 한다.
    
    longitude = location.longitude;
    latitude = location.latitude;

    NetworkingHelper networkingHelper = NetworkingHelper('api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid={API key}');

    var weatherData = await networkingHelper.getData();
  }


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
            getLocationData();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
