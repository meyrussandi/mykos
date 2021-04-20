import 'package:flutter/material.dart';
import 'package:mykos/theme.dart';

class BottomNavBarItem extends StatelessWidget {
  final IconData icons;
  final bool isActive;

  BottomNavBarItem({this.icons, this.isActive});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Icon(
          icons,
          color: purpleColor,
          size: 26,
        ),
        Spacer(),
        isActive
            ? Container(
                height: 2,
                width: 30,
                decoration: BoxDecoration(
                    color: purpleColor,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(1000))),
              )
            : SizedBox()
      ],
    );
  }
}
