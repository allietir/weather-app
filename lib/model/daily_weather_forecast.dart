/// This is the [DailyWeatherForecast] class model.
///
/// The factory constructor for this class only maps the data that will be used,
/// with the exception of date, which I originally planned on using but am leaving
/// it here because it can be useful for testing.

class DailyWeatherForecast {
  final DateTime date;
  final String weatherState;
  final String weatherStateAbbreviation;
  final double currentTemperature;
  final double minTemperature;
  final double maxTemperature;
  final double windSpeed;
  final int humidity;

  DailyWeatherForecast({
    required this.date,
    required this.weatherState,
    required this.weatherStateAbbreviation,
    required this.currentTemperature,
    required this.minTemperature,
    required this.maxTemperature,
    required this.windSpeed,
    required this.humidity,
  });

  factory DailyWeatherForecast.fromJson(Map<String, dynamic> json) {
    return DailyWeatherForecast(
      date: DateTime.parse(json['applicable_date']),
      weatherState: json['weather_state_name'] as String,
      weatherStateAbbreviation: json['weather_state_abbr'] as String,
      currentTemperature: json['the_temp'] as double,
      minTemperature: json['min_temp'] as double,
      maxTemperature: json['max_temp'] as double,
      windSpeed: json['wind_speed'] as double,
      humidity: json['humidity'] as int,
    );
  }

  static List<DailyWeatherForecast> fromJsonList(List json) {
    return json
        .map((jsonItem) => DailyWeatherForecast.fromJson(jsonItem))
        .toList();
  }
}
