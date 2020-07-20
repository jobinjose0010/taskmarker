class TodoCategory{
  int id;
  String title;
  String descrip;
  String date;
  String time;
  String todoCategory;
  bool notify;
  bool isDone;

  todolistMapp(){
    var todomapping = Map<String,dynamic>();
    todomapping['id'] = id;
    todomapping['title'] = title;
    todomapping['descrip'] = descrip;
    todomapping['date'] = date;
    todomapping['time'] = time;
    todomapping['todoCategory'] = todoCategory;
    todomapping['notify'] = notify;
    todomapping['isDone'] = isDone;
  }
}