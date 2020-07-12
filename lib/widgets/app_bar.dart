import 'package:flutter/material.dart';

class AppBars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Image.asset("images/hamburger.png"),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset("images/notification.png"),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
