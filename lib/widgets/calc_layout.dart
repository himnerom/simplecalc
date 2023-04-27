import 'package:flutter/material.dart';

import 'package:simple_calculator/services/screen_service.dart';
import 'package:simple_calculator/services/theme_service.dart';
import 'package:simple_calculator/widgets/drawer/calc_drawer.dart';

class CalcLayout extends StatelessWidget {
  const CalcLayout({
    Key? key,
    required this.scaffoldKey,
    required this.child,
  }) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    MyColors myColors = Theme.of(context).extension<MyColors>()!;
    double layoutSize = ScreenService.getLayoutSize(context);

    return Scaffold(
      backgroundColor: myColors.backgroundColor,
      key: scaffoldKey,
      drawerEnableOpenDragGesture: false,
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: layoutSize,
              maxHeight: layoutSize,
            ),
            padding: const EdgeInsets.all(20),
            child: child,
          ),
        ),
      ),
      endDrawer: const CalcDrawer(),
    );
  }
}
