import 'package:location/location.dart';

class LocationService {
  late Location location;
  bool serviceEnabled = false;
  PermissionStatus? permissionStatus;

  LocationService() {
    location = Location();
  }

  Future<bool> checkPermission() async {
    if (await checkService()) {
      permissionStatus = await location.hasPermission();
      if (permissionStatus == PermissionStatus.denied) {
        permissionStatus = await location.requestPermission();
      }
    }
    return permissionStatus == PermissionStatus.granted;
  }

  Future<bool> checkService() async {
    try {
      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
      }
    } catch (e) {
      print(e);
      serviceEnabled = false;
      checkService();
    }
    return serviceEnabled;
  }

  Future<LocationData?> getLocation() async {
    try {
      if (await checkPermission()) {
        final locationData = location.getLocation();
        return locationData;
      }
      return null;
    } catch (e) {
      print('cannot get location');
    }
  }
}

/*
import 'dart:async';
import 'package:location/location.dart';
import 'package:widget_app/models/user_server.dart';
import '../models/user_location.dart';

class LocationService {
  late UserLocation currentLocation;
  Location location = Location();

  StreamController<UserLocation> streamController = StreamController<
      UserLocation>.broadcast();

  Stream<UserLocation> get locationStream => streamController.stream;

  LocationService() {
    location.requestPermission().then((permissionStatus) {
      if (permissionStatus == true) {
        location.onLocationChanged.listen((locationData) {
          if (locationData != null) {
            streamController.add(UserLocation(latitude: locationData.latitude,
                longitude: locationData.longitude));
          }
        });
      }
    });
  }

  Future<UserLocation> getLocation() async {
    try {
      LocationData userLocation = await location.getLocation();
      UserLocation currentLocation = UserLocation(
          latitude: userLocation.latitude, longitude: userLocation.longitude);
    }
    catch (e) {
      print('cannot get location');
    }
    return currentLocation;
  }


}
 */
