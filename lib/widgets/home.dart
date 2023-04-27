import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:simple_calculator/services/calculator_service.dart';
import 'package:simple_calculator/services/theme_service.dart';
import 'package:simple_calculator/widgets/buttons/calc_text_button.dart';
import 'package:simple_calculator/widgets/calc_layout.dart';
import 'package:simple_calculator/widgets/calc_result.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  static const double itemSpacing = 8;

  @override
  Widget build(BuildContext context) {
    MyColors myColors = Theme.of(context).extension<MyColors>()!;
    int i = 0;

    return CalcLayout(
      scaffoldKey: scaffoldKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          /// Row 1
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: CalcResult(
                    result: context.watch<CalculatorService>().currentDisplay,
                  ),
                ),
                const SizedBox(width: itemSpacing),
                Expanded(
                  child: CalcTextButton(
                    text: '三',
                    textColor: myColors.titleColor,
                    backgroundColor: Colors.transparent,
                    onTap: () => scaffoldKey.currentState?.openEndDrawer(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: itemSpacing),

          /// Row 2
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CalcTextButton(
                    text: '7',
                    textColor: myColors.btn1TextColor,
                    backgroundColor:
                        myColors.themeCategory == ThemeCategory.special
                            ? ThemeUtil.rainbowColors[i++]
                            : myColors.btn1BackgroundColor,
                    onTap: () =>
                        context.read<CalculatorService>().pushDigit('7'),
                  ),
                ),
                const SizedBox(width: itemSpacing),
                Expanded(
                  child: CalcTextButton(
                    text: '8',
                    textColor: myColors.btn1TextColor,
                    backgroundColor:
                        myColors.themeCategory == ThemeCategory.special
                            ? ThemeUtil.rainbowColors[i++]
                            : myColors.btn1BackgroundColor,
                    onTap: () =>
                        context.read<CalculatorService>().pushDigit('8'),
                  ),
                ),
                const SizedBox(width: itemSpacing),
                Expanded(
                  child: CalcTextButton(
                    text: '9',
                    textColor: myColors.btn1TextColor,
                    backgroundColor:
                        myColors.themeCategory == ThemeCategory.special
                            ? ThemeUtil.rainbowColors[i++]
                            : myColors.btn1BackgroundColor,
                    onTap: () =>
                        context.read<CalculatorService>().pushDigit('9'),
                  ),
                ),
                const SizedBox(width: itemSpacing),
                Expanded(
                  flex: 2,
                  child: CalcTextButton(
                    text: 'AC',
                    textColor: myColors.btn1TextColor,
                    backgroundColor:
                        myColors.themeCategory == ThemeCategory.special
                            ? ThemeUtil.rainbowColors[i++]
                            : myColors.btn1BackgroundColor,
                    onTap: () => context.read<CalculatorService>().pushReset(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: itemSpacing),

          /// Row 3
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CalcTextButton(
                    text: '4',
                    textColor: myColors.btn1TextColor,
                    backgroundColor:
                        myColors.themeCategory == ThemeCategory.special
                            ? ThemeUtil.rainbowColors[i++]
                            : myColors.btn1BackgroundColor,
                    onTap: () =>
                        context.read<CalculatorService>().pushDigit('4'),
                  ),
                ),
                const SizedBox(width: itemSpacing),
                Expanded(
                  child: CalcTextButton(
                    text: '5',
                    textColor: myColors.btn1TextColor,
                    backgroundColor:
                        myColors.themeCategory == ThemeCategory.special
                            ? ThemeUtil.rainbowColors[i++]
                            : myColors.btn1BackgroundColor,
                    onTap: () =>
                        context.read<CalculatorService>().pushDigit('5'),
                  ),
                ),
                const SizedBox(width: itemSpacing),
                Expanded(
                  child: CalcTextButton(
                    text: '6',
                    textColor: myColors.btn1TextColor,
                    backgroundColor:
                        myColors.themeCategory == ThemeCategory.special
                            ? ThemeUtil.rainbowColors[i++]
                            : myColors.btn1BackgroundColor,
                    onTap: () =>
                        context.read<CalculatorService>().pushDigit('6'),
                  ),
                ),
                const SizedBox(width: itemSpacing),
                Expanded(
                  child: CalcTextButton(
                    text: '+',
                    textColor: myColors.btn2TextColor,
                    backgroundColor:
                        myColors.themeCategory == ThemeCategory.special
                            ? ThemeUtil.rainbowColors[i++]
                            : myColors.btn2BackgroundColor,
                    onTap: () =>
                        context.read<CalculatorService>().pushOperator('+'),
                  ),
                ),
                const SizedBox(width: itemSpacing),
                Expanded(
                  child: CalcTextButton(
                    text: '-',
                    textColor: myColors.btn2TextColor,
                    backgroundColor:
                        myColors.themeCategory == ThemeCategory.special
                            ? ThemeUtil.rainbowColors[i++]
                            : myColors.btn2BackgroundColor,
                    onTap: () =>
                        context.read<CalculatorService>().pushOperator('-'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: itemSpacing),

          /// Row 4
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CalcTextButton(
                    text: '1',
                    textColor: myColors.btn1TextColor,
                    backgroundColor:
                        myColors.themeCategory == ThemeCategory.special
                            ? ThemeUtil.rainbowColors[i++]
                            : myColors.btn1BackgroundColor,
                    onTap: () =>
                        context.read<CalculatorService>().pushDigit('1'),
                  ),
                ),
                const SizedBox(width: itemSpacing),
                Expanded(
                  child: CalcTextButton(
                    text: '2',
                    textColor: myColors.btn1TextColor,
                    backgroundColor:
                        myColors.themeCategory == ThemeCategory.special
                            ? ThemeUtil.rainbowColors[i++]
                            : myColors.btn1BackgroundColor,
                    onTap: () =>
                        context.read<CalculatorService>().pushDigit('2'),
                  ),
                ),
                const SizedBox(width: itemSpacing),
                Expanded(
                  child: CalcTextButton(
                    text: '3',
                    textColor: myColors.btn1TextColor,
                    backgroundColor:
                        myColors.themeCategory == ThemeCategory.special
                            ? ThemeUtil.rainbowColors[i++]
                            : myColors.btn1BackgroundColor,
                    onTap: () =>
                        context.read<CalculatorService>().pushDigit('3'),
                  ),
                ),
                const SizedBox(width: itemSpacing),
                Expanded(
                  child: CalcTextButton(
                    text: '✕',
                    textColor: myColors.btn2TextColor,
                    backgroundColor:
                        myColors.themeCategory == ThemeCategory.special
                            ? ThemeUtil.rainbowColors[i++]
                            : myColors.btn2BackgroundColor,
                    onTap: () =>
                        context.read<CalculatorService>().pushOperator('*'),
                  ),
                ),
                const SizedBox(width: itemSpacing),
                Expanded(
                  child: CalcTextButton(
                    text: '÷',
                    textColor: myColors.btn2TextColor,
                    backgroundColor:
                        myColors.themeCategory == ThemeCategory.special
                            ? ThemeUtil.rainbowColors[i++]
                            : myColors.btn2BackgroundColor,
                    onTap: () =>
                        context.read<CalculatorService>().pushOperator('/'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: itemSpacing),

          /// Row 5
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: CalcTextButton(
                    text: '0',
                    textColor: myColors.btn1TextColor,
                    backgroundColor:
                        myColors.themeCategory == ThemeCategory.special
                            ? ThemeUtil.rainbowColors[i++]
                            : myColors.btn1BackgroundColor,
                    onTap: () =>
                        context.read<CalculatorService>().pushDigit('0'),
                  ),
                ),
                const SizedBox(width: itemSpacing),
                Expanded(
                  child: CalcTextButton(
                    text: '.',
                    textColor: myColors.btn1TextColor,
                    backgroundColor:
                        myColors.themeCategory == ThemeCategory.special
                            ? ThemeUtil.rainbowColors[i++]
                            : myColors.btn1BackgroundColor,
                    onTap: () => context.read<CalculatorService>().pushComma(),
                  ),
                ),
                const SizedBox(width: itemSpacing),
                Expanded(
                  flex: 2,
                  child: CalcTextButton(
                    text: '=',
                    textColor: myColors.btn1TextColor,
                    backgroundColor:
                        myColors.themeCategory == ThemeCategory.special
                            ? ThemeUtil.rainbowColors[i++]
                            : myColors.btn1BackgroundColor,
                    onTap: () => context.read<CalculatorService>().pushEqual(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
