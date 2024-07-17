import 'package:shared_preferences/shared_preferences.dart';

import '../theme/theme_app_state.dart';
import 'preferences_key_strings.dart';

class SharedPreferencesService {
  Future<void> saveThemeApp({required ThemeEnum theme}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(kThemePrefsKey, theme.name);
  }

  Future<String?> getThemeApp() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(kThemePrefsKey);
  }
}
