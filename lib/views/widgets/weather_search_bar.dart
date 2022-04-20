/// This is a search bar that allows the user to type in a location to be searched.
/// 
/// Technically, the user is allowed to search for a blank location, which results
/// in an error.

import 'package:flutter/material.dart';
import 'package:very_good_weather/bloc/weather_bloc.dart';

class WeatherSearchBar extends StatelessWidget {
  const WeatherSearchBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.70,
      child: TextField(
        decoration: const InputDecoration( 
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2.0)
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2.0)
          ),
          hintText: 'Search Weather',
          hintStyle: TextStyle(color: Colors.white),
          prefixIcon: Icon(Icons.search, color: Colors.white)
        ),
        onSubmitted: (value) {
          WeatherBloc().getWeather(value);
        },
      )
    );
  }
}