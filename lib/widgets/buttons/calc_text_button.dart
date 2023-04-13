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
    this.mainAxisCellCount = 1,
    this.crossAxisCellCount = 1,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final Color textColor;
  final double fontSize;
  final Color backgroundColor;
  final Color? borderColor;
  final GestureTapCallback? onTap;

  final int mainAxisCellCount;
  final int crossAxisCellCount;

  @override
  Widget build(BuildContext context) {
    return CalcButton(
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      mainAxisCellCount: mainAxisCellCount,
      crossAxisCellCount: crossAxisCellCount,
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
