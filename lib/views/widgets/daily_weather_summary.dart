/// This widget shows a summary of the weather for a day. This includes
/// the day of the week, an image representing the weather state for that
/// day, and the high and low temperatures for that day.

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:very_good_weather/helpers/unit_conversion_helper.dart';
import 'package:very_good_weather/model/daily_weather_forecast.dart';

class DailyWeatherSummary extends StatelessWidget {  
  const DailyWeatherSummary({ Key? key, required this.dailyWeather, required this.isMetric}) : super(key: key);

  final DailyWeatherForecast dailyWeather;
  final bool isMetric;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(DateFormat('E').format(dailyWeather.date)),
        Image(
          image: AssetImage("images/${dailyWeather.weatherStateAbbreviation}.png"),
          height: 50,
          width: 50,
        ),
        isMetric
          ? Text(dailyWeather.maxTemperature.round().toString() + '°C / ' + dailyWeather.minTemperature.round().toString() + '°C')
          : Text(
              UnitConversionHelper.convertCelsiusToFahrenheit(dailyWeather.maxTemperature).round().toString() + '°F / ' 
              + UnitConversionHelper.convertCelsiusToFahrenheit(dailyWeather.minTemperature).round().toString() + '°F'
            ),
      ],
    );
  }
}