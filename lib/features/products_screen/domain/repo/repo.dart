import 'package:ecommerce/features/products_screen/data/models/product_response.dart';

abstract class ProductRepo {
  Future<List<ProductData>> getProducts({String? categoryId, String? brandId});
  Future<String> addWashList({required String id});
  Future<String> addCart({required String id});
}
