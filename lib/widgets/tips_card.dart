import 'package:flutter/material.dart';
import 'package:mykos/models/tips.dart';
import 'package:mykos/theme.dart';

class TipsCard extends StatelessWidget {
  final Tips tips;

  TipsCard(this.tips);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          tips.imageUrl,
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
            SizedBox(
              height: 4,
            ),
            Text(
              'updated ${tips.updateAt}',
              style: greyTextStyle,
            )
          ],
        ),
        Spacer(),
        IconButton(
            icon: Icon(Icons.chevron_right), color: greyColor, onPressed: () {})
      ],
    );
  }
}
