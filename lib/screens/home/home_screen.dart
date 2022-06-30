import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iss_locator/models/location.dart';
import 'package:iss_locator/services/iss_locator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ISS Locator',
        ),
      ),
      body: Column(
        children: [
          const IssMap(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  IssLocator.instance.position.toString(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class IssMap extends StatefulWidget {
  const IssMap({
    Key? key,
  }) : super(key: key);

  @override
  State<IssMap> createState() => _IssMapState();
}

class _IssMapState extends State<IssMap> {
  final Completer<GoogleMapController> controller = Completer();

  late Position currentIssPosition;

  BitmapDescriptor issIcon = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    setCustomMarkerIcon();
    super.initState();
    currentIssPosition = IssLocator.instance.position;
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> setCustomMarkerIcon() async {
    await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(
        size: Size(24, 24),
      ),
      'icons/rocket.png',
    ).then((value) => issIcon = value);
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return SizedBox(
      height: screenSize.height / 2,
      child: GoogleMap(
        mapType: MapType.hybrid,
        markers: {
          Marker(
            markerId: const MarkerId('iss_location'),
            icon: issIcon,
            position: LatLng(
              currentIssPosition.latitude,
              currentIssPosition.longitude,
            ),
          ),
        },
        initialCameraPosition: CameraPosition(
          zoom: 1,
          target: LatLng(
            currentIssPosition.latitude,
            currentIssPosition.longitude,
          ),
        ),
        onMapCreated: (mapController) {
          controller.complete(mapController);
        },
      ),
    );
  }
}
