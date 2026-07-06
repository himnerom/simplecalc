import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:simple_calculator/services/calculator_service.dart';
import 'package:simple_calculator/services/screen_service.dart';
import 'package:simple_calculator/services/themes_service.dart';
import 'package:simple_calculator/widgets/calc_button.dart';
import 'package:simple_calculator/widgets/calc_text_button.dart';
import 'package:simple_calculator/widgets/calc_layout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

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
    final ts = context.watch<ThemesService>();
    final theme = ts.theme;
    final greyShade = ts.greyShade;

    final screen = ScreenService(context);
    int i = 0;

    return CalcLayout(
      scaffoldKey: scaffoldKey,
      layoutSize: screen.layoutSize,
      layoutPadding: screen.layoutPadding,
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
                  width: screen.itemFlexSize(4),
                  child: Card(
                    margin: EdgeInsets.zero,
                    color: theme.resBackgroundColor,
                    shadowColor: Colors.transparent,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                      side: BorderSide(color: theme.resBorderColor, width: 4),
                    ),
                    child: InkWell(
                      splashFactory: NoSplash.splashFactory,
                      highlightColor: theme.secondaryColor.withOpacity(0.1),
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
                            backgroundColor: theme.btn2BackgroundColor,
                            duration: const Duration(seconds: 2),
                            content: Padding(
                              padding: const EdgeInsets.all(4),
                              child: Icon(
                                Icons.assignment_turned_in_rounded,
                                color: theme.btn2TextColor,
                                size: screen.baseFontSize * 1.25,
                              ),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: screen.buttonPadding * 20,
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              context.watch<CalculatorService>().currentDisplay,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: theme.resTextColor,
                                fontWeight: FontWeight.w800,
                                fontSize: screen.baseFontSize * 1.175,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: screen.itemSpacing),
                Expanded(
                  child: CalcTextButton(
                    text: '三',
                    textColor: greyShade == Brightness.dark
                        ? theme.backgroundColor
                        : theme.titleColor,
                    fontSize: screen.baseFontSize,
                    backgroundColor: Colors.transparent,
                    onTap: () => scaffoldKey.currentState?.openEndDrawer(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screen.itemSpacing),

          /// Row 2
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CalcTextButton(
                    text: '7',
                    textColor: theme.btn1TextColor,
                    fontSize: screen.baseFontSize,
                    backgroundColor:
                        theme.themeCategory == ThemeCategory.special
                        ? ThemesService.rainbowColors[i++]
                        : theme.btn1BackgroundColor,
                    onTap: () =>
                        context.read<CalculatorService>().pushDigit('7'),
                  ),
                ),
                SizedBox(width: screen.itemSpacing),
                Expanded(
                  child: CalcTextButton(
                    text: '8',
                    textColor: theme.btn1TextColor,
                    fontSize: screen.baseFontSize,
                    backgroundColor:
                        theme.themeCategory == ThemeCategory.special
                        ? ThemesService.rainbowColors[i++]
                        : theme.btn1BackgroundColor,
                    onTap: () =>
                        context.read<CalculatorService>().pushDigit('8'),
                  ),
                ),
                SizedBox(width: screen.itemSpacing),
                Expanded(
                  child: CalcTextButton(
                    text: '9',
                    textColor: theme.btn1TextColor,
                    fontSize: screen.baseFontSize,
                    backgroundColor:
                        theme.themeCategory == ThemeCategory.special
                        ? ThemesService.rainbowColors[i++]
                        : theme.btn1BackgroundColor,
                    onTap: () =>
                        context.read<CalculatorService>().pushDigit('9'),
                  ),
                ),
                SizedBox(width: screen.itemSpacing),
                Expanded(
                  child: CalcTextButton(
                    text: 'AC',
                    textColor: theme.btn1TextColor,
                    fontSize: screen.baseFontSize,
                    backgroundColor:
                        theme.themeCategory == ThemeCategory.special
                        ? ThemesService.rainbowColors[i++]
                        : theme.btn1BackgroundColor,
                    onTap: () => context.read<CalculatorService>().pushReset(),
                  ),
                ),
                SizedBox(width: screen.itemSpacing),
                Expanded(
                  child: CalcButton(
                    backgroundColor:
                        theme.themeCategory == ThemeCategory.special
                        ? Colors.transparent
                        : theme.btn1BackgroundColor,
                    onTap: () => context.read<CalculatorService>().pushRemove(),
                    child: Center(
                      child: Icon(
                        Icons.backspace_rounded,
                        color: theme.themeCategory == ThemeCategory.special
                            ? theme.modalColor
                            : theme.btn1TextColor,
                        size: screen.baseFontSize * 0.915,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screen.itemSpacing),

          /// Row 3
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CalcTextButton(
                    text: '4',
                    textColor: theme.btn1TextColor,
                    fontSize: screen.baseFontSize,
                    backgroundColor:
                        theme.themeCategory == ThemeCategory.special
                        ? ThemesService.rainbowColors[i++]
                        : theme.btn1BackgroundColor,
                    onTap: () =>
                        context.read<CalculatorService>().pushDigit('4'),
                  ),
                ),
                SizedBox(width: screen.itemSpacing),
                Expanded(
                  child: CalcTextButton(
                    text: '5',
                    textColor: theme.btn1TextColor,
                    fontSize: screen.baseFontSize,
                    backgroundColor:
                        theme.themeCategory == ThemeCategory.special
                        ? ThemesService.rainbowColors[i++]
                        : theme.btn1BackgroundColor,
                    onTap: () =>
                        context.read<CalculatorService>().pushDigit('5'),
                  ),
                ),
                SizedBox(width: screen.itemSpacing),
                Expanded(
                  child: CalcTextButton(
                    text: '6',
                    textColor: theme.btn1TextColor,
                    fontSize: screen.baseFontSize,
                    backgroundColor:
                        theme.themeCategory == ThemeCategory.special
                        ? ThemesService.rainbowColors[i++]
                        : theme.btn1BackgroundColor,
                    onTap: () =>
                        context.read<CalculatorService>().pushDigit('6'),
                  ),
                ),
                SizedBox(width: screen.itemSpacing),
                Expanded(
                  child: CalcTextButton(
                    text: '+',
                    textColor: theme.btn2TextColor,
                    fontSize: screen.baseFontSize,
                    backgroundColor:
                        theme.themeCategory == ThemeCategory.special
                        ? ThemesService.rainbowColors[i++]
                        : theme.btn2BackgroundColor,
                    onTap: () =>
                        context.read<CalculatorService>().pushOperator('+'),
                  ),
                ),
                SizedBox(width: screen.itemSpacing),
                Expanded(
                  child: CalcTextButton(
                    text: '-',
                    textColor: theme.btn2TextColor,
                    fontSize: screen.baseFontSize,
                    backgroundColor:
                        theme.themeCategory == ThemeCategory.special
                        ? ThemesService.rainbowColors[i++]
                        : theme.btn2BackgroundColor,
                    onTap: () =>
                        context.read<CalculatorService>().pushOperator('-'),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screen.itemSpacing),

          /// Row 4
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CalcTextButton(
                    text: '1',
                    textColor: theme.btn1TextColor,
                    fontSize: screen.baseFontSize,
                    backgroundColor:
                        theme.themeCategory == ThemeCategory.special
                        ? ThemesService.rainbowColors[i++]
                        : theme.btn1BackgroundColor,
                    onTap: () =>
                        context.read<CalculatorService>().pushDigit('1'),
                  ),
                ),
                SizedBox(width: screen.itemSpacing),
                Expanded(
                  child: CalcTextButton(
                    text: '2',
                    textColor: theme.btn1TextColor,
                    fontSize: screen.baseFontSize,
                    backgroundColor:
                        theme.themeCategory == ThemeCategory.special
                        ? ThemesService.rainbowColors[i++]
                        : theme.btn1BackgroundColor,
                    onTap: () =>
                        context.read<CalculatorService>().pushDigit('2'),
                  ),
                ),
                SizedBox(width: screen.itemSpacing),
                Expanded(
                  child: CalcTextButton(
                    text: '3',
                    textColor: theme.btn1TextColor,
                    fontSize: screen.baseFontSize,
                    backgroundColor:
                        theme.themeCategory == ThemeCategory.special
                        ? ThemesService.rainbowColors[i++]
                        : theme.btn1BackgroundColor,
                    onTap: () =>
                        context.read<CalculatorService>().pushDigit('3'),
                  ),
                ),
                SizedBox(width: screen.itemSpacing),
                Expanded(
                  child: CalcTextButton(
                    text: '✕',
                    textColor: theme.btn2TextColor,
                    fontSize: screen.baseFontSize,
                    backgroundColor:
                        theme.themeCategory == ThemeCategory.special
                        ? ThemesService.rainbowColors[i++]
                        : theme.btn2BackgroundColor,
                    onTap: () =>
                        context.read<CalculatorService>().pushOperator('*'),
                  ),
                ),
                SizedBox(width: screen.itemSpacing),
                Expanded(
                  child: CalcTextButton(
                    text: '÷',
                    textColor: theme.btn2TextColor,
                    fontSize: screen.baseFontSize,
                    backgroundColor:
                        theme.themeCategory == ThemeCategory.special
                        ? ThemesService.rainbowColors[i++]
                        : theme.btn2BackgroundColor,
                    onTap: () =>
                        context.read<CalculatorService>().pushOperator('/'),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screen.itemSpacing),

          /// Row 5
          Expanded(
            child: Row(
              children: [
                SizedBox(
                  width: screen.itemFlexSize(2),
                  child: CalcTextButton(
                    text: '0',
                    textColor: theme.btn1TextColor,
                    fontSize: screen.baseFontSize,
                    backgroundColor:
                        theme.themeCategory == ThemeCategory.special
                        ? ThemesService.rainbowColors[i++]
                        : theme.btn1BackgroundColor,
                    onTap: () =>
                        context.read<CalculatorService>().pushDigit('0'),
                  ),
                ),
                SizedBox(width: screen.itemSpacing),
                Expanded(
                  child: CalcTextButton(
                    text: '.',
                    textColor: theme.btn1TextColor,
                    fontSize: screen.baseFontSize,
                    backgroundColor:
                        theme.themeCategory == ThemeCategory.special
                        ? ThemesService.rainbowColors[i++]
                        : theme.btn1BackgroundColor,
                    onTap: () => context.read<CalculatorService>().pushComma(),
                  ),
                ),
                SizedBox(width: screen.itemSpacing),
                SizedBox(
                  width: screen.itemFlexSize(2),
                  child: CalcTextButton(
                    text: '=',
                    textColor: theme.btn1TextColor,
                    fontSize: screen.baseFontSize,
                    backgroundColor:
                        theme.themeCategory == ThemeCategory.special
                        ? ThemesService.rainbowColors[i++]
                        : theme.btn1BackgroundColor,
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
