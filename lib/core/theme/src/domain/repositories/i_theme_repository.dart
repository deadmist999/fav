import 'package:fav/core/theme/src/domain/entities/theme_type.dart';

abstract class IThemeRepository {
  ThemeType get themeType;
  Future<void> setThemeType(ThemeType type);
}
