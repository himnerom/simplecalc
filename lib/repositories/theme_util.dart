import 'package:flutter/material.dart';

/// List o' themes
class ThemeUtil {
  static String defaultFont = 'JetBrainsMono';

  static List<ThemeData> themesList = [
    /// Bluwy
    ThemeData(
      extensions: const <MyColors>[
        MyColors(
          themeName: 'Bluwy',
          themeCategory: ThemeCategory.simple,
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
        ),
      ],
      fontFamily: defaultFont,
      primaryColor: const Color(0xff6d9eeb),
      primarySwatch: Colors.blue,
      brightness: Brightness.light,
    ),

    /// Violet
    ThemeData(
      extensions: const <MyColors>[
        MyColors(
          themeName: 'Violet',
          themeCategory: ThemeCategory.simple,
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
        ),
      ],
      fontFamily: defaultFont,
      primaryColor: const Color(0xff8e7cc3),
      primarySwatch: Colors.deepPurple,
      brightness: Brightness.light,
    ),

    /// Redz
    ThemeData(
      extensions: const <MyColors>[
        MyColors(
          themeName: 'Redz',
          themeCategory: ThemeCategory.simple,
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
        ),
      ],
      fontFamily: defaultFont,
      primaryColor: const Color(0xffe06666),
      primarySwatch: Colors.red,
      brightness: Brightness.light,
    ),

    /// Orinji
    ThemeData(
      extensions: const <MyColors>[
        MyColors(
          themeName: 'Orinji',
          themeCategory: ThemeCategory.simple,
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
        ),
      ],
      fontFamily: defaultFont,
      primaryColor: const Color(0xfff6b26b),
      primarySwatch: Colors.orange,
      brightness: Brightness.light,
    ),

    /// Banannaah
    ThemeData(
      extensions: const <MyColors>[
        MyColors(
          themeName: 'Banannaah',
          themeCategory: ThemeCategory.simple,
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
        ),
      ],
      fontFamily: defaultFont,
      primaryColor: const Color(0xffffd966),
      primarySwatch: Colors.yellow,
      brightness: Brightness.light,
    ),

    /// Greenery
    ThemeData(
      extensions: const <MyColors>[
        MyColors(
          themeName: 'Greenery',
          themeCategory: ThemeCategory.simple,
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
        ),
      ],
      fontFamily: defaultFont,
      primaryColor: const Color(0xff8bbf73),
      primarySwatch: Colors.green,
      brightness: Brightness.light,
    ),

    /// VoidContrast
    ThemeData(
      extensions: const <MyColors>[
        MyColors(
          themeName: 'VoidContrast',
          themeCategory: ThemeCategory.special,
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
        ),
      ],
      fontFamily: defaultFont,
      primaryColor: const Color(0xff434343),
      primarySwatch: Colors.grey,
      brightness: Brightness.light,
    ),

    /// Dargrey
    ThemeData(
      extensions: const <MyColors>[
        MyColors(
          themeName: 'Dargrey',
          themeCategory: ThemeCategory.gray,
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
        ),
      ],
      fontFamily: defaultFont,
      primaryColor: const Color(0xffb7b7b7),
      primarySwatch: Colors.grey,
      brightness: Brightness.dark,
    ),

    /// Whigrey
    ThemeData(
      extensions: const <MyColors>[
        MyColors(
          themeName: 'Whigrey',
          themeCategory: ThemeCategory.gray,
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
        ),
      ],
      fontFamily: defaultFont,
      primaryColor: const Color(0xffb7b7b7),
      primarySwatch: Colors.blueGrey,
      brightness: Brightness.light,
    ),

    /// Nothingness
    ThemeData(
      extensions: const <MyColors>[
        MyColors(
          themeName: 'Nothingness',
          themeCategory: ThemeCategory.gray,
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
        ),
      ],
      fontFamily: defaultFont,
      primaryColor: const Color(0xfff3f3f3),
      primarySwatch: Colors.grey,
      brightness: Brightness.light,
    ),

    /// Blubewy
    ThemeData(
      extensions: const <MyColors>[
        MyColors(
          themeName: 'Blubewy',
          themeCategory: ThemeCategory.double,
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
        ),
      ],
      fontFamily: defaultFont,
      primaryColor: const Color(0xff6d9eeb),
      primarySwatch: Colors.blue,
      brightness: Brightness.light,
    ),

    /// GrapFrut
    ThemeData(
      extensions: const <MyColors>[
        MyColors(
          themeName: 'GrapFrut',
          themeCategory: ThemeCategory.double,
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
        ),
      ],
      fontFamily: defaultFont,
      primaryColor: const Color(0xfff6b26b),
      primarySwatch: Colors.orange,
      brightness: Brightness.light,
    ),

    /// Carott
    ThemeData(
      extensions: const <MyColors>[
        MyColors(
          themeName: 'Carott',
          themeCategory: ThemeCategory.double,
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
        ),
      ],
      fontFamily: defaultFont,
      primaryColor: const Color(0xff8bbf73),
      primarySwatch: Colors.green,
      brightness: Brightness.light,
    ),

    /// SimpleRainbow
    ThemeData(
      extensions: const <MyColors>[
        MyColors(
          themeName: 'SimpleRainbow',
          themeCategory: ThemeCategory.special,
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
        ),
      ],
      fontFamily: defaultFont,
      primaryColor: const Color(0xff434343),
      primarySwatch: Colors.grey,
      brightness: Brightness.light,
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

/// Useful only to categorise/describe the theme
enum ThemeCategory {
  gray, // Has only a shade of gray as primary color
  simple, // Has only one primary color
  double, // Has primary & secondary colors
  special, // Other weird patterns
}

/// Basic app ThemeData object attributes extension
@immutable
class MyColors extends ThemeExtension<MyColors> {
  const MyColors({
    required this.themeName,
    required this.themeCategory,
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
  });

  final String themeName;
  final ThemeCategory themeCategory;

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

  @override
  MyColors copyWith({
    String? themeName,
    ThemeCategory? themeCategory,
    Color? titleColor,
    Color? backgroundColor,
    Color? modalColor,
    Color? resTextColor,
    Color? resBorderColor,
    Color? resBackgroundColor,
    Color? btn1TextColor,
    Color? btn1BackgroundColor,
    Color? btn2TextColor,
    Color? btn2BackgroundColor,
  }) {
    return MyColors(
      themeName: themeName ?? this.themeName,
      themeCategory: themeCategory ?? this.themeCategory,
      titleColor: titleColor ?? this.titleColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      modalColor: modalColor ?? this.modalColor,
      resTextColor: resTextColor ?? this.resTextColor,
      resBorderColor: resBorderColor ?? this.resBorderColor,
      resBackgroundColor: resBackgroundColor ?? this.resBackgroundColor,
      btn1TextColor: btn1TextColor ?? this.btn1TextColor,
      btn1BackgroundColor: btn1BackgroundColor ?? this.btn1BackgroundColor,
      btn2TextColor: btn2TextColor ?? this.btn2TextColor,
      btn2BackgroundColor: btn2BackgroundColor ?? this.btn2BackgroundColor,
    );
  }

  @override
  MyColors lerp(ThemeExtension<MyColors>? other, double t) {
    if (other is! MyColors) {
      return this;
    }
    return this;
  }
}
