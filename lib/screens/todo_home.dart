import 'package:TaskMarker/widgets/todo_appbar.dart';
import 'package:flutter/material.dart';

class TodoHome extends StatefulWidget {
  var _receiveCategory;
  TodoHome(this._receiveCategory);

  @override
  _TodoHomeState createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {

  var _listTitleController = TextEditingController();
  var _listDescripController = TextEditingController();
  var _listDateController = TextEditingController();
  var _listTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Color(int.parse(widget._receiveCategory.color)),
                borderRadius:BorderRadius.only(bottomRight: Radius.circular(150.0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TodoAppBar(widget._receiveCategory),

                  Container(
                    padding: EdgeInsets.only(left:MediaQuery.of(context).size.width/5.5,),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        SizedBox(height:25.0),

                        Text(
                          widget._receiveCategory.name,
                          style: TextStyle(
                            fontSize: 50.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),),

                          SizedBox(height:5.0),

                        Text(
                          '(8 Tasks to complete)',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),),

                          SizedBox(height:25.0),

                        Text(
                          '"${widget._receiveCategory.description}"',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 23.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),),

                          SizedBox(height:60.0),

                          FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius:BorderRadius.circular(10.0),
                            ),
                            color: Colors.white,
                            child: Container(
                              width: 140.0,
                              padding: EdgeInsets.symmetric(horizontal:8.0,vertical:8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.add,
                                    color:Color(int.parse(widget._receiveCategory.color),),
                                    size:35.0,
                                  ),
                                  SizedBox(width:15.0),
                                  Text(
                                    'Add Task',
                                    style: TextStyle(
                                      color: Color(int.parse(widget._receiveCategory.color)),
                                      fontWeight: FontWeight.bold,
                                      fontSize:20.0
                                    ),
                                    ),
                                ],
                              ),
                            ),
                            onPressed: (){
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
                                                  'ADD NEW List',
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
                                                  controller: _listTitleController,
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
                                                  controller:_listDescripController,
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
                                                    children: <Widget>[
                                                      TextField(
                                                          controller: _listDateController,
                                                          autofocus: true,
                                                          cursorColor: Colors.blue,
                                                          cursorWidth: 2.0,
                                                          textAlign: TextAlign.center,
                                                          decoration: InputDecoration(
                                                            labelText: 'date',
                                                          ),
                                                        ),
                                                      SizedBox(height: 20.0,),
                                                      TextField(
                                                          controller: _listTimeController,
                                                          autofocus: true,
                                                          cursorColor: Colors.blue,
                                                          cursorWidth: 2.0,
                                                          textAlign: TextAlign.center,
                                                          decoration: InputDecoration(
                                                            labelText: 'time',
                                                          ),
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
                          SizedBox(height:50.0),
                      ],
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