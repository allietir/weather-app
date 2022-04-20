/// This widget shows when an error is passed to the Weather stream. This usually occurs
/// when the API cannot find a location a user has tried to search for.
 
import 'package:flutter/material.dart';

class WeatherError extends StatelessWidget {
  const WeatherError({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Divider(height: 40.0, color: Colors.transparent),
        Text(
          'Oops!',
          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
        ),
        Divider(height: 20.0, color: Colors.transparent),
        Image(
          image: AssetImage('images/t.png'),
          height: 100,
          width: 100,
        ),
        Divider(height: 20.0, color: Colors.transparent),
        Text(
          'We could not access weather data for that location.',
          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}