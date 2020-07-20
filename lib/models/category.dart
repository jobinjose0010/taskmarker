class Category{
  int id;
  String name;
  String description;
  String color;

  categoryMap(){
    var mapping = Map<String,dynamic>();
    mapping['id'] = id;
    mapping['name'] = name;
    mapping['description'] = description;
    mapping['color'] = color;

    return mapping;
  }
}