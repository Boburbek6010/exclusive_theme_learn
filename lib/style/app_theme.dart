import 'dart:ui';

import 'package:exclusive_theme_learn/style/color_schema.dart';
import 'package:flutter/material.dart';

@immutable
final class AppTheme {
  final ThemeMode mode;
  final ThemeData dark;
  final ThemeData light;

  AppTheme({required this.mode})
      : dark = ThemeData(
          brightness: Brightness.dark,
          colorScheme: darkColorScheme,
        ),
        light = ThemeData(
          brightness: Brightness.light,
          colorScheme: lightColorScheme,
        );

  ThemeData switchTheme() {
    switch (mode) {
      case ThemeMode.light:
        return light;
      case ThemeMode.dark:
        return dark;
      case ThemeMode.system:
        return PlatformDispatcher.instance.platformBrightness == Brightness.dark ? dark : light;
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is AppTheme && runtimeType == other.runtimeType && mode == other.mode;

  @override
  int get hashCode => mode.hashCode;
}
