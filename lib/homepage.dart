import 'package:flutter/material.dart';
import 'package:mykos/models/city.dart';
import 'package:mykos/models/space.dart';
import 'package:mykos/models/tips.dart';
import 'package:mykos/providers/space_provider.dart';
import 'package:mykos/theme.dart';
import 'package:mykos/widgets/bottom_navbar_item.dart';
import 'package:mykos/widgets/city_card.dart';
import 'package:mykos/widgets/space_card.dart';
import 'package:mykos/widgets/tips_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      body: SafeArea(
          bottom: false,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 1),
            child: ListView(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: defaultMargin, top: defaultMargin),
                  child: Text(
                    "Explore Now",
                    style: blackTextStyle.copyWith(fontSize: 24),
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Padding(
                  padding: EdgeInsets.only(left: defaultMargin),
                  child: Text(
                    "Mencari kosan yang cozy",
                    style: greyTextStyle.copyWith(fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(left: defaultMargin),
                  child: Text(
                    "Popular Cities",
                    style: regularBlackTextStyle.copyWith(fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),

                // NOTE: Popular city
                Container(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                        width: 24,
                      ),
                      CityCard(City(
                          id: 1,
                          name: "Jakarta",
                          imageUrl: "aaaa",
                          isPopular: false)),
                      SizedBox(
                        width: 20,
                      ),
                      CityCard(City(
                          id: 2,
                          name: "Bandung",
                          imageUrl: "bbbb",
                          isPopular: true)),
                      SizedBox(
                        width: 20,
                      ),
                      CityCard(City(
                          id: 3,
                          name: "Surabaya",
                          imageUrl: "cccc",
                          isPopular: false)),
                      SizedBox(
                        width: 24,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                //NOTE : RECOMMENDED SPACE
                Padding(
                  padding: EdgeInsets.only(left: defaultMargin),
                  child: Text(
                    "Recommended Space",
                    style: regularBlackTextStyle.copyWith(fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: FutureBuilder(
                      future: spaceProvider.getRecommendedSpaces(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<Space> data = snapshot.data;
                          int index = 0;
                          return Column(
                              children: data.map((e) {
                            index++;
                            return Container(
                              margin: EdgeInsets.only(top: index == 1 ? 0 : 30),
                              child: SpaceCard(e),
                            );
                          }).toList());
                        }

                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    )),
                SizedBox(
                  height: 30,
                ),
                //NOTE : TIPS & GUIDE
                Padding(
                  padding: EdgeInsets.only(left: defaultMargin),
                  child: Text(
                    "Tips & Guidance",
                    style: regularBlackTextStyle.copyWith(fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Column(
                    children: [
                      TipsCard(Tips(
                          id: 1,
                          title: "City Guidelines",
                          imageUrl:
                              "https://previews.123rf.com/images/mas0380/mas03801605/mas0380160500032/57125771-plastic-id-badge-identification-card-badge-holder-with-identification-card-isolated-id-badge-.jpg",
                          updateAt: "20 Apr")),
                      SizedBox(
                        height: 20,
                      ),
                      TipsCard(Tips(
                          id: 2,
                          title: "Jakarta Fairship",
                          imageUrl:
                              "https://simerexpo.com/images/visitor_badge_dark_blue.png",
                          updateAt: "20 Apr")),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50 + defaultMargin,
                )
              ],
            ),
          )),
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width - (2 * defaultMargin),
        height: 65,
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        decoration: BoxDecoration(
            color: Color(0xffF6F7F8), borderRadius: BorderRadius.circular(23)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavBarItem(
              icons: Icons.home,
              isActive: true,
            ),
            BottomNavBarItem(
              icons: Icons.email,
              isActive: false,
            ),
            BottomNavBarItem(
              icons: Icons.credit_card,
              isActive: false,
            ),
            BottomNavBarItem(
              icons: Icons.favorite,
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
