import 'package:flutter/material.dart';
import '../models/places.dart';
import 'dart:io';
import '../Helpers/DB.dart';

class GreatPlacesProvider extends ChangeNotifier {
  late List<Places> _items = [];
  List<Places> get items {
    return [..._items];
  }

  void addPlace(String title, File image) {
    final newPlace = Places(
        id: DateTime.now().toString(),
        title: title,
        image: image,
        location: null);
    _items.add(newPlace);
    DBHelper.insertDB('user_places', {
      'id': newPlace.id,
      'title': newPlace.title!,
      'image': newPlace.image!.path
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
            location: null))
        .toList();
        notifyListeners();
  }
}
