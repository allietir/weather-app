/// This is the [Weather] class model.
/// 
/// I wanted this data structure to have the same structure as the data returned from
/// the API, hence why [DailyWeatherForecast] was created.
/// 
/// The factory constructor for this class only maps the data that will be used.

import 'package:very_good_weather/model/daily_weather_forecast.dart';

class Weather {
  final String location;
  final DateTime lastUpdated;
  final DateTime sunrise;
  final DateTime sunset;
  List<DailyWeatherForecast> dailyWeatherForecast;

  Weather({
    required this.location,
    required this.lastUpdated,
    required this.sunrise,
    required this.sunset,
    required this.dailyWeatherForecast
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      location: json['title'] as String,
      lastUpdated: DateTime.now(),
      sunrise: DateTime.parse(json['sun_rise']),
      sunset: DateTime.parse(json['sun_set']),
      dailyWeatherForecast: DailyWeatherForecast.fromJsonList(json['consolidated_weather'])
    );
  }
}
