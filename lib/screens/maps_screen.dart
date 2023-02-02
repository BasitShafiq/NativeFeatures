import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/places.dart';

class MapsScreen extends StatefulWidget {
  static const routeName = '/map-screen';
  final intialLocation;
  bool isSelected;
  MapsScreen(
      {this.intialLocation =
          const Location(latitude: 44, longitude: 69),
      this.isSelected = false});
  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Google Maps"),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.intialLocation.latitude,
            widget.intialLocation.longitude,
          ),
          zoom: 9,
        ),
      ),
    );
  }
}
