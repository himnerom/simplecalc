import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calculator/services/themes_service.dart';

// import 'package:simple_calculator/services/theme_service.dart';
import 'package:simple_calculator/widgets/calc_drawer.dart';

class CalcLayout extends StatelessWidget {
  const CalcLayout({
    super.key,
    required this.scaffoldKey,
    required this.layoutSize,
    required this.layoutPadding,
    required this.child,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;
  final double layoutSize;
  final double layoutPadding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final ts = context.watch<ThemesService>();

    return Scaffold(
      backgroundColor: ts.greyShade == null
          ? ts.theme.backgroundColor
          : (ts.greyShade == Brightness.light
                ? ThemesService.lightBackground
                : ThemesService.darkBackground),
      key: scaffoldKey,
      drawerEnableOpenDragGesture: false,
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: layoutSize,
              maxHeight: layoutSize,
            ),
            padding: EdgeInsets.all(layoutPadding),
            child: child,
          ),
        ),
      ),
      endDrawer: const CalcDrawer(),
    );
  }
}
