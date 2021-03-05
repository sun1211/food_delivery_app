import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';

class CustomBtn extends StatelessWidget {
  final String label;
  const CustomBtn({Key key, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: RaisedButton(
            onPressed: () {},
            padding: EdgeInsets.symmetric(vertical: 16),
            color: kGreenColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              ),
            ),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 28,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
