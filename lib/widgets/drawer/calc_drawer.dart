import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:simple_calculator/services/shape_service.dart';
import 'package:simple_calculator/services/theme_service.dart';
import 'package:simple_calculator/widgets/buttons/calc_button.dart';
import 'package:simple_calculator/widgets/drawer/calc_drawer_theme.dart';

class CalcDrawer extends StatelessWidget {
  const CalcDrawer({
    Key? key,
  }) : super(key: key);

  static const List<double> shapesList = [
    2, // Solid
    12, // Round
    42, // Circle
    // null, // Hidden
  ];

  @override
  Widget build(BuildContext context) {
    MyColors myColors = Theme.of(context).extension<MyColors>()!;
    double borderRadius = context.watch<ShapeService>().borderRadius;

    return Drawer(
      backgroundColor: myColors.backgroundColor,
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
                      color: myColors.titleColor,
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                child: StaggeredGrid.count(
                  axisDirection: AxisDirection.down,
                  crossAxisCount: 1,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  children: [
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: CalcButton(
                        backgroundColor: myColors.btn1BackgroundColor,
                        borderColor: myColors.btn1BackgroundColor,
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                const CalcDrawerTheme(),
                          );
                        },
                        child: Card(
                          color: myColors.btn2BackgroundColor,
                          shadowColor: Colors.transparent,
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(borderRadius),
                            side: BorderSide(
                              color: myColors.btn2BackgroundColor,
                              width: 4,
                            ),
                          ),
                          child: Container(),
                        ),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: CalcButton(
                        backgroundColor: myColors.resBackgroundColor,
                        borderColor: myColors.btn1BackgroundColor,
                        onTap: () {
                          int idx = shapesList.indexOf(borderRadius) + 1;
                          if (idx >= shapesList.length) {
                            idx = 0;
                          }

                          context
                              .read<ShapeService>()
                              .changeBorderRadius(shapesList[idx]);
                        },
                        child: Card(
                          color: myColors.resBackgroundColor,
                          shadowColor: Colors.transparent,
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(borderRadius),
                            side: BorderSide(
                              color: myColors.resTextColor,
                              width: 4,
                            ),
                          ),
                          child: Container(),
                        ),
                      ),
                    ),
                  ],
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
