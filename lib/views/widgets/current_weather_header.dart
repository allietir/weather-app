/// This widget shows the location of the weather data returned from the search.
/// 
/// There is a [IconButton] that refreshes the data for the current location
/// returned from the search.

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:very_good_weather/bloc/weather_bloc.dart';
import 'package:very_good_weather/model/weather.dart';

class CurrentWeatherHeader extends StatelessWidget {
  const CurrentWeatherHeader({ Key? key, required this.currentWeather}) : super(key: key);

  final Weather currentWeather;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          currentWeather.location.toUpperCase(),
          style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
          maxLines: 2
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Last Updated ' + DateFormat('hh:mm a').format(currentWeather.lastUpdated).toString()),
            IconButton(
              icon: const Icon(Icons.refresh, color: Colors.white),
              padding: const EdgeInsets.all(4.0),
              constraints: const BoxConstraints(),
              onPressed: () {
                WeatherBloc().getWeather(currentWeather.location);
              },
            ),
          ],
        ),
      ],
    );
  }
}