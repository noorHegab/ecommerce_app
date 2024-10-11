import 'package:ecommerce/features/main_layout/data/data_source/data_source.dart';
import 'package:ecommerce/features/main_layout/data/models/category_response.dart';
import 'package:ecommerce/features/main_layout/domain/repo/repo.dart';
import 'package:ecommerce/features/products_screen/data/models/product_response.dart';
import 'package:injectable/injectable.dart';

import '../models/brands_response.dart';

@Injectable(as: MainRepo)
class MainRepoImp implements MainRepo {
  MainDataSource dataSource;
  MainRepoImp(this.dataSource);
  @override
  Future<List<CategoryData>> getAllCategory() async {
    try {
      var response = await dataSource.getAllCategory();
      if (response.statusCode == 200) {
        var category = CategoryResponse.fromJson(response.data);
        return category.categories ?? [];
      } else {
        throw response.data["message"];
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<BrandData>> getAllBrands() async {
    try {
      var response = await dataSource.getAllBrands();
      if (response.statusCode == 200) {
        var brand = BrandsResponse.fromJson(response.data);
        return brand.brands ?? [];
      } else {
        throw response.data["message"];
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ProductData>> getWashList() async {
    try {
      var response = await dataSource.getWashList();
      if (response.statusCode == 200) {
        var product = ProductResponse.fromJson(response.data);
        return product.products ?? [];
      } else {
        throw response.data["message"];
      }
    } catch (e) {
      rethrow;
    }
  }
}
