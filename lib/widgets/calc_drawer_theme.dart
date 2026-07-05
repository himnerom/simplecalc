import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import 'package:simple_calculator/services/screen_service.dart';
import 'package:simple_calculator/services/themes_service.dart';

class CalcDrawerTheme extends StatelessWidget {
  const CalcDrawerTheme({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemesService>().theme;
    final double screenHeight = ScreenService.screenHeight(context);

    return Dialog(
      clipBehavior: Clip.antiAlias,
      backgroundColor: theme.resBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: theme.btn2BackgroundColor, width: 6),
      ),
      child: Container(
        height: screenHeight * 0.4,
        constraints: BoxConstraints(maxWidth: 280),
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
                    final int idx = entry.key;
                    final ThemePalette tp = entry.value;

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        /// Divider between categories
                        if (idx > 0 &&
                            ThemesService.themesList[idx - 1].themeCategory !=
                                tp.themeCategory)
                          Container(
                            height: 3,
                            width: double.infinity,
                            color: theme.btn2BackgroundColor,
                          ),

                        Slidable(
                          endActionPane:
                              tp.themeCategory != ThemeCategory.simple &&
                                  tp.themeCategory != ThemeCategory.double
                              ? null
                              : ActionPane(
                                  motion: const ScrollMotion(),
                                  children: [
                                    SlidableAction(
                                      onPressed: (_) => context
                                          .read<ThemesService>()
                                          .setTheme(idx, Brightness.light),
                                      backgroundColor:
                                          ThemesService.lightBackground,
                                      foregroundColor: tp.primaryColor,
                                      icon: Icons.circle,
                                    ),
                                    SlidableAction(
                                      onPressed: (_) => context
                                          .read<ThemesService>()
                                          .setTheme(idx, Brightness.dark),
                                      backgroundColor:
                                          ThemesService.darkBackground,
                                      foregroundColor: tp.primaryColor,
                                      icon: Icons.circle,
                                    ),
                                  ],
                                ),
                          child: InkWell(
                            highlightColor: tp.primaryColor.withOpacity(0.1),
                            splashColor: tp.primaryColor.withOpacity(0.05),
                            onTap: () =>
                                context.read<ThemesService>().setTheme(idx),
                            child: Container(
                              color: theme.themeName == tp.themeName
                                  ? tp.primaryColor.withOpacity(0.05)
                                  : Colors.transparent,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
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
                                                  colors: ThemesService
                                                      .rainbowColors,
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
                          ),
                        ),
                      ],
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
