import 'package:tractian_assets/app/injector.dart';

import 'app_atom.dart';
import '../shared/services/theme/theme_app_state.dart';
import '../shared/services/theme/theme_app_store.dart';

Future<void> getThemeApp() async {
  final themeStore = injector.get<ThemeAppStore>();
  themeStore.getThemeApp();
}

void changeTheme(ThemeEnum theme) {
  final themeStore = injector.get<ThemeAppStore>();
  themeStore.changeTheme(theme);
}

void updateTheme(ThemeAppState themeState) {
  appState.value = appState.value.copyWith(themeState: themeState);
}
