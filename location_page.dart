import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widget_app/models/user_location.dart';
import 'package:widget_app/services/location_service.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  String? longit, latit, country;
  UserLocation? userLocation;

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  void getLocation() async {
    final locationService = LocationService();
    final locationData = await locationService.getLocation();
    if (locationData != null) {
      setState(() {
        userLocation = UserLocation(
            latitude: locationData.latitude, longitude: locationData.longitude);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // UserLocation userLocatoin = Provider.of<UserLocation>(context);
    return Center(
        child: Column(
      children: [
        Text(
            style: const TextStyle(color: Colors.deepOrange, fontSize: 40),
            'Latitude is ${userLocation?.latitude ?? 'Loading ...'} '),
        Text(
            style: const TextStyle(color: Colors.deepOrange, fontSize: 40),
            'longitude is ${userLocation?.longitude ?? 'Loading ...'}'),
      ],
    ));
  }
}
