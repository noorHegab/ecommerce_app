import 'package:dio/dio.dart';
import 'package:ecommerce/core/services/network_service.dart';
import 'package:ecommerce/features/products_screen/data/data_source/data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductDataSource)
class ProductDataSourceImp implements ProductDataSource {
  Network network;
  ProductDataSourceImp(this.network);
  @override
  Future<Response> getProducts({String? categoryId, String? brandId}) async {
    return await network.get(path: "/api/v1/products", queryParameters: {
      if (categoryId != null) "category[in]": categoryId,
      if (brandId != null) "brand": brandId,
    });
  }

  @override
  Future<Response> addWashList({required String id}) async {
    return await network
        .post(path: "/api/v1/wishlist", data: {"productId": id});
  }

  @override
  Future<Response> addCart({required String id}) async {
    return await network.post(path: "/api/v1/cart", data: {"productId": id});
  }
}
