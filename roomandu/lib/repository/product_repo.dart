import 'package:roomandu/data_source/remote_data_source/product_remote_data_source.dart';
import 'package:roomandu/model/product.dart';

abstract class productRepository {
  Future<List<Product>?> fetchProducts();
}

class productRepositoryImpl implements productRepository {
  @override
  Future<List<Product>?> fetchProducts() {
    return ProductRemoteDataSource().getProducts();
  }
}