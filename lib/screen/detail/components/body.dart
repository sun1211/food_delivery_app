import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/models/food_model.dart';
import 'package:food_delivery_app/screen/detail/components/custom_app_bar.dart';
import 'package:food_delivery_app/size_config.dart';

import 'counter_bar.dart';
import 'custom_btn.dart';
import 'information_bar.dart';

class Body extends StatelessWidget {
  final FoodModel food;
  const Body({Key key, this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Column(
            children: [
              SizedBox(height: 25),
              CustomAppBar(),
              Container(
                height: 270,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: <Widget>[
                    Image(
                      image: AssetImage("assets/images/bg.png"),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Hero(
                        tag: "image${food.imgPath}",
                        child: Image(
                          image: AssetImage(food.imgPath),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                padding: EdgeInsets.all(28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${food.name}",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: <Widget>[
                        Text(
                          "\$${food.price.toInt()}",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: kRedColor,
                          ),
                        ),
                        SizedBox(width: 30),
                        CounterBar(),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        BuildInfor(
                          title: "Weight",
                          val: "${food.weight.toInt()}gm",
                        ),
                        BuildInfor(
                          title: "Calories",
                          val: "${food.calory.toInt()}gm",
                        ),
                        BuildInfor(
                          title: "Protein",
                          val: "${food.protein.toInt()}gm",
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Items",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text("${food.item}"),
                    SizedBox(height: 30),
                    CustomBtn(
                      label: "Add to Cart",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
