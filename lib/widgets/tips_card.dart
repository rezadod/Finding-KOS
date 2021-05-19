import 'package:flutter/material.dart';
import 'package:kos_app/models/tips.dart';
import 'package:kos_app/theme.dart';

class TipsCard extends StatelessWidget {
  // Parameter
  final Tips tips;
  TipsCard(this.tips);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          tips.imgUrl,
          width: 80,
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tips.title,
              style: blackTextStyle.copyWith(fontSize: 18),
            ),
            SizedBox(height: 4),
            Text(
              "Updated At ${tips.updatedAt}",
              style: greyTextStyle,
            )
          ],
        ),
        Spacer(),
        IconButton(
          icon: Icon(
            Icons.chevron_right,
            color: grey,
          ),
          onPressed: () {},
        )
      ],
    );
  }
}
