// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../shared/services/theme/theme_app_state.dart';

class AppState {
  final ThemeAppState themeState;

  AppState({required this.themeState});

  static AppState empty() => AppState(themeState: ThemeAppState.initState());

  AppState copyWith({
    ThemeAppState? themeState,
  }) {
    return AppState(
      themeState: themeState ?? this.themeState,
    );
  }
}
