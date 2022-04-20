/// This is the repository file for [Weather] data.

import 'package:very_good_weather/model/weather.dart';
import 'package:very_good_weather/service/weather_api.dart';

class WeatherRepository {
  final weatherApi = WeatherApi();

  Future<Weather> getWeather(String location) async {
    final int locationId = await weatherApi.getLocationId(location);
    return weatherApi.getWeather(locationId).then((Weather weather) {
      return weather;
    });
  }
}