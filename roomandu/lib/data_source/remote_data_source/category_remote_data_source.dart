import 'package:dio/dio.dart';
import 'package:roomandu/app/constants.dart';
import 'package:roomandu/data_source/remote_data_source/response/category_response.dart';
import 'package:roomandu/helper/http_service.dart';
import 'package:roomandu/model/category.dart';

class CategoryRemoteDataSource{
  final Dio _httpServices =  HttpServices().getDioInstance();


  Future<List<Category>?> getCategories() async{
    try{
      Response response = await _httpServices.get(Constant.categoryURL);
      if(response.statusCode == 200){
        CategoryResponse categoryResponse = CategoryResponse.fromJson(response.data);
        return categoryResponse.data;
      }else{
        return null;
      }
    }catch(e){
      return null;
    }
  }

  Future<List<Category>?> getcategorybyid(String? id) async{
    try{
      Response response = await _httpServices.get(Constant.categoryURL+id!);
      if(response.statusCode == 200){
        CategoryResponse categoryResponse = CategoryResponse.fromJson(response.data);
        return categoryResponse.data;
      }else{
        return null;
      }
    }catch(e){
      return null;
    }
  }
}