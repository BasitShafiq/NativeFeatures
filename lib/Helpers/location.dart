import 'dart:convert';

import 'package:http/http.dart' as http;

const MAP_API_KEY='AIzaSyDeOEREIcOZKjc6Ff6iTb6h1kN1eCbD8jE';
class LocationHelper {
  static String generateLocationPreviewImage({double? latitude, double? longitude,}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=14&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$MAP_API_KEY';
  }
}