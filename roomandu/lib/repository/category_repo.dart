import 'package:roomandu/data_source/remote_data_source/category_remote_data_source.dart';
import 'package:roomandu/model/category.dart';

abstract class CategoryRepository {
  Future<List<Category>?> fetchCategories();
  Future<List<Category>?> fetchCategoryById(String id);
}

class CategoryRepositoryImpl implements CategoryRepository {
  @override
  Future<List<Category>?> fetchCategories() {
    return CategoryRemoteDataSource().getCategories();
  }
  
  @override
  Future<List<Category>?> fetchCategoryById(String? id) {
    return CategoryRemoteDataSource().getcategorybyid(id);
  }
}