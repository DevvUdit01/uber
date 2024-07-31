import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'homepage_controller.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return GoogleMap(
            mapType: MapType.hybrid,
            onMapCreated: (GoogleMapController mapController) {
              controller.mapController.complete(mapController);
              mapController.animateCamera(CameraUpdate.newLatLng(controller.currentPosition.value));
            },
            initialCameraPosition: CameraPosition(
              target: controller.currentPosition.value,
              zoom: 13,
            ),
            markers: {
              Marker(
                markerId: const MarkerId('_currentLocation'),
                icon: BitmapDescriptor.defaultMarker,
                position: controller.currentPosition.value,
              ),
            },
          );
        }
      }),
    );
  }
}
