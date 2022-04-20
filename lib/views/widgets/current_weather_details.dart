/// This widget shows additional details about the weather forecast for today:
/// humidity, windspeed, sunrise, and sunset.

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:very_good_weather/helpers/unit_conversion_helper.dart';
import 'package:very_good_weather/model/weather.dart';

class CurrentWeatherDetails extends StatelessWidget {
  const CurrentWeatherDetails({ Key? key, required this.currentWeather, required this.isMetric}) : super(key: key);
  
  final Weather currentWeather;
  final bool isMetric;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('humidity', style: TextStyle(fontSize: 16.0)),
              Text(currentWeather.dailyWeatherForecast[0].humidity.toString() + '%'),
            ],
          ),
          const VerticalDivider(
            width: 10.0,
            thickness: 1.0,
            color: Colors.white
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('windspeed', style: TextStyle(fontSize: 16.0)),
              isMetric 
                ? Text(UnitConversionHelper.convertMileToKilometer(currentWeather.dailyWeatherForecast[0].windSpeed).round().toString() + ' km/h')
                : Text(currentWeather.dailyWeatherForecast[0].windSpeed.round().toString() + ' mph'),
            ],
          ),
          const VerticalDivider(
            width: 10.0,
            thickness: 1.0,
            color: Colors.white
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('sunrise', style: TextStyle(fontSize: 16.0)),
              Text(DateFormat('hh:mm a').format(currentWeather.sunrise.toLocal())),
            ],
          ),
          const VerticalDivider(
            width: 10.0,
            thickness: 1.0,
            color: Colors.white
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('sunset', style: TextStyle(fontSize: 16.0)),
              Text(DateFormat('hh:mm a').format(currentWeather.sunset.toLocal())),
            ],
          ),
        ],
      ),
    );
  }
}