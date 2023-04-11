import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:simple_calculator/repositories/theme_util.dart';

class CalcResult extends StatelessWidget {
  const CalcResult({
    Key? key,
    required this.result,
  }) : super(key: key);

  final double result;

  @override
  Widget build(BuildContext context) {
    MyColors myColors = Theme.of(context).extension<MyColors>()!;

    return StaggeredGridTile.count(
      mainAxisCellCount: 1,
      crossAxisCellCount: 4,
      child: Card(
        color: myColors.resBackgroundColor,
        shadowColor: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3),
          side: BorderSide(
            color: myColors.resBorderColor,
            width: 4,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Text(
              result.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: myColors.resTextColor,
                fontSize: 26,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
