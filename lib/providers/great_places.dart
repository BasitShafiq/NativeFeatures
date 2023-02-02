import 'package:flutter/material.dart';
import '../models/places.dart';
import 'dart:io';
import '../Helpers/DB.dart';
import '../Helpers/location.dart';

class GreatPlacesProvider extends ChangeNotifier {
  late List<Places> _items = [];
  List<Places> get items {
    return [..._items];
  }

  Places searchById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  Future<void> addPlace(
      String title, File image, Location? selectedPlace) async {
    final address = await LocationHelper.convertCordinatesToAddress(
        selectedPlace!.latitude, selectedPlace.longitude);
    final updatedLocation = Location(
        latitude: selectedPlace.latitude,
        longitude: selectedPlace.longitude,
        address: address);
    final newPlace = Places(
        id: DateTime.now().toString(),
        title: title,
        image: image,
        location: updatedLocation);

    _items.add(newPlace);

    DBHelper.insertDB('user_places', {
      'id': newPlace.id,
      'title': newPlace.title!,
      'image': newPlace.image!.path,
      'loc_lat': newPlace.location!.latitude,
      'loc_lon': newPlace.location!.longitude,
      'address': newPlace.location!.address,
    });
    notifyListeners();
  }

  Future<void> getPlaces() async {
    final data = await DBHelper.fetchData('user_places');
    _items = data
        .map((item) => Places(
            id: item['id'].toString(),
            title: item['title'].toString(),
            image: File(item['image'].toString()),
            location: Location(
                latitude: double.parse(item['loc_lat'].toString()),
                longitude: double.parse(item['loc_lon'].toString()),
                address: item['address'].toString())))
        .toList();
    notifyListeners();
  }
}
