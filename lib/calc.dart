import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:simple_calculator/main.dart';

import 'package:simple_calculator/providers/theme_provider.dart';
import 'package:simple_calculator/widgets/calc_button.dart';
import 'package:simple_calculator/widgets/calc_drawer.dart';
import 'package:simple_calculator/widgets/calc_text_button.dart';

class CalcScreen extends ConsumerStatefulWidget {
  const CalcScreen({super.key});

  @override
  CalcScreenState createState() => CalcScreenState();
}

class CalcScreenState extends ConsumerState<CalcScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  static const double itemSpacing = 10;
  static const double layoutPadding = 24;

  static double itemFlexSize(double size, int flex) =>
      (size - (layoutPadding * 2) - (itemSpacing * 4)) * (0.2 * flex) +
      (itemSpacing * (flex - 1));

  bool handleKeyPress(KeyEvent event) {
    if (event is KeyDownEvent) {
      ref.read(calcProvider.notifier).push(event);

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
    final MediaQueryData mqd = MediaQuery.of(context);
    final double w = mqd.size.width - mqd.padding.left - mqd.padding.right;
    final double h = mqd.size.height - mqd.padding.top - mqd.padding.bottom;
    final double size = [600.0, h, w].reduce((a, b) => a < b ? a : b);

    final String calcDisplay = ref.watch(calcProvider);
    final ThemeData theme = ref.watch(themeProvider);
    final MyColors myColors = theme.extension<MyColors>()!;
    int i = 0;

    return Scaffold(
      backgroundColor: myColors.backgroundColor,
      key: _scaffoldKey,
      drawerEnableOpenDragGesture: false,
      endDrawer: const CalcDrawer(),
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: size, maxHeight: size),
            padding: EdgeInsets.all(layoutPadding),
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
                        width: itemFlexSize(size, 4),
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
                            highlightColor: myColors.secondaryColor.withOpacity(
                              0.1,
                            ),
                            onLongPress: () {
                              Clipboard.setData(
                                ClipboardData(text: calcDisplay),
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
                                    calcDisplay,
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
                          onTap: () =>
                              _scaffoldKey.currentState?.openEndDrawer(),
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
                              ? ThemeProvider.rainbowColors[i++]
                              : myColors.btn1BackgroundColor,
                          onTap: () =>
                              ref.read(calcProvider.notifier).pushDigit('7'),
                        ),
                      ),
                      const SizedBox(width: itemSpacing),
                      Expanded(
                        child: CalcTextButton(
                          text: '8',
                          textColor: myColors.btn1TextColor,
                          backgroundColor:
                              myColors.themeCategory == ThemeCategory.special
                              ? ThemeProvider.rainbowColors[i++]
                              : myColors.btn1BackgroundColor,
                          onTap: () =>
                              ref.read(calcProvider.notifier).pushDigit('8'),
                        ),
                      ),
                      const SizedBox(width: itemSpacing),
                      Expanded(
                        child: CalcTextButton(
                          text: '9',
                          textColor: myColors.btn1TextColor,
                          backgroundColor:
                              myColors.themeCategory == ThemeCategory.special
                              ? ThemeProvider.rainbowColors[i++]
                              : myColors.btn1BackgroundColor,
                          onTap: () =>
                              ref.read(calcProvider.notifier).pushDigit('9'),
                        ),
                      ),
                      const SizedBox(width: itemSpacing),
                      Expanded(
                        child: CalcTextButton(
                          text: 'AC',
                          textColor: myColors.btn1TextColor,
                          backgroundColor:
                              myColors.themeCategory == ThemeCategory.special
                              ? ThemeProvider.rainbowColors[i++]
                              : myColors.btn1BackgroundColor,
                          onTap: () =>
                              ref.read(calcProvider.notifier).pushReset(),
                        ),
                      ),
                      const SizedBox(width: itemSpacing),
                      Expanded(
                        child: CalcButton(
                          backgroundColor:
                              myColors.themeCategory == ThemeCategory.special
                              ? Colors.transparent
                              : myColors.btn1BackgroundColor,
                          onTap: () =>
                              ref.read(calcProvider.notifier).pushRemove(),
                          child: Center(
                            child: Icon(
                              Icons.backspace_rounded,
                              color:
                                  myColors.themeCategory ==
                                      ThemeCategory.special
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
                              ? ThemeProvider.rainbowColors[i++]
                              : myColors.btn1BackgroundColor,
                          onTap: () =>
                              ref.read(calcProvider.notifier).pushDigit('4'),
                        ),
                      ),
                      const SizedBox(width: itemSpacing),
                      Expanded(
                        child: CalcTextButton(
                          text: '5',
                          textColor: myColors.btn1TextColor,
                          backgroundColor:
                              myColors.themeCategory == ThemeCategory.special
                              ? ThemeProvider.rainbowColors[i++]
                              : myColors.btn1BackgroundColor,
                          onTap: () =>
                              ref.read(calcProvider.notifier).pushDigit('5'),
                        ),
                      ),
                      const SizedBox(width: itemSpacing),
                      Expanded(
                        child: CalcTextButton(
                          text: '6',
                          textColor: myColors.btn1TextColor,
                          backgroundColor:
                              myColors.themeCategory == ThemeCategory.special
                              ? ThemeProvider.rainbowColors[i++]
                              : myColors.btn1BackgroundColor,
                          onTap: () =>
                              ref.read(calcProvider.notifier).pushDigit('6'),
                        ),
                      ),
                      const SizedBox(width: itemSpacing),
                      Expanded(
                        child: CalcTextButton(
                          text: '+',
                          textColor: myColors.btn2TextColor,
                          backgroundColor:
                              myColors.themeCategory == ThemeCategory.special
                              ? ThemeProvider.rainbowColors[i++]
                              : myColors.btn2BackgroundColor,
                          onTap: () =>
                              ref.read(calcProvider.notifier).pushOperator('+'),
                        ),
                      ),
                      const SizedBox(width: itemSpacing),
                      Expanded(
                        child: CalcTextButton(
                          text: '-',
                          textColor: myColors.btn2TextColor,
                          backgroundColor:
                              myColors.themeCategory == ThemeCategory.special
                              ? ThemeProvider.rainbowColors[i++]
                              : myColors.btn2BackgroundColor,
                          onTap: () =>
                              ref.read(calcProvider.notifier).pushOperator('-'),
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
                              ? ThemeProvider.rainbowColors[i++]
                              : myColors.btn1BackgroundColor,
                          onTap: () =>
                              ref.read(calcProvider.notifier).pushDigit('1'),
                        ),
                      ),
                      const SizedBox(width: itemSpacing),
                      Expanded(
                        child: CalcTextButton(
                          text: '2',
                          textColor: myColors.btn1TextColor,
                          backgroundColor:
                              myColors.themeCategory == ThemeCategory.special
                              ? ThemeProvider.rainbowColors[i++]
                              : myColors.btn1BackgroundColor,
                          onTap: () =>
                              ref.read(calcProvider.notifier).pushDigit('2'),
                        ),
                      ),
                      const SizedBox(width: itemSpacing),
                      Expanded(
                        child: CalcTextButton(
                          text: '3',
                          textColor: myColors.btn1TextColor,
                          backgroundColor:
                              myColors.themeCategory == ThemeCategory.special
                              ? ThemeProvider.rainbowColors[i++]
                              : myColors.btn1BackgroundColor,
                          onTap: () =>
                              ref.read(calcProvider.notifier).pushDigit('3'),
                        ),
                      ),
                      const SizedBox(width: itemSpacing),
                      Expanded(
                        child: CalcTextButton(
                          text: '✕',
                          textColor: myColors.btn2TextColor,
                          backgroundColor:
                              myColors.themeCategory == ThemeCategory.special
                              ? ThemeProvider.rainbowColors[i++]
                              : myColors.btn2BackgroundColor,
                          onTap: () =>
                              ref.read(calcProvider.notifier).pushOperator('*'),
                        ),
                      ),
                      const SizedBox(width: itemSpacing),
                      Expanded(
                        child: CalcTextButton(
                          text: '÷',
                          textColor: myColors.btn2TextColor,
                          backgroundColor:
                              myColors.themeCategory == ThemeCategory.special
                              ? ThemeProvider.rainbowColors[i++]
                              : myColors.btn2BackgroundColor,
                          onTap: () =>
                              ref.read(calcProvider.notifier).pushOperator('/'),
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
                        width: itemFlexSize(size, 2),
                        child: CalcTextButton(
                          text: '0',
                          textColor: myColors.btn1TextColor,
                          backgroundColor:
                              myColors.themeCategory == ThemeCategory.special
                              ? ThemeProvider.rainbowColors[i++]
                              : myColors.btn1BackgroundColor,
                          onTap: () =>
                              ref.read(calcProvider.notifier).pushDigit('0'),
                        ),
                      ),
                      const SizedBox(width: itemSpacing),
                      Expanded(
                        child: CalcTextButton(
                          text: '.',
                          textColor: myColors.btn1TextColor,
                          backgroundColor:
                              myColors.themeCategory == ThemeCategory.special
                              ? ThemeProvider.rainbowColors[i++]
                              : myColors.btn1BackgroundColor,
                          onTap: () =>
                              ref.read(calcProvider.notifier).pushComma(),
                        ),
                      ),
                      const SizedBox(width: itemSpacing),
                      SizedBox(
                        width: itemFlexSize(size, 2),
                        child: CalcTextButton(
                          text: '=',
                          textColor: myColors.btn1TextColor,
                          backgroundColor:
                              myColors.themeCategory == ThemeCategory.special
                              ? ThemeProvider.rainbowColors[i++]
                              : myColors.btn1BackgroundColor,
                          onTap: () =>
                              ref.read(calcProvider.notifier).pushEqual(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
