import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:simple_calculator/main.dart';
import 'package:simple_calculator/providers/shape_provider.dart';
import 'package:simple_calculator/widgets/calc_button.dart';

class CalcDrawer extends ConsumerWidget {
  const CalcDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyColors myColors = Theme.of(context).extension<MyColors>()!;
    final double borderRadius = ref.watch(shapeProvider);

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
                padding: const EdgeInsets.symmetric(horizontal: 12),
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
                                const CalcDr(),
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
                          int idx =
                              ShapeProvider.radiusesList.indexOf(borderRadius) +
                              1;
                          if (idx >= ShapeProvider.radiusesList.length) {
                            idx = 0;
                          }

                          ref
                              .read(shapeProvider.notifier)
                              .changeBorderRadius(
                                ShapeProvider.radiusesList[idx],
                              );
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
