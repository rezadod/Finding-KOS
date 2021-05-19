import 'package:flutter/material.dart';
import 'package:kos_app/models/city.dart';

import 'package:kos_app/theme.dart';

class CityCard extends StatelessWidget {
  final City city;
  CityCard(this.city);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 150,
        width: 120,
        color: Color(0xffF6F7F8),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  city.imgUrl,
                  height: 102,
                  width: 120,
                  fit: BoxFit.cover,
                ),
                city.isPopuler
                    ? Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          decoration: BoxDecoration(
                              color: purple,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(36))),
                          width: 50,
                          height: 30,
                          child: Center(
                              child: Image.asset(
                            "assets/star.png",
                            width: 22,
                            height: 22,
                          )),
                        ),
                      )
                    : Container()
              ],
            ),
            SizedBox(height: 11),
            Text(
              city.name,
              style: blackTextStyle.copyWith(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
