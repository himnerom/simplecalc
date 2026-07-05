import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'package:simple_calculator/services/shared_preferences_service.dart';

/// Useful only to categorise/describe the theme
enum ThemeCategory {
  gray, // Has only a shade of gray as primary color
  simple, // Has only one primary color
  double, // Has primary & secondary colors
  special, // Other weird patterns
}

/// List o' themes
class ThemesService with ChangeNotifier {
  static String defaultFont = 'JetBrainsMono';
  static ThemePalette defaultTheme = themesList.first;

  ThemesService() {
    final int? idx = SharedPreferencesService.getInt(
      SharedPreferencesService.themeIndexKey,
    );
    if (idx != null) {
      _theme = themesList[idx];
    }

    final String? grey = SharedPreferencesService.getString(
      SharedPreferencesService.brightnessGreyKey,
    );
    _greyShade = Brightness.values.firstWhereOrNull(
      (e) => e.toString() == grey,
    );

    notifyListeners();
  }

  /// Provider related
  ThemePalette get theme => _theme;
  ThemePalette _theme = defaultTheme;

  Brightness? get greyShade => _greyShade;
  Brightness? _greyShade;

  void setTheme(int index, [Brightness? greyShade]) {
    _theme = themesList[index];
    _greyShade = greyShade;

    SharedPreferencesService.setValue(
      SharedPreferencesService.themeIndexKey,
      index,
    );
    SharedPreferencesService.setValue(
      SharedPreferencesService.brightnessGreyKey,
      greyShade.toString(),
    );

    notifyListeners();
  }

  static const lightBackground = Color(0xffefefef);
  static Color darkBackground = Color.lerp(
    Color(0xff141414),
    Color(0xff666666),
    0.2,
  )!;

