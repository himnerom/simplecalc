import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'package:simple_calculator/services/screen_service.dart';
import 'package:simple_calculator/services/theme_service.dart';

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
                  children: ThemeUtil.themesList.asMap().entries.map((entry) {
                    int idx = entry.key;
                    ThemeData theme = entry.value;
                    MyColors extension = theme.extension<MyColors>()!;

                    return Container(
                      color: myColors.resBackgroundColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      child: InkWell(
                        onTap: () {
                          getThemeManager(context).selectThemeAtIndex(idx);
                        },
                        child: Row(
                          children: [
                            Card(
                              color: theme.primaryColor,
                              shadowColor: Colors.transparent,
                              clipBehavior: Clip.antiAlias,
                              child: SizedBox(
                                height: 20,
                                width: 20,
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: extension.themeCategory ==
                                            ThemeCategory.special
                                        ? const SweepGradient(
                                            colors: ThemeUtil.rainbowColors,
                                          )
                                        : LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            colors: [
                                              extension.secondaryColor,
                                              extension.secondaryColor,
                                              extension.secondaryColor,
                                              theme.primaryColor,
                                              theme.primaryColor,
                                              theme.primaryColor,
                                            ],
                                          ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                extension.themeName,
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
                    );
                  }).toList(),
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
