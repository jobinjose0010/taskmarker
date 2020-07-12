import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
          child: Column(
            children: <Widget>[
              //Appbar Setup
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Image.asset("images/hamburger.png"),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Image.asset("images/no-notification.png"),
                      onPressed: () {},
                    ),
                  ],
                ),
                //AppBar setup Complete
              ),
            ],
          ),
        ),
      ),
    );
  }
}
