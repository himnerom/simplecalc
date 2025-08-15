import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:simple_calculator/main.dart';

class CalcButton extends ConsumerWidget {
  const CalcButton({
    super.key,
    required this.backgroundColor,
    this.borderColor,
    required this.onTap,
    this.child,
  });

  final Color backgroundColor;
  final Color? borderColor;

  final GestureTapCallback? onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double borderRadius = ref.watch(shapeProvider);

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
        splashFactory: InkRipple.splashFactory,
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(child: child),
        ),
      ),
    );
  }
}
