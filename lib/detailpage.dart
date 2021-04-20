import 'package:flutter/material.dart';
import 'package:mykos/errorpage.dart';
import 'package:mykos/models/space.dart';
import 'package:mykos/theme.dart';
import 'package:mykos/widgets/facility_item.dart';
import 'package:mykos/widgets/rating_item.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final Space space;

  DetailPage(this.space);

  @override
  Widget build(BuildContext context) {
    urlLauncher(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        // throw (url);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ErrorPage()));
      }
    }

    return Scaffold(
      body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Image.network(
                space.imageUrl,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                height: 350,
              ),
              ListView(
                children: [
                  SizedBox(
                    height: 328,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        // NOTE: TITLE
                        Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: defaultMargin),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(space.name,
                                        style: blackTextStyle.copyWith(
                                            fontSize: 22)),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text.rich(TextSpan(
                                        text: '\$${space.price}',
                                        style: purpleTextStyle.copyWith(
                                            fontSize: 16),
                                        children: [
                                          TextSpan(
                                              text: ' / month',
                                              style: greyTextStyle.copyWith(
                                                  fontSize: 16))
                                        ])),
                                  ],
                                ),
                                Row(
                                    children: [1, 2, 3, 4, 5].map((e) {
                                  return Container(
                                    margin: EdgeInsets.only(left: 2),
                                    child: RatingItem(
                                        index: e, rating: space.rating),
                                  );
                                }).toList())
                              ],
                            )),
                        // NOTE: MAIN FACILITIES
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: defaultMargin),
                          child: Text(
                            "Main Facilities",
                            style: regularBlackTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: defaultMargin),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FacilityItem(
                                imageUrl: "assets/barcounter.png",
                                name: "kitchen",
                                total: space.numberOfKitchens,
                              ),
                              FacilityItem(
                                  imageUrl: "assets/doublebad.png",
                                  name: "bedroom",
                                  total: space.numberOfBedrooms),
                              FacilityItem(
                                imageUrl: "assets/cupboard.png",
                                name: "Big Lemari",
                                total: space.numberOfCupboards,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        //NOTE: PHOTO
                        Padding(
                          padding: EdgeInsets.only(left: defaultMargin),
                          child: Text(
                            "Photos",
                            style: regularBlackTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          height: 88,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: space.photos.map((e) {
                              return Container(
                                  margin: EdgeInsets.only(left: 24),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.network(e)));
                            }).toList(),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        //NOTE: LOCATION
                        Padding(
                          padding: EdgeInsets.only(left: defaultMargin),
                          child: Text(
                            "Location",
                            style: regularBlackTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: defaultMargin),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${space.address}\n ${space.city}",
                                    style: greyTextStyle),
                                InkWell(
                                  onTap: () {
                                    urlLauncher(space.mapUrl);
                                  },
                                  child: Icon(
                                    Icons.location_on,
                                    color: greyColor,
                                  ),
                                )
                              ],
                            )),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: defaultMargin),
                          height: 50,
                          width: MediaQuery.of(context).size.width -
                              (2 * defaultMargin),
                          child: ElevatedButton(
                            onPressed: () {
                              urlLauncher("tel:${space.phone}");
                            },
                            style: ElevatedButton.styleFrom(
                                primary: purpleColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(17))),
                            child: Text(
                              "Book Now",
                              style: whiteTextStyle.copyWith(fontSize: 18),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        )
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: defaultMargin, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          "assets/btn_back.png",
                          width: 40,
                        )),
                    Image.asset(
                      "assets/btn_wishlist.png",
                      width: 40,
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