  static const List<ThemePalette> themesList = [
    /// Bluwy
    ThemePalette(
      themeName: 'Bluwy',
      themeCategory: ThemeCategory.simple,
      primaryColor: Color(0xff6d9eeb),
      primarySwatch: Colors.blue,
      brightness: Brightness.light,
      titleColor: Color(0xff1c4587),
      backgroundColor: Color(0xffc9daf8),
      modalColor: Color(0xff1155cc),
      resTextColor: Color(0xff000000),
      resBorderColor: Color(0xffa4c2f4),
      resBackgroundColor: Color(0xffffffff),
      btn1TextColor: Color(0xff1c4587),
      btn1BackgroundColor: Color(0xffa4c2f4),
      btn2TextColor: Color(0xffffffff),
      btn2BackgroundColor: Color(0xff6d9eeb),
      secondaryColor: Color(0xff6d9eeb),
    ),

    /// Violet
    ThemePalette(
      themeName: 'Violet',
      themeCategory: ThemeCategory.simple,
      primaryColor: Color(0xff8e7cc3),
      primarySwatch: Colors.deepPurple,
      brightness: Brightness.light,
      titleColor: Color(0xff20124d),
      backgroundColor: Color(0xffd9d2e9),
      modalColor: Color(0xff351c75),
      resTextColor: Color(0xff000000),
      resBorderColor: Color(0xffb4a7d6),
      resBackgroundColor: Color(0xffffffff),
      btn1TextColor: Color(0xff20124d),
      btn1BackgroundColor: Color(0xffb4a7d6),
      btn2TextColor: Color(0xffffffff),
      btn2BackgroundColor: Color(0xff8e7cc3),
      secondaryColor: Color(0xff8e7cc3),
    ),

    /// Sakura
    ThemePalette(
      themeName: 'Sakura',
      themeCategory: ThemeCategory.simple,
      primaryColor: Color(0xfff06292),
      primarySwatch: Colors.pink,
      brightness: Brightness.light,
      titleColor: Color(0xff880e4f),
      backgroundColor: Color(0xfffce4ec),
      modalColor: Color(0xffc2185b),
      resTextColor: Color(0xff000000),
      resBorderColor: Color(0xfff8bbd0),
      resBackgroundColor: Color(0xffffffff),
      btn1TextColor: Color(0xff880e4f),
      btn1BackgroundColor: Color(0xfff8bbd0),
      btn2TextColor: Color(0xffffffff),
      btn2BackgroundColor: Color(0xfff06292),
      secondaryColor: Color(0xfff06292),
    ),

    /// Leechi
    ThemePalette(
      themeName: 'Leechi',
      themeCategory: ThemeCategory.simple,
      primaryColor: Color(0xffe06666),
      primarySwatch: Colors.red,
      brightness: Brightness.light,
      titleColor: Color(0xff660000),
      backgroundColor: Color(0xfff4cccc),
      modalColor: Color(0xff990000),
      resTextColor: Color(0xff000000),
      resBorderColor: Color(0xffea9999),
      resBackgroundColor: Color(0xffffffff),
      btn1TextColor: Color(0xff660000),
      btn1BackgroundColor: Color(0xffea9999),
      btn2TextColor: Color(0xffffffff),
      btn2BackgroundColor: Color(0xffe06666),
      secondaryColor: Color(0xffe06666),
    ),

    /// Orinji
    ThemePalette(
      themeName: 'Orinji',
      themeCategory: ThemeCategory.simple,
      primaryColor: Color(0xfff6b26b),
      primarySwatch: Colors.orange,
      brightness: Brightness.light,
      titleColor: Color(0xff783f04),
      backgroundColor: Color(0xfffce5cd),
      modalColor: Color(0xffb45f06),
      resTextColor: Color(0xff000000),
      resBorderColor: Color(0xfff9cb9c),
      resBackgroundColor: Color(0xffffffff),
      btn1TextColor: Color(0xff783f04),
      btn1BackgroundColor: Color(0xfff9cb9c),
      btn2TextColor: Color(0xffffffff),
      btn2BackgroundColor: Color(0xfff6b26b),
      secondaryColor: Color(0xfff6b26b),
    ),

    /// Banannaah
    ThemePalette(
      themeName: 'Banannaah',
      themeCategory: ThemeCategory.simple,
      primaryColor: Color(0xffffd966),
      primarySwatch: Colors.yellow,
      brightness: Brightness.light,
      titleColor: Color(0xff7f6000),
      backgroundColor: Color(0xfffff2cc),
      modalColor: Color(0xffbf9000),
      resTextColor: Color(0xff000000),
      resBorderColor: Color(0xffffe599),
      resBackgroundColor: Color(0xffffffff),
      btn1TextColor: Color(0xff7f6000),
      btn1BackgroundColor: Color(0xffffe599),
      btn2TextColor: Color(0xff434343),
      btn2BackgroundColor: Color(0xffffd966),
      secondaryColor: Color(0xffffd966),
    ),

    /// Greenery
    ThemePalette(
      themeName: 'Greenery',
      themeCategory: ThemeCategory.simple,
      primaryColor: Color(0xff8bbf73),
      primarySwatch: Colors.green,
      brightness: Brightness.light,
      titleColor: Color(0xff274e13),
      backgroundColor: Color(0xffd9ead3),
      modalColor: Color(0xff38761d),
      resTextColor: Color(0xff000000),
      resBorderColor: Color(0xffb6d7a8),
      resBackgroundColor: Color(0xffffffff),
      btn1TextColor: Color(0xff274e13),
      btn1BackgroundColor: Color(0xffb6d7a8),
      btn2TextColor: Color(0xffffffff),
      btn2BackgroundColor: Color(0xff8bbf73),
      secondaryColor: Color(0xff8bbf73),
    ),

    /// Beary
    ThemePalette(
      themeName: 'Beary',
      themeCategory: ThemeCategory.simple,
      primaryColor: Color(0xff8d6e63),
      primarySwatch: Colors.brown,
      brightness: Brightness.light,
      titleColor: Color(0xff3e2723),
      backgroundColor: Color(0xffefebe9),
      modalColor: Color(0xff5d4037),
      resTextColor: Color(0xff000000),
      resBorderColor: Color(0xffd7ccc8),
      resBackgroundColor: Color(0xffffffff),
      btn1TextColor: Color(0xff3e2723),
      btn1BackgroundColor: Color(0xffd7ccc8),
      btn2TextColor: Color(0xffffffff),
      btn2BackgroundColor: Color(0xff8d6e63),
      secondaryColor: Color(0xff8d6e63),
    ),

    /// Nothingness
    ThemePalette(
      themeName: 'Nothingness',
      themeCategory: ThemeCategory.gray,
      primaryColor: Color(0xfff3f3f3),
      primarySwatch: Colors.grey,
      brightness: Brightness.light,
      titleColor: Color(0xff000000),
      backgroundColor: Color(0xffffffff),
      modalColor: Color(0xff000000),
      resTextColor: Color(0xff000000),
      resBorderColor: Color(0xffeeeeee),
      resBackgroundColor: Color(0xffffffff),
      btn1TextColor: Color(0xff434343),
      btn1BackgroundColor: Color(0xfff9f9f9),
      btn2TextColor: Color(0xff000000),
      btn2BackgroundColor: Color(0xfff3f3f3),
      secondaryColor: Color(0xfff3f3f3),
    ),

    /// Whigrey
    ThemePalette(
      themeName: 'Whigrey',
      themeCategory: ThemeCategory.gray,
      primaryColor: Color(0xffb7b7b7),
      primarySwatch: Colors.blueGrey,
      brightness: Brightness.light,
      titleColor: Color(0xff434343),
      backgroundColor: Color(0xffefefef),
      modalColor: Color(0xff666666),
      resTextColor: Color(0xff000000),
      resBorderColor: Color(0xffd9d9d9),
      resBackgroundColor: Color(0xffffffff),
      btn1TextColor: Color(0xff434343),
      btn1BackgroundColor: Color(0xffd9d9d9),
      btn2TextColor: Color(0xffffffff),
      btn2BackgroundColor: Color(0xffb7b7b7),
      secondaryColor: Color(0xffb7b7b7),
    ),

    /// Dargrey
    ThemePalette(
      themeName: 'Dargrey',
      themeCategory: ThemeCategory.gray,
      primaryColor: Color(0xffb7b7b7),
      primarySwatch: Colors.grey,
      brightness: Brightness.dark,
      titleColor: Color(0xffffffff),
      backgroundColor: Color(0xff666666),
      modalColor: Color(0xffefefef),
      resTextColor: Color(0xffffffff),
      resBorderColor: Color(0xff666666),
      resBackgroundColor: Color(0xff434343),
      btn1TextColor: Color(0xffffffff),
      btn1BackgroundColor: Color(0xff999999),
      btn2TextColor: Color(0xff434343),
      btn2BackgroundColor: Color(0xffb7b7b7),
      secondaryColor: Color(0xffb7b7b7),
    ),

    /// VoidContrast
    ThemePalette(
      themeName: 'VoidContrast',
      themeCategory: ThemeCategory.gray,
      primaryColor: Color(0xff434343),
      primarySwatch: Colors.grey,
      brightness: Brightness.light,
      titleColor: Color(0xff434343),
      backgroundColor: Color(0xffefefef),
      modalColor: Color(0xff666666),
      resTextColor: Color(0xff000000),
      resBorderColor: Color(0xff999999),
      resBackgroundColor: Color(0xffffffff),
      btn1TextColor: Color(0xffffffff),
      btn1BackgroundColor: Color(0xff000000),
      btn2TextColor: Color(0xffffffff),
      btn2BackgroundColor: Color(0xff000000),
      secondaryColor: Color(0xff434343),
    ),

    /// Blubewy
    ThemePalette(
      themeName: 'Blubewy',
      themeCategory: ThemeCategory.double,
      primaryColor: Color(0xff6d9eeb),
      primarySwatch: Colors.blue,
      brightness: Brightness.light,
      titleColor: Color(0xff1c4587),
      backgroundColor: Color(0xffc9daf8),
      modalColor: Color(0xff1155cc),
      resTextColor: Color(0xff000000),
      resBorderColor: Color(0xffa4c2f4),
      resBackgroundColor: Color(0xffffffff),
      btn1TextColor: Color(0xff20124d),
      btn1BackgroundColor: Color(0xffb4a7d6),
      btn2TextColor: Color(0xffffffff),
      btn2BackgroundColor: Color(0xff6d9eeb),
      secondaryColor: Color(0xff8e7cc3),
    ),

    /// GrapFrut
    ThemePalette(
      themeName: 'GrapFrut',
      themeCategory: ThemeCategory.double,
      primaryColor: Color(0xfff6b26b),
      primarySwatch: Colors.orange,
      brightness: Brightness.light,
      titleColor: Color(0xff783f04),
      backgroundColor: Color(0xfffce5cd),
      modalColor: Color(0xffb45f06),
      resTextColor: Color(0xff000000),
      resBorderColor: Color(0xfff9cb9c),
      resBackgroundColor: Color(0xffffffff),
      btn1TextColor: Color(0xff660000),
      btn1BackgroundColor: Color(0xffea9999),
      btn2TextColor: Color(0xffffffff),
      btn2BackgroundColor: Color(0xfff6b26b),
      secondaryColor: Color(0xffe06666),
    ),

    /// Carott
    ThemePalette(
      themeName: 'Carott',
      themeCategory: ThemeCategory.double,
      primaryColor: Color(0xff8bbf73),
      primarySwatch: Colors.green,
      brightness: Brightness.light,
      titleColor: Color(0xff274e13),
      backgroundColor: Color(0xffd9ead3),
      modalColor: Color(0xff38761d),
      resTextColor: Color(0xff000000),
      resBorderColor: Color(0xffb6d7a8),
      resBackgroundColor: Color(0xffffffff),
      btn1TextColor: Color(0xff783f04),
      btn1BackgroundColor: Color(0xfff9cb9c),
      btn2TextColor: Color(0xffffffff),
      btn2BackgroundColor: Color(0xff8bbf73),
      secondaryColor: Color(0xfff6b26b),
    ),

    /// Sontri
    ThemePalette(
      themeName: 'Sontri',
      themeCategory: ThemeCategory.double,
      primaryColor: Color(0xffffd966),
      primarySwatch: Colors.yellow,
      brightness: Brightness.light,
      titleColor: Color(0xff274e13),
      backgroundColor: Color(0xffb6d7a8),
      modalColor: Color(0xff38761d),
      resTextColor: Color(0xff000000),
      resBorderColor: Color(0xff8bbf73),
      resBackgroundColor: Color(0xffffffff),
      btn1TextColor: Color(0xff7f6000),
      btn1BackgroundColor: Color(0xffffe599),
      btn2TextColor: Color(0xff434343),
      btn2BackgroundColor: Color(0xffffd966),
      secondaryColor: Color(0xff8bbf73),
    ),

    /// Seaside
    ThemePalette(
      themeName: 'Seaside',
      themeCategory: ThemeCategory.double,
      primaryColor: Color(0xff6d9eeb),
      primarySwatch: Colors.blue,
      brightness: Brightness.light,
      titleColor: Color(0xff1c4587),
      backgroundColor: Color(0xffc9daf8),
      modalColor: Color(0xff1155cc),
      resTextColor: Color(0xff000000),
      resBorderColor: Color(0xffa4c2f4),
      resBackgroundColor: Color(0xffffffff),
      btn1TextColor: Color(0xff7f6000),
      btn1BackgroundColor: Color(0xffffe599),
      btn2TextColor: Color(0xffffffff),
      btn2BackgroundColor: Color(0xff6d9eeb),
      secondaryColor: Color(0xffffd966),
    ),

    /// Honey
    ThemePalette(
      themeName: 'Honiey',
      themeCategory: ThemeCategory.double,
      primaryColor: Color(0xffffd966),
      primarySwatch: Colors.yellow,
      brightness: Brightness.light,
      titleColor: Color(0xff7f6000),
      backgroundColor: Color(0xfffff2cc),
      modalColor: Color(0xffbf9000),
      resTextColor: Color(0xff000000),
      resBorderColor: Color(0xffffe599),
      resBackgroundColor: Color(0xffffffff),
      btn1TextColor: Color(0xff783f04),
      btn1BackgroundColor: Color(0xfff9cb9c),
      btn2TextColor: Color(0xff434343),
      btn2BackgroundColor: Color(0xffffd966),
      secondaryColor: Color(0xfff6b26b),
    ),

    /// Whatamelon
    ThemePalette(
      themeName: 'Whatamelon',
      themeCategory: ThemeCategory.double,
      primaryColor: Color(0xff8bbf73),
      primarySwatch: Colors.green,
      brightness: Brightness.light,
      titleColor: Color(0xff274e13),
      backgroundColor: Color(0xffd9ead3),
      modalColor: Color(0xff38761d),
      resTextColor: Color(0xff000000),
      resBorderColor: Color(0xffb6d7a8),
      resBackgroundColor: Color(0xffffffff),
      btn1TextColor: Color(0xff660000),
      btn1BackgroundColor: Color(0xffea9999),
      btn2TextColor: Color(0xffffffff),
      btn2BackgroundColor: Color(0xffe06666),
      secondaryColor: Color(0xffe06666),
    ),

    /// Chocomint
    ThemePalette(
      themeName: 'Chocomint',
      themeCategory: ThemeCategory.double,
      primaryColor: Color(0xff8d6e63),
      primarySwatch: Colors.brown,
      brightness: Brightness.light,
      titleColor: Color(0xff3e2723),
      backgroundColor: Color(0xffefebe9),
      modalColor: Color(0xff5d4037),
      resTextColor: Color(0xff000000),
      resBorderColor: Color(0xffd7ccc8),
      resBackgroundColor: Color(0xffffffff),
      btn1TextColor: Color(0xff274e13),
      btn1BackgroundColor: Color(0xffb6d7a8),
      btn2TextColor: Color(0xffffffff),
      btn2BackgroundColor: Color(0xff8d6e63),
      secondaryColor: Color(0xff8bbf73),
    ),

    /// Downut
    ThemePalette(
      themeName: 'Downut',
      themeCategory: ThemeCategory.double,
      primaryColor: Color(0xfff06292),
      primarySwatch: Colors.pink,
      brightness: Brightness.light,
      titleColor: Color(0xff880e4f),
      backgroundColor: Color(0xfffce4ec),
      modalColor: Color(0xffc2185b),
      resTextColor: Color(0xff000000),
      resBorderColor: Color(0xfff8bbd0),
      resBackgroundColor: Color(0xffffffff),
      btn1TextColor: Color(0xff7f6000),
      btn1BackgroundColor: Color(0xffffe599),
      btn2TextColor: Color(0xffffffff),
      btn2BackgroundColor: Color(0xfff06292),
      secondaryColor: Color(0xffffd966),
    ),

    /// SimpleRainbow
    ThemePalette(
      themeName: 'SimpleRainbow',
      themeCategory: ThemeCategory.special,
      primaryColor: Color(0xff434343),
      primarySwatch: Colors.grey,
      brightness: Brightness.light,
      titleColor: Color(0xff434343),
      backgroundColor: Color(0xffefefef),
      modalColor: Color(0xff666666),
      resTextColor: Color(0xff000000),
      resBorderColor: Color(0xff999999),
      resBackgroundColor: Color(0xffffffff),
      btn1TextColor: Color(0xffffffff),
      btn1BackgroundColor: Color(0xff000000),
      btn2TextColor: Color(0xffffffff),
      btn2BackgroundColor: Color(0xff000000),
      secondaryColor: Color(0xff434343),
    ),
  ];

