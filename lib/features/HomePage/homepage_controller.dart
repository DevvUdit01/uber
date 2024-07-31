import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePageController extends GetxController {
  var currentPosition = const LatLng(37.4223, -122.0848).obs; // Placeholder coordinates
  var isLoading = true.obs;
  Completer<GoogleMapController> mapController = Completer<GoogleMapController>();

  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
  }

  Future<void> getCurrentLocation() async {
    try {
      Position position = await getCurrentPositionWithDialog();
      currentPosition.value = LatLng(position.latitude, position.longitude);
      isLoading.value = false;

      if (mapController.isCompleted) {
        final GoogleMapController controller = await mapController.future;
        controller.animateCamera(CameraUpdate.newLatLng(currentPosition.value));
      }
    } catch (e) {
      print(e);
      isLoading.value = false;
    }
  }

  Future<Position> getCurrentPositionWithDialog() async {
    print('Current position method call');
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      bool userEnabledLocation = await _showLocationDialog();
      if (!userEnabledLocation) {
        return Future.error('Location services are disabled');
      }
    }

    LocationPermission permissions = await Geolocator.checkPermission();
    if (permissions == LocationPermission.denied) {
      permissions = await Geolocator.requestPermission();
      if (permissions == LocationPermission.denied) {
        return Future.error('Permissions are denied');
      }
    }
    if (permissions == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permission');
    }
    return Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
  }

  Future<bool> _showLocationDialog() async {
    bool userResponse = false;
    await Get.dialog(
      AlertDialog(
        title: const Text('Location Services Disabled'),
        content: const Text('Please enable location services.'),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              userResponse = true;
              Get.back();
            },
          ),
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              userResponse = false;
              Get.back();
            },
          ),
        ],
      ),
    );
    return userResponse;
  }
}
