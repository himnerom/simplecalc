import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:simple_calculator/services/screen_service.dart';
import 'package:simple_calculator/services/themes_service.dart';

class CalcDrawerTheme extends StatelessWidget {
  const CalcDrawerTheme({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemesService>().theme;
    double screenHeight = ScreenService.screenHeight(context);

    return Dialog(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: theme.btn2BackgroundColor, width: 6),
      ),
      child: SizedBox(
        height: screenHeight * 0.4,
        width: 280,
        child: Column(
          children: [
            Container(
              color: theme.btn2BackgroundColor,
              height: screenHeight * 0.025,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: ThemesService.themesList.asMap().entries.map((
                    entry,
                  ) {
                    int idx = entry.key;
                    ThemePalette tp = entry.value;

                    return Container(
                      color: theme.resBackgroundColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      child: InkWell(
                        highlightColor: tp.primaryColor.withOpacity(0.2),
                        splashColor: tp.primaryColor.withOpacity(0.2),
                        onTap: () =>
                            context.read<ThemesService>().setTheme(idx),
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
                                    gradient:
                                        tp.themeCategory ==
                                            ThemeCategory.special
                                        ? const SweepGradient(
                                            colors: ThemesService.rainbowColors,
                                          )
                                        : LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            colors: [
                                              tp.secondaryColor,
                                              tp.secondaryColor,
                                              tp.secondaryColor,
                                              tp.primaryColor,
                                              tp.primaryColor,
                                              tp.primaryColor,
                                            ],
                                          ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                tp.themeName,
                                style: TextStyle(
                                  color: theme.resTextColor,
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
              color: theme.btn2BackgroundColor,
              height: screenHeight * 0.025,
            ),
          ],
        ),
      ),
    );
  }
}
