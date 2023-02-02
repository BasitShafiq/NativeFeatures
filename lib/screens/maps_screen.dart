import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/places.dart';

class MapsScreen extends StatefulWidget {
  static const routeName = '/map-screen';
  final intialLocation;
  bool isSelected;
  MapsScreen(
      {this.intialLocation = const Location(latitude: 44, longitude: 69),
      this.isSelected = false});
  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  late LatLng? selectedCordinates = null;
  void selectedLocation(LatLng? cordinates) {
    setState(() {
      selectedCordinates = cordinates;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          if (widget.isSelected)
            IconButton(
              onPressed: () {
                Navigator.of(context).pop(selectedCordinates);
              },
              icon: Icon(
                Icons.check,
              ),
            )
        ],
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
        onTap: widget.isSelected ? selectedLocation : null,
        markers: selectedCordinates != null && widget.isSelected == false
            ? {
                Marker(
                  markerId: MarkerId("M1"),
                  position: selectedCordinates ??
                      LatLng(widget.intialLocation.latitude,
                          widget.intialLocation.longitude),
                )
              }
            : {},
      ),
    );
  }
}
