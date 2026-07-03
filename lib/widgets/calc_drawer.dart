import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:simple_calculator/services/shape_service.dart';
import 'package:simple_calculator/services/themes_service.dart';
import 'package:simple_calculator/widgets/calc_button.dart';
import 'package:simple_calculator/widgets/calc_drawer_theme.dart';

class CalcDrawer extends StatelessWidget {
  const CalcDrawer({super.key});

  static const List<double> shapesList = [
    2, // Solid
    12, // Round
    42, // Circle
    // null, // Hidden
  ];

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemesService>().theme;
    final double borderRadius = context.watch<ShapeService>().borderRadius;

    return Drawer(
      backgroundColor: theme.backgroundColor,
      width: 88,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              const SizedBox(height: 24),
              Expanded(
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Text(
                    'SimpleCalc',
                    softWrap: false,
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                      color: theme.titleColor,
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: CalcButton(
                    backgroundColor: theme.btn1BackgroundColor,
                    borderColor: theme.btn1BackgroundColor,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            const CalcDrawerTheme(),
                      );
                    },
                    child: Card(
                      color: theme.btn2BackgroundColor,
                      shadowColor: Colors.transparent,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(borderRadius),
                        side: BorderSide(
                          color: theme.btn2BackgroundColor,
                          width: 4,
                        ),
                      ),
                      child: Container(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: CalcButton(
                    backgroundColor: theme.resBackgroundColor,
                    borderColor: theme.btn1BackgroundColor,
                    onTap: () {
                      int idx = shapesList.indexOf(borderRadius) + 1;
                      if (idx >= shapesList.length) {
                        idx = 0;
                      }

                      context.read<ShapeService>().changeBorderRadius(
                        shapesList[idx],
                      );
                    },
                    child: Card(
                      color: theme.resBackgroundColor,
                      shadowColor: Colors.transparent,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(borderRadius),
                        side: BorderSide(color: theme.resTextColor, width: 4),
                      ),
                      child: Container(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
