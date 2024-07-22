import 'package:geolocator/geolocator.dart';

class Location {
  double? _longitude;
  double? _latitude;

  double getLongitude() {
    return _longitude!;
  }

  double getLatitude() {
    return _latitude!;
  }

  Future<void> getCurrenLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    print(permission);
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    print(isLocationServiceEnabled);
    if (!isLocationServiceEnabled) {
      await Geolocator.openLocationSettings();
    }
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      _longitude = position.longitude;
      _latitude = position.latitude;
    } catch (e) {
      print("Error: $e");
    }
  }
}
