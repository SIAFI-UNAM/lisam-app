import 'package:shared_preferences/shared_preferences.dart';

class UserPreferencesService {
  static const String _showStartedPageKey = 'themeIsDark';

  static late SharedPreferences _prefs;

  static Future initUserPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool get showStartedPage =>
      _prefs.getBool(_showStartedPageKey) ?? true;
  static set showStartedPage(bool t) => _prefs.setBool(_showStartedPageKey, t);
}
