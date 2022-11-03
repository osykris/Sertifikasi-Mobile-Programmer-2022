import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapsViewController extends GetxController {
  //TODO: Implement MapsController
  final Completer<GoogleMapController> _controller = Completer();

  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;

  late StreamSubscription<Position> streamSubscription;
  final Marker destination = const Marker(
    markerId: MarkerId('_destination'),
    infoWindow: InfoWindow(title: "Osy Krisdayanti"),
    position: LatLng(-7.941834, 112.616967),
  );

  @override
  void onInit() {
    super.onInit();
    getLocation();
  }

  @override
  void onClose() {
    streamSubscription.cancel();
  }

  void onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  getLocation() async {
    bool serviceEnabled;

    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where2
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    streamSubscription =
        Geolocator.getPositionStream().listen((Position position) {
      latitude.value = position.latitude;
      longitude.value = position.longitude;
    });
  }
}
