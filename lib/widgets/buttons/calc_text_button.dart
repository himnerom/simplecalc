import 'package:flutter/material.dart';

import 'package:simple_calculator/widgets/buttons/calc_button.dart';

class CalcTextButton extends StatelessWidget {
  const CalcTextButton({
    Key? key,
    required this.text,
    required this.textColor,
    this.fontSize = 24,
    required this.backgroundColor,
    this.borderColor,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final Color textColor;
  final double fontSize;
  final Color backgroundColor;
  final Color? borderColor;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return CalcButton(
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      onTap: onTap,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
