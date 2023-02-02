import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:convert';

const MAP_API_KEY = 'AIzaSyDeOEREIcOZKjc6Ff6iTb6h1kN1eCbD8jE';

class LocationHelper {
  static String generateLocationPreviewImage({
    double? latitude,
    double? longitude,
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=14&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$MAP_API_KEY';
  }

  static Future<String> convertCordinatesToAddress(
      double lat, double long) async {
    final url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$long &key=$MAP_API_KEY";
    final response = await http.get(Uri.parse(url));
        print("JKJKJKJK");
    final address =
        json.decode(response.body)['results'][0]['formatted_address'];
    return address;
  }
}
