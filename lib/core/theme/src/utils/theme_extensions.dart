import 'package:fav/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension ProviderRefExtensions on WidgetRef {
  AppTheme get watchTheme => watch(themeProvider);
  AppTheme get readTheme => read(themeProvider);
}

extension ThemeTypeExtension on ThemeType {
  ThemeMode toThemeMode() {
    switch (this) {
      case ThemeType.light:
        return ThemeMode.light;
      case ThemeType.dark:
        return ThemeMode.dark;
      case ThemeType.system:
        return ThemeMode.system;
    }
  }
}

extension ThemeModeExtension on ThemeMode {
  ThemeType toThemeType() {
    switch (this) {
      case ThemeMode.light:
        return ThemeType.light;
      case ThemeMode.dark:
        return ThemeType.dark;
      case ThemeMode.system:
        return ThemeType.system;
    }
  }
}
