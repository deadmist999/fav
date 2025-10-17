enum ThemeType {
  light,
  dark,
  system;

  static bool isInRange(int index) =>
      index >= 0 && index < ThemeType.values.length;
}
