import 'package:fav/core/theme/theme.dart';
import 'package:fav/core/ui_kit/src/constants/app_font_size.dart';
import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme({
    required this.isDark,
    required this.theme,
    required this.backgroundColor,
    required this.textColor,
    required this.favoriteColor,
    required this.starColor,
    required this.titleColor,
    required this.primaryButtonColor,
    required this.secondaryButtonColor,
    required this.primaryButtonTextColor,
    required this.secondaryButtonTextColor,
    required this.searchColor,
  });

  final ThemeData theme;
  final bool isDark;
  final Color backgroundColor;
  final Color textColor;
  final Color favoriteColor;
  final Color starColor;
  final Color titleColor;
  final Color primaryButtonColor;
  final Color secondaryButtonColor;
  final Color primaryButtonTextColor;
  final Color secondaryButtonTextColor;
  final Color searchColor;
}

extension TextStylesExtension on AppTheme {
  TextStyle get base =>
      TextStyle(fontFamily: defaultFontFamily, color: textColor);

  TextStyle get text1 => base.copyWith(
    fontSize: AppFontSize.size30,
    fontWeight: FontWeight.bold,
    color: textColor,
  );

  TextStyle get text2 => base.copyWith(
    fontSize: AppFontSize.size18,
    fontWeight: FontWeight.w500,
    color: textColor,
  );

  TextStyle get text3 => base.copyWith(
    fontSize: AppFontSize.size14,
    fontWeight: FontWeight.normal,
    color: textColor,
  );

  TextStyle get text4 => base.copyWith(
    fontSize: AppFontSize.size12,
    fontWeight: FontWeight.w400,
    color: textColor,
  );

  TextStyle get text5 => base.copyWith(
    fontSize: AppFontSize.size10,
    fontWeight: FontWeight.w500,
    color: textColor,
  );

  TextStyle get buttonText =>
      base.copyWith(fontSize: AppFontSize.size16, fontWeight: FontWeight.w600);
}
