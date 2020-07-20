import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:TaskMarker/models/category.dart';
import 'package:TaskMarker/services/category_service.dart';
import 'package:TaskMarker/screens/home_screen.dart';

class CategoryHeading extends StatefulWidget {
  @override
  _CategoryHeadingState createState() => _CategoryHeadingState();
}

class _CategoryHeadingState extends State<CategoryHeading> {
  
  var _categoryNameController = TextEditingController();
  var _categorydescriptionController = TextEditingController();
  var _category = Category();
  var _categoryService = CategoryService();


  String dropdownValue = "0xffF7989F";
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 60.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "CATEGORY",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Color(0xff62929a),
                letterSpacing: 10.0),
          ),
          IconButton(
            icon: Icon(
              Icons.add,
              size: 35.0,
              color: Color(0xff62929a),
            ),
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return Container(
                      height: MediaQuery.of(context).size.height/1.3,
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
                              controller: _categoryNameController,
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
                              controller: _categorydescriptionController,
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                    Text(
                                      'Pick a Color: ',
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
                                      style: TextStyle(color: Colors.transparent),
                                      underline: Container(
                                        height: 0.0,
                                        color: Colors.transparent,
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
                                        '0xffC08FC2',
                                        '0xffffa45c',
                                        '0xff59d4e8',
                                        '0xff62929a',
                                        '0xfff5c16c',
                                        '0xff427a5b',
                                        '0xffff4f81'
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
                                  SizedBox(height: 20.0,),
                                  FlatButton(
                                      color: Colors.blue,
                                      child: Text('Save',style: TextStyle(fontSize:20.0,color:Colors.white),),
                                      onPressed: () async{
                                        _category.name = _categoryNameController.text;
                                        print(_category.name);
                                        _category.description = _categorydescriptionController.text;
                                        print(_category.description);
                                        _category.color = dropdownValue;
                                        print(_category.color);
                                        var result = await _categoryService.saveCategory(_category);
                                        print(result);
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen(),),);
                                      },
                                    ),
                                  
                                ],
                              ),
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
