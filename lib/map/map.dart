import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();
  ///Because the emulator does not have a GPS component,
  ///it is not possible to locate a current location,
  ///so during the demonstration we will present a predefined location.
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(32.075457, 34.774545),
    zoom: 15,
  );

  static const CameraPosition _kPlace = CameraPosition(
      bearing: 193,
      target: LatLng(32.074309, 34.791991),
      tilt: 60,
      zoom: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('!ניווט לעזריאלי'),
        icon: const Icon(Icons.store),
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kPlace));
  }
}