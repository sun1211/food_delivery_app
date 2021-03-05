import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:food_delivery_app/components/app_clipper.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/screen/home/components/menu_items.dart';

class CustomMenuBar extends StatefulWidget {
  const CustomMenuBar({
    Key key,
  }) : super(key: key);

  @override
  _CustomMenuBarState createState() => _CustomMenuBarState();
}

class _CustomMenuBarState extends State<CustomMenuBar> {
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Transform.rotate(
        angle: -math.pi / 2,
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                MenuItems(
                  press: () {
                    setState(() {
                      currentIndex = 0;
                    });
                  },
                  menuLabel: "Vegetables",
                ),
                MenuItems(
                  press: () {
                    setState(() {
                      currentIndex = 1;
                    });
                  },
                  menuLabel: "Chicken",
                ),
                MenuItems(
                  press: () {
                    setState(() {
                      currentIndex = 2;
                    });
                  },
                  menuLabel: "Beef",
                ),
                MenuItems(
                  press: () {
                    setState(() {
                      currentIndex = 3;
                    });
                  },
                  menuLabel: "Thai",
                ),
              ],
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 250),
              margin: EdgeInsets.only(left: 150.0 * currentIndex),
              width: 150,
              height: 75,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipPath(
                      clipper: AppClipper(),
                      child: Container(
                        width: 150,
                        height: 60,
                        color: kGreenColor,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Transform.rotate(
                      angle: math.pi / 2,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 40),
                        child: Icon(
                          arrowIcon,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
