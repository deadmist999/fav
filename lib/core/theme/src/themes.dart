import 'package:fav/core/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

import 'app_theme.dart';

const defaultFontFamily = 'Roboto';

final darkTheme = AppTheme(
  isDark: true,
  theme: ThemeData(
    useMaterial3: false,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.dark,
    fontFamily: defaultFontFamily,
  ),
  backgroundColor: AppColors.dark,
  textColor: AppColors.light,
  favoriteColor: AppColors.amber,
  starColor: AppColors.light.withValues(alpha: 0.60),
  titleColor: AppColors.light,
  primaryButtonColor: AppColors.amber,
  secondaryButtonColor: AppColors.light,
  primaryButtonTextColor: AppColors.dark,
  secondaryButtonTextColor: AppColors.light,
  searchColor: AppColors.darkGray,
);

final lightTheme = AppTheme(
  isDark: false,
  theme: ThemeData(
    useMaterial3: false,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.light,
    fontFamily: defaultFontFamily,
  ),
  backgroundColor: AppColors.light,
  textColor: AppColors.dark,
  favoriteColor: AppColors.amber,
  starColor: AppColors.light.withValues(alpha: 0.60),
  titleColor: AppColors.light,
  primaryButtonColor: AppColors.amber,
  secondaryButtonColor: AppColors.dark,
  primaryButtonTextColor: AppColors.dark,
  secondaryButtonTextColor: AppColors.dark,
  searchColor: AppColors.lightGray,
);

Brightness get platformBrightness {
  final flutterView = WidgetsBinding.instance.platformDispatcher.views.single;
  return MediaQueryData.fromView(flutterView).platformBrightness;
}
