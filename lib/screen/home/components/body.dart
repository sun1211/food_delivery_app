import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/models/food_model.dart';
import 'package:food_delivery_app/screen/detail/detail_screen.dart';
import 'package:food_delivery_app/screen/home/components/food_card.dart';
import 'package:food_delivery_app/screen/home/components/popular_card.dart';
import 'package:food_delivery_app/size_config.dart';

import 'custom_app_bar.dart';
import 'custom_menu_bar.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<FoodModel> foodList = FoodModel.list;
    PageController pageController = PageController(viewportFraction: .8);

    return Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      child: Stack(
        children: [
          //right detail pannel
          Padding(
            padding: EdgeInsets.only(left: 60),
            child: SafeArea(
              child: Column(
                children: [
                  CustomAppBar(),
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          height: 350,
                          child: PageView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: foodList.length,
                              controller: pageController,
                              itemBuilder: (context, index) => FoodCard(
                                    press: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => DetailScreen(
                                              food: foodList[index],
                                            ),
                                          ));
                                    },
                                    food: foodList[index],
                                    itemsIndex: index,
                                  )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 40),
                          child: Text(
                            "Popular",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                            ),
                          ),
                        ),
                        PopularCard(
                          foodList: foodList,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: kGreenColor,
            height: MediaQuery.of(context).size.height,
            width: 60,
            padding: EdgeInsets.only(top: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  margin: EdgeInsets.only(top: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    image: DecorationImage(
                      image: ExactAssetImage("assets/images/profile.jpg"),
                    ),
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Icon(menuIcon),
                  ),
                ),
              ],
            ),
          ),
          CustomMenuBar(),
        ],
      ),
    );
  }
}
