import 'package:flutter/material.dart';
import 'package:location/location.dart';
import '../screens/maps_screen.dart';
import '../Helpers/location.dart';

class LocationInput extends StatefulWidget {
  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  late String? _imageMapurl = null;
  Future<void> selectOnMap() async {
    final selectedLocation = await Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (ctx) => MapsScreen(),
      ),
    );
    if (selectedLocation == null) return;
  }

  Future<void> getCurrentLocation() async {
    final cordinates = await Location().getLocation();
    cordinates.latitude;
    cordinates.longitude;
    final loc = LocationHelper.generateLocationPreviewImage(
        latitude: cordinates.latitude!, longitude: cordinates.longitude!);
    setState(() {
      _imageMapurl = loc;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 200,
          width: double.infinity,
          child: _imageMapurl == null
              ? Align(
                  alignment: Alignment.center,
                  child: Text(
                    "No Location Selected",
                    textAlign: TextAlign.center,
                  ))
              : Image.network(
                  _imageMapurl!,
                  fit: BoxFit.cover,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.location_on),
              onPressed: getCurrentLocation,
              label: Text("Current Location"),
              style: ButtonStyle(
                iconColor: MaterialStateProperty.all(Colors.indigo),
                foregroundColor: MaterialStateProperty.all(Colors.indigo),
              ),
            ),
            TextButton.icon(
              icon: Icon(Icons.map),
              style: ButtonStyle(
                iconColor: MaterialStateProperty.all(Colors.indigo),
                foregroundColor: MaterialStateProperty.all(Colors.indigo),
              ),
              onPressed: selectOnMap,
              label: Text("Select on Map"),
            ),
          ],
        )
      ],
    );
  }
}
