import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qr_scanner/models/scan_model.dart';

class MapaPage extends StatefulWidget {
  const MapaPage({super.key});

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  MapType mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    final scan = ModalRoute.of(context)!.settings.arguments as ScanModel;

    final CameraPosition puntoinicial = CameraPosition(
      target: scan.getLatLng()!,
      zoom: 17,
      tilt: 70,
    );

    //Marcadores
    Set<Marker> markers = new Set<Marker>();
    markers.add(
      new Marker(
        markerId: MarkerId('geo-location'),
        position: scan.getLatLng()!,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
        actions: [
          IconButton(
            icon: Icon(Icons.location_disabled_outlined),
            onPressed: () async {
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                      target: scan.getLatLng()!, zoom: 17.5, tilt: 50),
                ),
              );
            },
          ),
        ],
      ),
      body: GoogleMap(
        myLocationEnabled: false,
        mapType: mapType,
        markers: markers,
        initialCameraPosition: puntoinicial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (mapType == MapType.normal) {
            mapType = MapType.satellite;
          } else {
            mapType = MapType.normal;
          }
          setState(() {});
        },
        child: Icon(Icons.layers),
      ),
    );
  }
}
