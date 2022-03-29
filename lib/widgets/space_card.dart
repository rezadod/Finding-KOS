import 'package:flutter/material.dart';
import 'package:kos_app/models/space.dart';
import 'package:kos_app/pages/detail_page.dart';

import '../theme.dart';

class SpaceCard extends StatelessWidget {
  final Space space;
  SpaceCard(this.space);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailPage(space)));
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Container(
              width: 130,
              height: 110,
              child: Stack(
                children: [
                  Image.network(
                    space.imgUrl,
                    width: 130,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      decoration: BoxDecoration(
                          color: purple,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(36))),
                      width: 70,
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/star.png",
                            width: 22,
                            height: 22,
                          ),
                          Text(
                            "${space.rating}/5",
                            style: whiteTextStyle.copyWith(fontSize: 13),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                space.name,
                overflow: TextOverflow.ellipsis,
                style: blackTextStyle.copyWith(fontSize: 16),
              ),
              SizedBox(height: 2),
              Text.rich(TextSpan(
                  text: '\$${space.price}',
                  style: purpleTextStyle.copyWith(fontSize: 16),
                  children: [
                    TextSpan(
                        text: ' /mounth',
                        style: greyTextStyle.copyWith(fontSize: 16))
                  ])),
              SizedBox(height: 16),
              Text(
                '${space.city}',
                style: greyTextStyle,
              )
            ],
          )
        ],
      ),
    );
  }
}
