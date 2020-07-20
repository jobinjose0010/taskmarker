import 'package:TaskMarker/models/category.dart';
import 'package:TaskMarker/repository/repository.dart';

class CategoryService{
  Repository _repository;
  CategoryService(){
    _repository = Repository();
  }

  saveCategory(Category category) async{
    return await _repository.insertData('categories', category.categoryMap());
  }

  readCategories() async {
    return await _repository.readData('categories');
  }

  deleteCategoryById(itemId) async{
    return await _repository.deleteDataById('categories',itemId);
  }

  updateCategory(Category category) async{
    return await _repository.updateData('categories', category.categoryMap());
  }

  readCategoriesById(itemId) async{
    return await _repository.readDataById('categories',itemId);
  }

}
