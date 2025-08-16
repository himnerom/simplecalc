import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:simple_calculator/calc.dart';
import 'package:simple_calculator/providers/calc_provider.dart';
import 'package:simple_calculator/providers/shape_provider.dart';
import 'package:simple_calculator/providers/theme_provider.dart';

final calcProvider = NotifierProvider<CalcProvider, String>(CalcProvider.new);
final shapeProvider = NotifierProvider<ShapeProvider, double>(
  ShapeProvider.new,
);
final themeProvider = NotifierProvider<ThemeProvider, ThemeData>(
  ThemeProvider.new,
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = ref.watch(themeProvider);

    return MaterialApp(
      title: 'Simple Calc',
      home: const CalcScreen(),
      theme: theme,

      /// Remove debug props
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      showSemanticsDebugger: false,
    );
  }
}
