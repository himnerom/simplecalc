import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CalcButton extends StatelessWidget {
  const CalcButton({
    Key? key,
    required this.text,
    required this.textColor,
    this.fontSize = 24,
    required this.backgroundColor,
    required this.onTap,
    this.mainAxisCellCount = 1,
    this.crossAxisCellCount = 1,
  }) : super(key: key);

  final String text;
  final Color textColor;
  final double fontSize;
  final Color backgroundColor;
  final GestureTapCallback? onTap;

  final int mainAxisCellCount;
  final int crossAxisCellCount;

  @override
  Widget build(BuildContext context) {
    return StaggeredGridTile.count(
      mainAxisCellCount: mainAxisCellCount,
      crossAxisCellCount: crossAxisCellCount,
      child: Card(
        color: backgroundColor,
        shadowColor: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColor,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
