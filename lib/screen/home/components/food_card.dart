import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/models/food_model.dart';
import 'dart:math' as math;

class FoodCard extends StatelessWidget {
  final int itemsIndex;
  final Function press;
  final FoodModel food;
  const FoodCard({Key key, this.press, this.food, this.itemsIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.only(right: 40),
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                top: 40,
                bottom: 20,
                right: 30,
              ),
              padding: EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: kGreenColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(32),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: SizedBox()),
                  Row(
                    children: <Widget>[
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 15,
                        unratedColor: Colors.black12,
                        itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.black,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      Text(
                        "(1k Reviews)",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "${food.name}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            //top right images
            Align(
              alignment: Alignment.topRight,
              child: Transform.rotate(
                angle: math.pi / 3,
                child: Hero(
                  tag: "${food.imgPath}",
                  child: Image(
                    width: 180,
                    image: AssetImage("${food.imgPath}"),
                  ),
                ),
              ),
            ),
            //bottom right price label
            Positioned(
              bottom: 0,
              right: 30,
              child: Container(
                decoration: BoxDecoration(
                  color: kRedColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: Text(
                  "\$${food.price.toInt()}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
