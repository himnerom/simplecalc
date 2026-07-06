import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:simple_calculator/services/screen_service.dart';
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

    final screen = ScreenService(context);
    final double width = screen.layoutSize * 0.18;
    final double spacing = width * 0.275;

    return Drawer(
      backgroundColor: theme.backgroundColor,
      width: width,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              SizedBox(height: spacing),
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
                      fontSize: spacing * 1.3,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              SizedBox(height: spacing / 2),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: spacing / 2),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: CalcButton(
                    backgroundColor: theme.btn1BackgroundColor,
                    borderColor: theme.btn1BackgroundColor,
                    padding: spacing / 3,
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
                          width: spacing / 6,
                        ),
                      ),
                      child: Container(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: spacing / 2),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: spacing / 2),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: CalcButton(
                    backgroundColor: theme.resBackgroundColor,
                    borderColor: theme.btn1BackgroundColor,
                    padding: spacing / 3,
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
                        side: BorderSide(
                          color: theme.resTextColor,
                          width: spacing / 6,
                        ),
                      ),
                      child: Container(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: spacing / 2),
            ],
          ),
        ),
      ),
    );
  }
}
