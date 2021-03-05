import 'package:flutter/material.dart';
import 'package:food_delivery_app/screen/home/components/body.dart';
import 'package:food_delivery_app/size_config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
