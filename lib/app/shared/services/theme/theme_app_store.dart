
import 'package:flutter/material.dart';
import '../local_storage/shared_preferences_service.dart';
import 'theme_app_state.dart';

class ThemeAppStore extends ValueNotifier<ThemeAppState> {
  final SharedPreferencesService prefs;

  ThemeAppStore(this.prefs) : super(ThemeAppState.initState());

  Future<void> getThemeApp() async {
    final themePrefs = await prefs.getThemeApp();
    ThemeEnum theme;

    themePrefs == ThemeEnum.darkTheme.name
        ? theme = ThemeEnum.darkTheme
        : theme = ThemeEnum.lightTheme;

    changeTheme(theme);
  }

  void changeTheme(ThemeEnum theme) {
    value = ThemeAppState(theme: theme);
    prefs.saveThemeApp(theme: theme);
  }
}
