/// This widget shows the current state of the weather for a location,
/// an image representing the current state, the current temperature in
/// that location, and the high and low temperatures in tht location for today.

import 'package:flutter/material.dart';
import 'package:very_good_weather/helpers/unit_conversion_helper.dart';
import 'package:very_good_weather/model/daily_weather_forecast.dart';

class CurrentWeatherState extends StatelessWidget {
  const CurrentWeatherState({ Key? key, required this.currentWeather, required this.isMetric}) : super(key: key);

  final DailyWeatherForecast currentWeather;
  final bool isMetric;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          currentWeather.weatherState,
          style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        const Divider(height: 10.0, color: Colors.transparent),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("images/${currentWeather.weatherStateAbbreviation}.png"),
              height: 100,
              width: 100,
            ),
            const VerticalDivider(width: 30.0, color: Colors.transparent),
            Text(
              isMetric 
                ? currentWeather.currentTemperature.round().toString() + '°C'
                : UnitConversionHelper.convertCelsiusToFahrenheit(currentWeather.currentTemperature).round().toString() + '°F',
              style:  const TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold)
            ),
            const VerticalDivider(width: 30.0, color: Colors.transparent),
            Column(
              children: [
                Text(
                  isMetric
                  ? 'High: ' + currentWeather.maxTemperature.round().toString() + '°C'
                  : 'High: ' + UnitConversionHelper.convertCelsiusToFahrenheit(currentWeather.maxTemperature).round().toString() + '°F',
                  style: const TextStyle(fontSize: 16.0)
                ),
                Text(
                  isMetric
                  ? 'Low: ' + currentWeather.minTemperature.round().toString() + '°C'
                  : 'Low: ' + UnitConversionHelper.convertCelsiusToFahrenheit(currentWeather.minTemperature).round().toString() + '°F',
                  style: const TextStyle(fontSize: 16.0)
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

}