import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryHeading extends StatefulWidget {
  @override
  _CategoryHeadingState createState() => _CategoryHeadingState();
}

class _CategoryHeadingState extends State<CategoryHeading> {
  String dropdownValue = "0xffF7989F";
  @override
  Widget build(BuildContext context) {
    return Container(
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
          IconButton(
            icon: Icon(
              Icons.add,
              size: 35.0,
              color: Colors.blue,
            ),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      color: Color(0xFF737373),
                      child: Container(
                        padding:
                            EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(20.0),
                            topRight: const Radius.circular(20.0),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'ADD NEW CATEGORY',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffA6A1A6),
                                  letterSpacing: 3.0),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            TextField(
                              autofocus: true,
                              cursorColor: Colors.blue,
                              cursorWidth: 2.0,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Category name',
                              ),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            TextField(
                              autofocus: true,
                              cursorColor: Colors.blue,
                              cursorWidth: 2.0,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Category description',
                              ),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Row(children: <Widget>[
                                Text(
                                  'Color: ',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Color(0xff717071),
                                  ),
                                ),
                                DropdownButton<String>(
                                  icon: Container(
                                    height: 40.0,
                                    width: 40.0,
                                    decoration: BoxDecoration(
                                      color: Color(int.parse(dropdownValue)),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(50.0),
                                      ),
                                    ),
                                  ),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      dropdownValue = newValue;
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                    });
                                  },
                                  items: <String>[
                                    '0xffF7989F',
                                    '0xff7FA7DA',
                                    '0xffC08FC2'
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                        value: value,
                                        child: Container(
                                          height: 40.0,
                                          width: 40.0,
                                          decoration: BoxDecoration(
                                            color: Color(int.parse(value)),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(50.0),
                                            ),
                                          ),
                                        ));
                                  }).toList(),
                                ),
                              ]),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
