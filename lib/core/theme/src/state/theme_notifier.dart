import 'package:fav/core/providers/data_providers.dart';
import 'package:fav/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier(this._repository) : super(ThemeMode.system) {
    _loadTheme();
  }

  final IThemeRepository _repository;

  void toggleTheme() {
    if (state == ThemeMode.dark) {
      state = ThemeMode.light;
    } else {
      state = ThemeMode.dark;
    }

    _repository.setThemeType(state.toThemeType());
  }

  void _loadTheme() => state = _repository.themeType.toThemeMode();
}

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>((
  ref,
) {
  final themeRepository = ref.watch(themeRepoitoryProvider);

  return ThemeNotifier(themeRepository);
});

final themeProvider = Provider<AppTheme>((ref) {
  final themeMode = ref.watch(themeNotifierProvider);

  switch (themeMode) {
    case ThemeMode.system:
      return platformBrightness == Brightness.dark ? darkTheme : lightTheme;
    case ThemeMode.light:
      return lightTheme;
    case ThemeMode.dark:
      return darkTheme;
  }
});
