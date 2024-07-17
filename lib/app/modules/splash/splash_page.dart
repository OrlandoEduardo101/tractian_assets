import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../shared/widgets/img/tractian_logo.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    Future.delayed(const Duration(seconds: 1)).whenComplete(() {
      context.go('/home');
    });

    return Scaffold(
      backgroundColor: colorScheme.primary,
      body: const Padding(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: TractianLogo(),
        ),
      ),
    );
  }
}
