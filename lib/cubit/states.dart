abstract class ThemeState {
  final bool isDarkTheme;

  ThemeState(this.isDarkTheme);
}

class LightThemeState extends ThemeState {
  LightThemeState() : super(false);
}

class DarkThemeState extends ThemeState {
  DarkThemeState() : super(true);
}
