/// This widget shows when the user has just started the app and there is
/// no data passed to the Weather stream yet.

import 'package:flutter/material.dart';

class WeatherWelcome extends StatelessWidget {
  const WeatherWelcome({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Divider(height: 40.0, color: Colors.transparent),
        Text(
          'Hello!',
          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
        ),
        Divider(height: 20.0, color: Colors.transparent),
        Image(
          image: AssetImage('images/lc.png'),
          height: 100,
          width: 100,
        ),
        Divider(height: 20.0, color: Colors.transparent),
        Text(
          'Enter a location to search the weather!',
          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}