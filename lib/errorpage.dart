import 'package:flutter/material.dart';
import 'package:mykos/homepage.dart';
import 'package:mykos/theme.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/404.png",
            width: 300,
          ),
          SizedBox(
            height: 70,
          ),
          Text("Where are you going?",
              style: blackTextStyle.copyWith(fontSize: 24)),
          SizedBox(
            height: 14,
          ),
          Text(
            "Seems like the page that you were requsted is already gone",
            style: greyTextStyle.copyWith(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            width: 210,
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                      (route) => false);
                },
                style: ElevatedButton.styleFrom(
                    primary: purpleColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17))),
                child: Text(
                  "Back To Home ",
                  style: whiteTextStyle.copyWith(fontSize: 18),
                )),
          )
        ],
      ),
    );
  }
}
