import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:simple_calculator/services/screen_service.dart';
import 'package:simple_calculator/services/shape_service.dart';
import 'package:simple_calculator/services/themes_service.dart';

class CalcButton extends StatelessWidget {
  const CalcButton({
    super.key,
    this.backgroundColor,
    this.borderColor,
    this.padding,
    required this.onTap,
    this.child,
  });

  final Color? backgroundColor;
  final Color? borderColor;
  final double? padding;
  final GestureTapCallback? onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemesService>().theme;
    final double borderRadius = context.watch<ShapeService>().borderRadius;
    final screen = ScreenService(context);

    return Card(
      color: backgroundColor,
      shadowColor: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      shape: borderColor != null
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: BorderSide(color: borderColor!, width: 4),
            )
          : RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
      child: InkWell(
        highlightColor: theme.resBackgroundColor.withOpacity(0.2),
        splashColor: theme.resBackgroundColor.withOpacity(0.2),
        splashFactory: InkRipple.splashFactory,
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(padding ?? screen.buttonPadding),
          child: Center(child: child),
        ),
      ),
    );
  }
}
