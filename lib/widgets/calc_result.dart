import 'package:flutter/material.dart';

import 'package:simple_calculator/services/theme_service.dart';

class CalcResult extends StatelessWidget {
  const CalcResult({
    Key? key,
    required this.result,
  }) : super(key: key);

  final String result;

  @override
  Widget build(BuildContext context) {
    MyColors myColors = Theme.of(context).extension<MyColors>()!;

    return Card(
      margin: EdgeInsets.zero,
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
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Align(
          alignment: Alignment.centerRight,
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              result,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: myColors.resTextColor,
                fontSize: 28,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
