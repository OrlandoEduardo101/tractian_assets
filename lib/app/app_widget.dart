import 'dart:developer';

import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:tractian_assets/app/interactor/app_action.dart';
import 'package:tractian_assets/app/interactor/app_atom.dart';
import 'package:tractian_assets/app/injector.dart';

import 'interactor/app_state.dart';
import 'routers.dart';
import 'shared/services/theme/theme_app_state.dart';
import 'shared/services/theme/theme_app_store.dart';
// import 'routes.dart.bak';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final ThemeAppStore themeStore = injector.get<ThemeAppStore>();
  @override
  void initState() {
    super.initState();
    getThemeApp();
    themeStore.addListener(() {
      updateTheme(themeStore.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    Color selectedColor = const Color(0xff121322);
    Brightness selectedBrightness = Brightness.light;
    AppState state = context.select(() => appState.value);

    log(state.toString());

    return MaterialApp.router(
      title: 'Tractian',
      // debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
        seedColor: selectedColor,
        brightness: selectedBrightness,
      )),
      themeMode: state.themeState.theme == ThemeEnum.lightTheme ? ThemeMode.light : ThemeMode.dark,
      routerConfig: Routers.router,
    );
  }
}
