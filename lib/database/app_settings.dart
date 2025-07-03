import 'package:shared_preferences/shared_preferences.dart';

class AppSettings {
  static const _keyNotifications = 'notifications_enabled';
  static const _keyDistanceUnit = 'distance_unit';
  static const _keyUiLanguage = 'locale';
  final SharedPreferences _prefs;
  AppSettings(this._prefs);

  bool get notificationsEndabled => _prefs.getBool(_keyDistanceUnit) ?? true;
  set notificationsEndabled(bool value) =>
      _prefs.setBool(_keyNotifications, value);

  String get distaceUnit => _prefs.getString(_keyDistanceUnit) ?? 'metters';
  set distaceUnit(String value) => _prefs.setString(_keyDistanceUnit, value);

  String get uiLanguage => _prefs.getString(_keyUiLanguage) ?? 'en';
  set uiLanguage(String value) => _prefs.setString(_keyUiLanguage, value);
}
