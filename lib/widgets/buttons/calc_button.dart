import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CalcButton extends StatelessWidget {
  const CalcButton({
    Key? key,
    required this.backgroundColor,
    this.borderColor,
    this.mainAxisCellCount = 1,
    this.crossAxisCellCount = 1,
    required this.onTap,
    this.child,
  }) : super(key: key);

  final Color backgroundColor;
  final Color? borderColor;

  final int mainAxisCellCount;
  final int crossAxisCellCount;

  final GestureTapCallback? onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return StaggeredGridTile.count(
      mainAxisCellCount: mainAxisCellCount,
      crossAxisCellCount: crossAxisCellCount,
      child: Card(
        color: backgroundColor,
        shadowColor: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        shape: borderColor != null
            ? RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: borderColor!,
                  width: 3,
                ),
              )
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
