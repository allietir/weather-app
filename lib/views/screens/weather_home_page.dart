/// To keep it simple, this is the only screen in the app. This screen consists of a
/// transparent [AppBar] so I could add a [PopupMenuButton] in the corner while giving
/// the app the appearance of taking the whole screen. 
/// 
/// The user can set their units to metric or imperial in the [PopupMenuButton]. The first time the
/// app is started, this defaults to metric. This screen sets up a [StreamSubscription] that listens
/// for a change in the settings, which will then trigger a rebuild of the widgets to show the change.
/// 
/// Using [WeatherSearchBar], the user can search a location for weather data. The data is returned
/// in a stream via a [StreamBuilder].
/// 
/// Note that the dailyWeatherForecast in [Weather] is accessed using bracket notation and is always
/// in the same order. This is because the API appears to always return that data chronologically. So
/// an assumption is being made that this will always be so.

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:very_good_weather/bloc/settings_bloc.dart';
import 'package:very_good_weather/bloc/weather_bloc.dart';
import 'package:very_good_weather/model/weather.dart';
import 'package:very_good_weather/views/widgets/current_weather_details.dart';
import 'package:very_good_weather/views/widgets/current_weather_header.dart';
import 'package:very_good_weather/views/widgets/current_weather_state.dart';
import 'package:very_good_weather/views/widgets/daily_weather_summary.dart';
import 'package:very_good_weather/views/widgets/weather_welcome.dart';
import 'package:very_good_weather/views/widgets/weather_error.dart';
import 'package:very_good_weather/views/widgets/weather_search_bar.dart';

class WeatherHomePage extends StatefulWidget {
  const WeatherHomePage({Key? key}) : super(key: key);

  @override
  State<WeatherHomePage> createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  bool? isMetric;

  late StreamSubscription<bool> isMetricSubscription;

  @override
  void initState() {
    super.initState();

    isMetricSubscription = SettingsBloc().isMetricStream.listen((bool value) {
      setState(() {
        isMetric = value;
      });
    });

    SettingsBloc().getIsMetric().then((value) {
      isMetric = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          PopupMenuButton(
            color: Colors.purple,
            elevation: 10.0,
            enabled: true,
            initialValue: isMetric,
            onSelected: (bool value) {
              setState(() {
                SettingsBloc().setIsMetric(value);
              });
            },
            itemBuilder: (context) => [
              const PopupMenuItem(child: Text('Show In Metric'), value: true),
              const PopupMenuItem(child: Text('Show In Imperial'), value: false)
            ]
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
            Colors.blue,
            Colors.pink
            ]
          )
        ),
        child: Center(
          child: Container(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Divider(height: 90.0, color: Colors.transparent),
                  const WeatherSearchBar(),
                  StreamBuilder(
                    stream: WeatherBloc().weatherStream,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        Weather weatherData = snapshot.data;
                        return Column(
                          children: [
                            const Divider(height: 40.0, color: Colors.transparent),
                            CurrentWeatherHeader(currentWeather: weatherData),
                            const Divider(height: 40.0, color: Colors.transparent),
                            CurrentWeatherState(currentWeather: weatherData.dailyWeatherForecast[0], isMetric: isMetric!),
                            const Divider(height: 40.0, color: Colors.transparent),
                            SizedBox(
                              height: 100,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  DailyWeatherSummary(dailyWeather: weatherData.dailyWeatherForecast[1], isMetric: isMetric!),
                                  const VerticalDivider(
                                    width: 30.0,
                                    thickness: 1.0,
                                    indent: 20.0,
                                    endIndent: 30.0,
                                    color: Colors.white
                                  ),
                                  DailyWeatherSummary(dailyWeather: weatherData.dailyWeatherForecast[2], isMetric: isMetric!),
                                  const VerticalDivider(
                                    width: 30.0,
                                    thickness: 1.0,
                                    indent: 20.0,
                                    endIndent: 30.0,
                                    color: Colors.white
                                  ),
                                  DailyWeatherSummary(dailyWeather: weatherData.dailyWeatherForecast[3], isMetric: isMetric!),
                                ],
                              ),
                            ),
                            const Divider(height: 40.0, color: Colors.transparent),
                            CurrentWeatherDetails(currentWeather: weatherData, isMetric: isMetric!),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return const WeatherError();
                      }
                      return const WeatherWelcome();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
    );
  }
}
