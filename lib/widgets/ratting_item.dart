import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {
  final int index;
  final int rating;
  RatingItem({this.index, this.rating});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      index <= rating ? "assets/Vector-orange.png" : "assets/Vector-grey.png",
      width: 20,
    );
  }
}
