import 'package:matcher/matcher.dart';
import 'dart:io';

class Location {
  final double latitude;
  final double longitude;
  final String? address;
  const Location(
      {required this.latitude, required this.longitude, this.address});
}

class Places {
  final String id;
  final String? title;
  final File? image;
  final Location? location;
  Places(
      {required this.id,
      required this.title,
      required this.image,
      required this.location});
}
