import 'package:flutter/material.dart';
import 'package:mykos/homepage.dart';
import 'package:mykos/theme.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              color: orangeColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration:
                      BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Find Cozy House\nto Stay and Happy",
                  style: blackTextStyle.copyWith(fontSize: 24),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Stop membuang banyak waktu\npada tempat yang tidak habitable",
                  style: greyTextStyle.copyWith(fontSize: 16),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: 210,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: purpleColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17))),
                      child: Text(
                        "Explore Now",
                        style: whiteTextStyle.copyWith(fontSize: 18),
                      )),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
