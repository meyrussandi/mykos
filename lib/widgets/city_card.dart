import 'package:flutter/material.dart';
import 'package:mykos/models/city.dart';
import 'package:mykos/theme.dart';

class CityCard extends StatelessWidget {
  final City city;

  CityCard(this.city);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        color: Color(0xffF6F7F8),
        height: 150,
        width: 120,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 102,
                  width: 120,
                  color: orangeColor,
                ),
                city.isPopular
                    ? Align(
                        alignment: Alignment.topRight,
                        child: Container(
                            width: 50,
                            height: 30,
                            decoration: BoxDecoration(
                                color: purpleColor,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(36))),
                            child: Center(
                              child: Icon(
                                Icons.star,
                                color: orangeColor,
                                size: 22,
                              ),
                            )),
                      )
                    : SizedBox()
              ],
            ),
            SizedBox(
              height: 11,
            ),
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