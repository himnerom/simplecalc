import 'package:flutter/material.dart';

class CalcDrawer extends StatefulWidget {
  const CalcDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<CalcDrawer> createState() => _CalcDrawerState();
}

class _CalcDrawerState extends State<CalcDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [],
          ),
        ),
      ),
    );
  }
}
