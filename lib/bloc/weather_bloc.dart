/// This is the bloc file for [Weather] data.
///
/// A [BehaviorSubject] stream is used to pass data to the StreamBuilder on
/// WeatherHomePage.

import 'package:rxdart/rxdart.dart';
import 'package:very_good_weather/model/weather.dart';
import 'package:very_good_weather/repository/weather_repository.dart';

class WeatherBloc {
  static var _instance = WeatherBloc._internal();

  factory WeatherBloc() => _instance;

  static void reset() {
    _instance.dispose();
    _instance = WeatherBloc._internal();
  }

  WeatherBloc._internal();

  final _repository = WeatherRepository();

  final _weatherSubject = BehaviorSubject<Weather>();

  Stream<Weather> get weatherStream => _weatherSubject.stream;

  Future<Weather> getWeather(String location) {
    return _repository.getWeather(location).then((Weather weather) {
      _weatherSubject.sink.add(weather);
      return weather;
    }).catchError((error) {
      _weatherSubject.sink.addError(error);
    });
  }

  void dispose() {
    _weatherSubject.close();
  }
}
