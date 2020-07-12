import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  var pink = 0xffF7989F;
  var blue = 0xff7FA7DA;
  var purple = 0xffC08FC2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            //Appbar Setup
            Container(
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
            ),
            //AppBar setup Complete
            Container(
              padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 70.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "CATEGORY",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffA6A1A6),
                        letterSpacing: 10.0),
                  ),
                  Icon(
                    Icons.add,
                    size: 35.0,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Container(
                height: 180.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    InkWell(
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 22.0, top: 12.0, bottom: 12.0),
                        decoration: BoxDecoration(
                          color: Color(pink),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        width: 180.0,
                        child: Container(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'STUDY',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 5.0),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Text(
                                'Everyday study Task list',
                                style: TextStyle(
                                    color: Color(0xffF3F3F3),
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic,
                                    letterSpacing: 1.0),
                              ),
                              SizedBox(
                                height: 25.0,
                              ),
                              Text(
                                '8 tasks',
                                style: TextStyle(
                                    color: Color(0xff717171),
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
