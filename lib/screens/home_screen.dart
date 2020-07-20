import 'package:TaskMarker/screens/todo_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:TaskMarker/widgets/app_bar.dart';
import 'package:TaskMarker/widgets/category_heading.dart';
import 'package:TaskMarker/models/category.dart';
import 'package:TaskMarker/services/category_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  var _category = Category();

  var _categoryService = CategoryService();

  List<Category> _categotyList = List<Category>();


  var category;

  @override
  void initState(){
    super.initState();
    getAllCategories();
  }

  getAllCategories() async{
    _categotyList = List<Category>();
    var categories = await _categoryService.readCategories();
    categories.forEach((category){
      setState(() {
        var categoryModel = Category();
        categoryModel.id = category['id'];
        categoryModel.name = category['name'];
        categoryModel.description = category['description'];
        categoryModel.color = category['color'];
        _categotyList.add(categoryModel);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            //Appbar Setup
            AppBars(),
            //AppBar setup Complete
            CategoryHeading(),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Container(
                height: 180.0,
                child: ListView.builder(
                  itemCount: _categotyList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){

                    return InkWell(
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 22.0, top: 18.0, bottom: 18.0,right:5.0),
                        decoration: BoxDecoration(
                          color: Color(int.parse(_categotyList[index].color)),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                          boxShadow: [BoxShadow(
                              color: Color(0xffDCDCDC),
                              blurRadius: 8.0,
                              spreadRadius: 3.0,
                              offset: Offset(
                                8.0,
                                8.0,
                              ),
                            ),]
                        ),
                        width: 180.0,
                        child: Container(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                _categotyList[index].name,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 5.0),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                _categotyList[index].description,
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
                                    color: Colors.grey,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        var sendCategoryModel = Category();
                        sendCategoryModel.id = _categotyList[index].id;
                        sendCategoryModel.name = _categotyList[index].name;
                        sendCategoryModel.description = _categotyList[index].description;
                        sendCategoryModel.color = _categotyList[index].color;
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => TodoHome(sendCategoryModel)));
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
