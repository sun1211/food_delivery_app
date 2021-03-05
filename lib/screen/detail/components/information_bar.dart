import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';

class BuildInfor extends StatelessWidget {
  final String title;
  final String val;
  const BuildInfor({Key key, this.title, this.val}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "$val",
          style: TextStyle(
            fontSize: 16,
            color: kRedColor,
          ),
        ),
      ],
    );
  }
}
