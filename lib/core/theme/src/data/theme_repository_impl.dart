import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import '../../theme.dart';

const _typeKey = 'themeType';
const _tag = 'Theme - ThemeRepositoryImpl';

class ThemeRepositoryImpl implements IThemeRepository {
  const ThemeRepositoryImpl(this._prefs);

  final SharedPreferences _prefs;

  @override
  ThemeType get themeType {
    try {
      final indexType = _prefs.getInt(_typeKey);

      if (indexType == null || !ThemeType.isInRange(indexType)) {
        return ThemeType.system;
      }

      return ThemeType.values[indexType];
    } catch (e, s) {
      log('Error retrieving theme type', error: e, stackTrace: s, name: _tag);

      return ThemeType.system;
    }
  }

  @override
  Future<void> setThemeType(ThemeType type) async {
    try {
      if (!ThemeType.isInRange(type.index)) return;

      await _prefs.setInt(_typeKey, type.index);
    } catch (e, s) {
      log('Error setting theme type', error: e, stackTrace: s, name: _tag);
    }
  }
}
