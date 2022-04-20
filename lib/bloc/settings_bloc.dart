/// This is the bloc file for the user's settings.
/// 
/// A [BehaviorSubject] stream is used to pass data to the UI layer.

import 'package:rxdart/rxdart.dart';
import 'package:very_good_weather/repository/settings_repository.dart';

class SettingsBloc {
  static var _instance = SettingsBloc._internal();

  factory SettingsBloc() => _instance;

  static void reset() {
    _instance.dispose();
    _instance = SettingsBloc._internal();
  }

  SettingsBloc._internal();

  final _repository = SettingsRepository();

  final BehaviorSubject<bool> _isMetricSubject = BehaviorSubject<bool>();

  Stream<bool> get isMetricStream => _isMetricSubject.stream;

  // When an app is started for the first time, initialize a default value.
  init() async {
    if (await _repository.getIsMetric() == null) {
      _repository.setIsMetric(true);
    }
  }

  Future<bool> getIsMetric() {
    return _repository.getIsMetric().then((isMetric) {
      _isMetricSubject.sink.add(isMetric!);
      return isMetric;
    });
  }

  Future<void> setIsMetric(bool value) async {
    _isMetricSubject.sink.add(value);
    _repository.setIsMetric(value);
  }

  void dispose() {
    _isMetricSubject.close();
  }
}
