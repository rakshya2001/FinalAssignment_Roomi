
import 'package:dio/dio.dart';
import 'package:roomandu/app/constants.dart';
import 'package:roomandu/data_source/remote_data_source/response/Product_response.dart';
import 'package:roomandu/helper/http_service.dart';
import 'package:roomandu/model/product.dart';

class ProductRemoteDataSource{

  final Dio _httpServices = HttpServices().getDioInstance();

  Future<List<Product>?> getProducts() async{
    try{
      Response response = await _httpServices.get(Constant.productURL);
      if(response.statusCode == 200){
        ProductResponse productResponse = ProductResponse.fromJson(response.data);
        return productResponse.data;
      }else{
        return null;
      }
    }catch(e){
      return null;
    }
  }
  
}