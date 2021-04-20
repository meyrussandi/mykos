import 'package:flutter/material.dart';
import 'package:mykos/theme.dart';

class RatingItem extends StatelessWidget {
  final int index;
  final int rating;

  RatingItem({this.index, this.rating});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star,
      color: index <= rating ? orangeColor : greyColor,
    );
  }
}
