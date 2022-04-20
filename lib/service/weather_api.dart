/// This is the API file for [Weather] data.

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:very_good_weather/model/weather.dart';

class WeatherApi { 
  static const String baseUrl = 'https://www.metaweather.com';
  final http.Client _client = http.Client();

  /// Get the location Id based on a String search. 
  Future<int> getLocationId(String location) async {
    final response = await _client.get(Uri.parse('$baseUrl/api/location/search/?query=$location'));

    // If there are no results, throw an error.
    if (response.statusCode == 200 && response.body != "[]") {
      final parsedResponse = json.decode(response.body) as List;
      return parsedResponse.first['woeid'];
    } else {
      throw Exception('error calling getLocationId');
    }
  }

  /// Get weather data from location id.
  Future<Weather> getWeather(int locationId) async {
    final response = await _client.get(Uri.parse('$baseUrl/api/location/$locationId'));

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    }
    else {
      throw Exception('error calling getWeather');
    }
  }


}