import 'package:ecommerce/features/main_layout/data/models/category_response.dart';
import 'package:ecommerce/features/products_screen/data/models/product_response.dart';

import '../../data/models/brands_response.dart';

abstract class MainRepo {
  Future<List<CategoryData>> getAllCategory();
  Future<List<BrandData>> getAllBrands();
  Future<List<ProductData>> getWashList();
}
