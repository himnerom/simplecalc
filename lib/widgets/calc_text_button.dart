import 'package:flutter/material.dart';

import 'package:simple_calculator/widgets/calc_button.dart';

class CalcTextButton extends StatelessWidget {
  const CalcTextButton({
    super.key,
    required this.text,
    required this.textColor,
    required this.fontSize,
    this.backgroundColor,
    this.borderColor,
    this.pressed = false,
    required this.onTap,
  });

  final String text;
  final Color textColor;
  final double fontSize;
  final Color? backgroundColor;
  final Color? borderColor;

  /// Shows the button with its pressed effect, e.g. when the matching
  /// physical key was just typed on a keyboard.
  final bool pressed;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return CalcButton(
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      pressed: pressed,
      onTap: onTap,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w800,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
