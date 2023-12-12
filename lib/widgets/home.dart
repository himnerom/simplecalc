import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:simple_calculator/services/calculator_service.dart';
import 'package:simple_calculator/services/screen_service.dart';
import 'package:simple_calculator/services/theme_service.dart';
import 'package:simple_calculator/widgets/buttons/calc_button.dart';
import 'package:simple_calculator/widgets/buttons/calc_text_button.dart';
import 'package:simple_calculator/widgets/calc_layout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  static const double itemSpacing = 10;
  static const double layoutPadding = 24;

  double itemFlexSize(double layoutSize, int flex) {
    return (layoutSize - (layoutPadding * 2) - (itemSpacing * 4)) *
            (0.2 * flex) +
        (itemSpacing * (flex - 1));
  }

  bool handleKeyPress(KeyEvent event) {
    if (event is KeyDownEvent) {
      context.read<CalculatorService>().push(event);
      if (kDebugMode) {
        print(event.physicalKey.usbHidUsage);
        print(event.logicalKey.keyId);
        print(event.character);
      }
    }
    return true;
  }

  @override
  void initState() {
    ServicesBinding.instance.keyboard.addHandler(handleKeyPress);
    super.initState();
  }

  @override
  void dispose() {
    ServicesBinding.instance.keyboard.removeHandler(handleKeyPress);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MyColors myColors = Theme.of(context).extension<MyColors>()!;
    double layoutSize = ScreenService.getLayoutSize(context);
    int i = 0;

    return CalcLayout(
      scaffoldKey: scaffoldKey,
      layoutSize: layoutSize,
      layoutPadding: layoutPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          /// Row 1
          Expanded(
            child: Row(
              children: [
                SizedBox(
                  width: itemFlexSize(layoutSize, 4),
                  child: Card(
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
                    child: InkWell(
                      splashFactory: NoSplash.splashFactory,
                      highlightColor: myColors.secondaryColor.withOpacity(0.1),
                      onLongPress: () {
                        Clipboard.setData(
                          ClipboardData(
                            text: context
                                .read<CalculatorService>()
                                .currentDisplay,
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: myColors.btn2BackgroundColor,
                            duration: const Duration(seconds: 2),
                            content: Padding(
                              padding: const EdgeInsets.all(4),
                              child: Icon(
                                Icons.assignment_turned_in_rounded,
                                color: myColors.btn2TextColor,
                                size: 30,
                              ),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              context.watch<CalculatorService>().currentDisplay,
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
                    ),
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
                const SizedBox(width: itemSpacing),
                Expanded(
                  child: CalcButton(
                    backgroundColor:
                        myColors.themeCategory == ThemeCategory.special
                            ? Colors.transparent
                            : myColors.btn1BackgroundColor,
                    onTap: () => context.read<CalculatorService>().pushRemove(),
                    child: Center(
                      child: Icon(
                        Icons.backspace_rounded,
                        color: myColors.themeCategory == ThemeCategory.special
                            ? myColors.modalColor
                            : myColors.btn1TextColor,
                        size: 22,
                      ),
                    ),
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
                SizedBox(
                  width: itemFlexSize(layoutSize, 2),
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
                SizedBox(
                  width: itemFlexSize(layoutSize, 2),
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
