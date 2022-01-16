import 'package:geolocator/geolocator.dart';

class Location {

  double? latitude;
  double? longitude;

  Location();

  void getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      print(permission);
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;

      print(longitude);
      print(latitude);

    } catch (e) {
      print(e);
    }
  }

}