import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;
  //Location(this.latitude, this.longitude);
  Future<void> getLocation() async {
    try {
      //LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.medium);
      latitude = position.latitude;
      longitude = position.longitude;
      // print(position);
    } catch (e) {
      print(e);
    }
  }
}
