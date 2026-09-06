import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import 'package:simple_calculator/services/screen_service.dart';
import 'package:simple_calculator/services/shape_service.dart';
import 'package:simple_calculator/services/themes_service.dart';

class CalcDrawerTheme extends StatelessWidget {
  const CalcDrawerTheme({super.key});

  static const double maxWidth = 280;

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemesService>().theme;
    final double borderRadius = context.watch<ShapeService>().borderRadius;
    final screen = ScreenService(context);
    final double factor = screen.width < (maxWidth + 80)
        ? screen.width / (maxWidth + 80)
        : 1;

    final double dialogWidth = maxWidth * factor;

    return Dialog(
      clipBehavior: Clip.antiAlias,
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: 40 * factor,
        vertical: 24 * factor,
      ),
      constraints: BoxConstraints(maxWidth: dialogWidth),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius * factor),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double contentFactor = constraints.maxWidth < maxWidth
              ? constraints.maxWidth / maxWidth
              : 1;

          return Card(
            color: theme.resBackgroundColor,
            elevation: 0,
            margin: EdgeInsets.zero,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius * factor),
              side: BorderSide(
                color: theme.btn2BackgroundColor,
                width: 6 * contentFactor,
              ),
            ),
            child: SizedBox(
              width: double.infinity,
              height: screen.height * 0.45,
              child: Column(
                children: [
                  Container(
                    height: screen.height * 0.025 * contentFactor,
                    width: double.infinity,
                    color: theme.btn2BackgroundColor,
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
                                  ThemesService
                                          .themesList[idx - 1]
                                          .themeCategory !=
                                      tp.themeCategory)
                                Container(
                                  height: 3 * contentFactor,
                                  width: double.infinity,
                                  color: theme.btn2BackgroundColor,
                                ),

                              SizedBox(
                                width: double.infinity,
                                child: Slidable(
                                  endActionPane:
                                      tp.themeCategory !=
                                              ThemeCategory.simple &&
                                          tp.themeCategory !=
                                              ThemeCategory.double
                                      ? null
                                      : ActionPane(
                                          motion: const ScrollMotion(),
                                          children: [
                                            SlidableAction(
                                              onPressed: (_) => context
                                                  .read<ThemesService>()
                                                  .setTheme(
                                                    idx,
                                                    Brightness.light,
                                                  ),
                                              backgroundColor:
                                                  ThemesService.lightBackground,
                                              foregroundColor: tp.primaryColor,
                                              icon: Icons.circle,
                                            ),
                                            SlidableAction(
                                              onPressed: (_) => context
                                                  .read<ThemesService>()
                                                  .setTheme(
                                                    idx,
                                                    Brightness.dark,
                                                  ),
                                              backgroundColor:
                                                  ThemesService.darkBackground,
                                              foregroundColor: tp.primaryColor,
                                              icon: Icons.circle,
                                            ),
                                          ],
                                        ),
                                  child: InkWell(
                                    highlightColor: tp.primaryColor.withOpacity(
                                      0.1,
                                    ),
                                    splashColor: tp.primaryColor.withOpacity(
                                      0.05,
                                    ),
                                    onTap: () => context
                                        .read<ThemesService>()
                                        .setTheme(idx),
                                    child: Container(
                                      color: theme.themeName == tp.themeName
                                          ? tp.primaryColor.withOpacity(0.05)
                                          : Colors.transparent,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 24 * contentFactor,
                                        vertical: 12 * contentFactor,
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 20 * contentFactor,
                                            width: 20 * contentFactor,
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
                                              borderRadius:
                                                  BorderRadius.circular(
                                                    borderRadius /
                                                        2 *
                                                        contentFactor,
                                                  ),
                                            ),
                                          ),
                                          SizedBox(width: 12 * contentFactor),
                                          Expanded(
                                            child: Text(
                                              tp.themeName,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: theme.resTextColor,
                                                fontSize: 18 * contentFactor,
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
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
                    height: screen.height * 0.025 * contentFactor,
                    width: double.infinity,
                    color: theme.btn2BackgroundColor,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
