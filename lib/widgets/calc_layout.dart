import 'package:flutter/material.dart';

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

    return Scaffold(
      backgroundColor: myColors.backgroundColor,
      key: scaffoldKey,
      body: SafeArea(
        child: child,
      ),
      endDrawer: const CalcDrawer(),
    );
  }
}
