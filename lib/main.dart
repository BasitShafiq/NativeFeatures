import 'package:flutter/material.dart';
import './screens/placesList_screen.dart';
import './screens/addPlace_screen.dart';
import 'package:provider/provider.dart';
import './providers/great_places.dart';
import './screens/maps_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlacesProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.indigo,
          accentColor: Colors.amber,
        ),
        home: PlacesList(),
        routes: {
          AddPlaces.routeName: (ctx) => AddPlaces(),
          MapsScreen.routeName: (ctx) => MapsScreen(),
        },
      ),
    );
  }
}
