import 'package:flutter/material.dart';

import '../theme.dart';

class BottomNavItems extends StatelessWidget {
  final String imgUrl;
  final bool isActive;

  BottomNavItems({this.imgUrl, this.isActive});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(
          imgUrl,
          width: 26,
        ),
        Spacer(),
        isActive
            ? Container(
                width: 30,
                height: 2,
                decoration: BoxDecoration(
                    color: purple,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(1000))),
              )
            : Container()
      ],
    );
  }
}
