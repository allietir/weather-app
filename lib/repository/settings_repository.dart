/// [SharedPreferences] is used to store the user's settings so that it persists
/// on the device. In this case, there is only one setting--metric or imperial units.

import 'package:shared_preferences/shared_preferences.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

const String isMetric = "isMetric";

class SettingsRepository {
  Future<void> setIsMetric(bool value) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setBool(isMetric, value);
  }

  Future<bool?> getIsMetric() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getBool(isMetric);
  }
}