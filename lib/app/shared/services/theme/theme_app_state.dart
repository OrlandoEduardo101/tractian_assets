enum ThemeEnum { darkTheme, lightTheme }

class ThemeAppState {
  final ThemeEnum theme;

  const ThemeAppState({required this.theme});

  factory ThemeAppState.initState() {
    return const ThemeAppState(theme: ThemeEnum.lightTheme);
  }
}
