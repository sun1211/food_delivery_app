import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/models/food_model.dart';
import 'package:food_delivery_app/screen/detail/components/body.dart';

class DetailScreen extends StatelessWidget {
  final FoodModel food;
  const DetailScreen({Key key, this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreenColor,
      body: Body(
        food: food,
      ),
    );
  }
}
