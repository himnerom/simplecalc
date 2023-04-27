import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:simple_calculator/services/shape_service.dart';

class CalcButton extends StatelessWidget {
  const CalcButton({
    Key? key,
    required this.backgroundColor,
    this.borderColor,
    required this.onTap,
    this.child,
  }) : super(key: key);

  final Color backgroundColor;
  final Color? borderColor;

  final GestureTapCallback? onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    double borderRadius = context.watch<ShapeService>().borderRadius;

    return Card(
      color: backgroundColor,
      shadowColor: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      shape: borderColor != null
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: BorderSide(
                color: borderColor!,
                width: 4,
              ),
            )
          : RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
      child: InkWell(
        splashFactory: InkRipple.splashFactory,
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
