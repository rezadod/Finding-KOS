import 'package:flutter/material.dart';
import 'package:kos_app/models/city.dart';
import 'package:kos_app/models/space.dart';
import 'package:kos_app/models/tips.dart';
import 'package:kos_app/provider/space_provider.dart';
import 'package:kos_app/widgets/bottom_nav_items.dart';
import 'package:kos_app/widgets/city_card.dart';
import 'package:kos_app/widgets/space_card.dart';
import 'package:kos_app/widgets/tips_card.dart';
import 'package:provider/provider.dart';
import '../theme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);
    spaceProvider.getRecommendedSpace();

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
          bottom: false,
          child: ListView(
            children: [
              SizedBox(
                height: edge,
              ),
              // TITLE HEADER
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  "Explore Now",
                  style: blackTextStyle.copyWith(fontSize: 24),
                ),
              ),
              SizedBox(height: 2),
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  "Mencari kosan yang cozy",
                  style: greyTextStyle.copyWith(fontSize: 16),
                ),
              ),
              SizedBox(height: 30),
              // POPULAR CITY
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  "Popular Cities",
                  style: regularTextStyle.copyWith(fontSize: 16),
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(width: 24),
                    CityCard(City(
                        id: 1,
                        name: "Jakarta",
                        imgUrl: 'assets/pic_2.png',
                        isPopuler: true)),
                    SizedBox(width: 24),
                    CityCard(City(
                      id: 2,
                      name: "Bandung",
                      imgUrl: 'assets/pic_1.png',
                    )),
                    SizedBox(width: 24),
                    CityCard(City(
                        id: 3, name: "Semarang", imgUrl: "assets/pic.png")),
                    SizedBox(width: 24),
                    CityCard(
                        City(id: 4, name: "Yogya", imgUrl: "assets/pic_2.png")),
                    SizedBox(width: 24),
                    SizedBox(width: 24),
                    CityCard(City(
                      id: 4,
                      name: "Palembang",
                      imgUrl: 'assets/pic-4.png',
                    )),
                    SizedBox(width: 24),
                    CityCard(City(
                        id: 5,
                        name: "Aceh",
                        imgUrl: "assets/pic-5.png",
                        isPopuler: true)),
                    SizedBox(width: 24),
                    CityCard(
                        City(id: 6, name: "Bogor", imgUrl: "assets/pic-6.png")),
                    SizedBox(width: 24),
                  ],
                ),
              ),
              //RECOMANDED SPACE
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  "Recommanded Space",
                  style: regularTextStyle.copyWith(fontSize: 16),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: edge),
                child: FutureBuilder(
                    future: spaceProvider.getRecommendedSpace(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Space> data = snapshot.data;

                        int index = 0;

                        return Column(
                          children: data.map((item) {
                            index++;
                            return Container(
                              margin: EdgeInsets.only(top: index == 1 ? 0 : 30),
                              child: SpaceCard(item),
                            );
                          }).toList(),
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }),
              ),
              // Tips And Guide
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  "Tips & Guidance",
                  style: regularTextStyle.copyWith(fontSize: 16),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: edge),
                  child: Column(
                    children: [
                      TipsCard(Tips(
                        id: 1,
                        title: "City Guidelines",
                        imgUrl: "assets/icon.png",
                        updatedAt: "20 April",
                      )),
                      SizedBox(height: 20),
                      TipsCard(Tips(
                        id: 2,
                        title: "Jakarta Fairship",
                        imgUrl: "assets/icon-1.png",
                        updatedAt: "11 Dec",
                      ))
                    ],
                  )),
              SizedBox(height: 50 + edge),
            ],
          )),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(horizontal: edge),
        decoration: BoxDecoration(
            color: Color(0xffF6F7F8), borderRadius: BorderRadius.circular(23)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavItems(
              imgUrl: "assets/icon_home_solid.png",
              isActive: true,
            ),
            BottomNavItems(
              imgUrl: "assets/icon_mail_solid.png",
              isActive: false,
            ),
            BottomNavItems(
              imgUrl: "assets/icon_card_solid.png",
              isActive: false,
            ),
            BottomNavItems(
              imgUrl: "assets/icon_love_solid.png",
              isActive: false,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
