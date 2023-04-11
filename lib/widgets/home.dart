import 'package:flutter/material.dart';
import 'package:simple_calculator/repositories/theme_util.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:simple_calculator/widgets/calc_button.dart';
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

  @override
  Widget build(BuildContext context) {
    MyColors myColors = Theme.of(context).extension<MyColors>()!;

    return CalcLayout(
      scaffoldKey: scaffoldKey,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: StaggeredGrid.count(
            axisDirection: AxisDirection.down,
            crossAxisCount: 5,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            children: [
              /// Row 1
              const CalcResult(
                result: 0,
              ),
              CalcButton(
                text: '三',
                textColor: myColors.titleColor,
                backgroundColor: Colors.transparent,
                onTap: () {},
              ),

              /// Row 2
              CalcButton(
                text: '1',
                textColor: myColors.btn1TextColor,
                backgroundColor: myColors.btn1BackgroundColor,
                onTap: () {},
              ),
              CalcButton(
                text: '2',
                textColor: myColors.btn1TextColor,
                backgroundColor: myColors.btn1BackgroundColor,
                onTap: () {},
              ),
              CalcButton(
                text: '3',
                textColor: myColors.btn1TextColor,
                backgroundColor: myColors.btn1BackgroundColor,
                onTap: () {},
              ),
              CalcButton(
                text: 'AC',
                textColor: myColors.btn1TextColor,
                backgroundColor: myColors.btn1BackgroundColor,
                crossAxisCellCount: 2,
                onTap: () {},
              ),

              /// Row 3
              CalcButton(
                text: '4',
                textColor: myColors.btn1TextColor,
                backgroundColor: myColors.btn1BackgroundColor,
                onTap: () {},
              ),
              CalcButton(
                text: '5',
                textColor: myColors.btn1TextColor,
                backgroundColor: myColors.btn1BackgroundColor,
                onTap: () {},
              ),
              CalcButton(
                text: '6',
                textColor: myColors.btn1TextColor,
                backgroundColor: myColors.btn1BackgroundColor,
                onTap: () {},
              ),
              CalcButton(
                text: '+',
                textColor: myColors.btn2TextColor,
                backgroundColor: myColors.btn2BackgroundColor,
                onTap: () {},
              ),
              CalcButton(
                text: '-',
                textColor: myColors.btn2TextColor,
                backgroundColor: myColors.btn2BackgroundColor,
                onTap: () {},
              ),

              /// Row 4
              CalcButton(
                text: '7',
                textColor: myColors.btn1TextColor,
                backgroundColor: myColors.btn1BackgroundColor,
                onTap: () {},
              ),
              CalcButton(
                text: '8',
                textColor: myColors.btn1TextColor,
                backgroundColor: myColors.btn1BackgroundColor,
                onTap: () {},
              ),
              CalcButton(
                text: '9',
                textColor: myColors.btn1TextColor,
                backgroundColor: myColors.btn1BackgroundColor,
                onTap: () {},
              ),
              CalcButton(
                text: '✕',
                textColor: myColors.btn2TextColor,
                backgroundColor: myColors.btn2BackgroundColor,
                onTap: () {},
              ),
              CalcButton(
                text: '÷',
                textColor: myColors.btn2TextColor,
                backgroundColor: myColors.btn2BackgroundColor,
                onTap: () {},
              ),

              /// Row 5
              CalcButton(
                text: '0',
                textColor: myColors.btn1TextColor,
                backgroundColor: myColors.btn1BackgroundColor,
                crossAxisCellCount: 2,
                onTap: () {},
              ),
              CalcButton(
                text: ',',
                textColor: myColors.btn1TextColor,
                backgroundColor: myColors.btn1BackgroundColor,
                onTap: () {},
              ),
              CalcButton(
                text: '=',
                textColor: myColors.btn1TextColor,
                backgroundColor: myColors.btn1BackgroundColor,
                crossAxisCellCount: 2,
                onTap: () {},
              ),
              // CalcButton(
              //   text: '',
              //   textColor: myColors.titleColor,
              //   backgroundColor: myColors.backgroundColor,
              //   onTap: () {},
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
