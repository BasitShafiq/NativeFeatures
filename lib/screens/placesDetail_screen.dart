import 'package:flutter/material.dart';
import '../providers/great_places.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import '../screens/maps_screen.dart';

class PlacesDetail extends StatelessWidget {
  static const routeName = '/places-detail';
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments;
    final selectedPlace =
        Provider.of<GreatPlacesProvider>(context).searchById(id.toString());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(selectedPlace.title!),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              height: 400,
              child: Image.file(
                selectedPlace.image!,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              selectedPlace.location!.address!,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 16,
            ),
            TextButton.icon(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (ctx) => MapsScreen(
                            intialLocation: selectedPlace.location,
                          )));
                },
                style: ButtonStyle(
                  iconColor: MaterialStateProperty.all(Colors.indigo),
                  foregroundColor: MaterialStateProperty.all(Colors.indigo),
                ),
                icon: Icon(Icons.map),
                label: Text("View on Map")),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
