import 'package:flutter/material.dart';
import 'package:very_good_weather/bloc/settings_bloc.dart';
import 'package:very_good_weather/views/screens/weather_home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SettingsBloc().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Very Good Weather',
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
          subtitle1: TextStyle(color: Colors.white),
          subtitle2: TextStyle(color: Colors.white),
        ),
      ),
      home: const WeatherHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


