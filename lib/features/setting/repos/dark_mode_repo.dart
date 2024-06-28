import 'package:shared_preferences/shared_preferences.dart';

class DarkModeRepo {
  static const String _isDarkMode = 'isDarkMode';

  final SharedPreferences _preferences;

  DarkModeRepo(this._preferences);

  Future<void> setDarked(bool value) async {
    _preferences.setBool(_isDarkMode, value);
  }

  bool isDarkMode() {
    return _preferences.getBool(_isDarkMode) ?? false;
  }
}
