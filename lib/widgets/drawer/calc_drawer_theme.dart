import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'package:simple_calculator/repositories/screen_service.dart';
import 'package:simple_calculator/repositories/theme_util.dart';

class CalcDrawerTheme extends StatelessWidget {
  const CalcDrawerTheme({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyColors myColors = Theme.of(context).extension<MyColors>()!;
    double screenHeight = ScreenService.screenHeight(context);

    return Dialog(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: myColors.btn2BackgroundColor,
          width: 6,
        ),
      ),
      child: SizedBox(
        height: screenHeight * 0.4,
        width: 280,
        child: Column(
          children: [
            Container(
              color: myColors.btn2BackgroundColor,
              height: screenHeight * 0.025,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (var theme in ThemeUtil.themesList)
                      Container(
                        color: myColors.resBackgroundColor,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        child: InkWell(
                          onTap: () {
                            int idx = ThemeUtil.themesList.indexWhere((e) {
                              return e.extension<MyColors>()!.themeName ==
                                  theme.extension<MyColors>()!.themeName;
                            });
                            if (idx >= 0 && idx < ThemeUtil.themesList.length) {
                              getThemeManager(context).selectThemeAtIndex(idx);
                            }
                          },
                          child: Row(
                            children: [
                              Card(
                                color: theme.primaryColor,
                                shadowColor: Colors.transparent,
                                child: const SizedBox(
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  theme.extension<MyColors>()!.themeName,
                                  style: TextStyle(
                                    color: myColors.resTextColor,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Container(
              color: myColors.btn2BackgroundColor,
              height: screenHeight * 0.025,
            )
          ],
        ),
      ),
    );
  }
}
