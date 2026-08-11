import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';

import 'package:simple_calculator/home.dart';
import 'package:simple_calculator/services/calculator_service.dart';
import 'package:simple_calculator/services/screen_service.dart';
import 'package:simple_calculator/services/shape_service.dart';
import 'package:simple_calculator/services/shared_preferences_service.dart';
import 'package:simple_calculator/services/themes_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    SharedPreferencesService.init(),
    if (ScreenService.isDesktop) windowManager.ensureInitialized(),
  ]);

  /// Initialize window (desktop only)
  if (ScreenService.isDesktop) {
    final double w =
        SharedPreferencesService.getDouble(
          SharedPreferencesService.desktopWindowWidthKey,
        ) ??
        ScreenService.defaultDesktopWidth;
    final double h =
        SharedPreferencesService.getDouble(
          SharedPreferencesService.desktopWindowHeightKey,
        ) ??
        ScreenService.defaultDesktopHeight;

    WindowOptions windowOptions = WindowOptions(
      size: Size(w, h),
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.hidden,
      title: 'SimpleCalc.',
    );

    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ShapeService()),
        ChangeNotifierProvider(create: (_) => CalculatorService()),
        ChangeNotifierProvider(create: (_) => ThemesService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemesService>().theme;

    return MaterialApp(
      title: 'SimpleCalc',
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: theme.primaryColor,
        primarySwatch: theme.primarySwatch,
        brightness: theme.brightness,
        fontFamily: ThemesService.defaultFont,
      ),
    );
  }
}
