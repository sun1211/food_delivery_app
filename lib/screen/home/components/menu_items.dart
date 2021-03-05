import 'package:flutter/material.dart';

class MenuItems extends StatelessWidget {
  final Function press;
  final String menuLabel;
  const MenuItems({Key key, this.press, this.menuLabel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: 150,
        padding: EdgeInsets.only(top: 16),
        child: Center(
          child: Text(
            menuLabel,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