  /// Colors used for the rainbowTheme
  static const List<Color> rainbowColors = [
    Color(0xfff87171),
    Color(0xfffb923c),
    Color(0xfffbbf24),
    Color(0xfffacc15),
    Color(0xffa3e635),
    Color(0xff4ade80),
    Color(0xff34d399),
    Color(0xff2dd4bf),
    Color(0xff22d3ee),
    Color(0xff38bdf8),
    Color(0xff60a5fa),
    Color(0xff818cf8),
    Color(0xffa78bfa),
    Color(0xffc084fc),
    Color(0xffe879f9),
    Color(0xfff472b6),
    Color(0xfffb7185),
  ];
}

/// Basic app ThemeData object attributes extension
@immutable
class ThemePalette {
  const ThemePalette({
    required this.themeName,
    required this.themeCategory,
    required this.primaryColor,
    required this.primarySwatch,
    required this.brightness,
    required this.titleColor,
    required this.backgroundColor,
    required this.modalColor,
    required this.resTextColor,
    required this.resBorderColor,
    required this.resBackgroundColor,
    required this.btn1TextColor,
    required this.btn1BackgroundColor,
    required this.btn2TextColor,
    required this.btn2BackgroundColor,
    required this.secondaryColor,
  });

  final String themeName;
  final ThemeCategory themeCategory;

  final Color primaryColor;
  final MaterialColor primarySwatch;
  final Brightness brightness;

  final Color titleColor;
  final Color backgroundColor;
  final Color modalColor;

  final Color resTextColor;
  final Color resBorderColor;
  final Color resBackgroundColor;

  final Color btn1TextColor;
  final Color btn1BackgroundColor;

  final Color btn2TextColor;
  final Color btn2BackgroundColor;

  final Color secondaryColor;
}
