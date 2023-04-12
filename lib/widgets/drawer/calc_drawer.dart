import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:simple_calculator/repositories/theme_util.dart';
import 'package:simple_calculator/widgets/buttons/calc_button.dart';
import 'package:simple_calculator/widgets/drawer/calc_drawer_theme.dart';

class CalcDrawer extends StatefulWidget {
  const CalcDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<CalcDrawer> createState() => _CalcDrawerState();
}

class _CalcDrawerState extends State<CalcDrawer> {
  Map<String, bool> activeSettings = {
    'theme': false,
    'shape': false,
    'history': false,
  };

  @override
  Widget build(BuildContext context) {
    MyColors myColors = Theme.of(context).extension<MyColors>()!;

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
                    CalcButton(
                      backgroundColor: myColors.btn1BackgroundColor,
                      borderColor: activeSettings['theme']!
                          ? myColors.btn1TextColor
                          : myColors.btn1BackgroundColor,
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
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(
                            color: myColors.btn2BackgroundColor,
                            width: 4,
                          ),
                        ),
                        child: Container(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // Container(
              //   padding: const EdgeInsets.symmetric(
              //     vertical: 16,
              //   ),
              //   child: Row(
              //     children: const [
              //       Expanded(
              //         child: Text(
              //           'Made with ♥ and concern\nby Himnerom Labs',
              //           textAlign: TextAlign.center,
              //           style: TextStyle(
              //             fontWeight: FontWeight.w800,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
