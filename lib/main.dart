import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'package:simple_calculator/repositories/calculator_service.dart';
import 'package:simple_calculator/repositories/shape_service.dart';
import 'package:simple_calculator/repositories/theme_util.dart';
import 'package:simple_calculator/widgets/home.dart';

void main() async {
  await ThemeManager.initialise();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ShapeService()),
        ChangeNotifierProvider(create: (_) => CalculatorService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      themes: ThemeUtil.themesList,
      builder: (context, regularTheme, darkTheme, themeMode) => MaterialApp(
        /// First widget when opening the app
        home: const HomeScreen(),

        /// App config / debug config
        title: 'Simple Calc',
        debugShowCheckedModeBanner: false,
        // showPerformanceOverlay: true,
        // showSemanticsDebugger: true,

        /// Themes related stuff (blue theme by default)
        theme: regularTheme,
        themeMode: themeMode,
        darkTheme: darkTheme,
      ),
    );
  }
}
