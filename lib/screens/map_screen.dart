import 'package:flutter/material.dart';
import 'package:maps/data/locations.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _ScreenState();
}

class _ScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _mapsController = Completer();

  @override
  Widget build(BuildContext context) {
    Map _routeArgs = ModalRoute.of(context)!.settings.arguments as Map;

    WorldWonder _wonder = worldWondersList[_routeArgs['index']];

    CameraPosition _cameraPosition = CameraPosition(
      target: _wonder.latLong,
      zoom: 10,
    );

    Marker _marker = Marker(
        markerId: MarkerId(_routeArgs['index'].toString()),
        position: _wonder.latLong,
        infoWindow: InfoWindow(
          title: "description:",
          snippet: _wonder.description,
        ));

    return Scaffold(
      appBar: AppBar(
        title: Text(_wonder.name),
        backgroundColor: Colors.blue,
      ),
      body: GoogleMap(
        mapType: MapType.hybrid,
        markers: {_marker},
        initialCameraPosition: _cameraPosition,
        onMapCreated: (GoogleMapController controller) {
          _mapsController.complete(controller);
        },
      ),
    );
  }
}
