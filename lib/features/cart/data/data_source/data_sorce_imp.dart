import 'package:dio/dio.dart';
import 'package:ecommerce/core/services/network_service.dart';
import 'package:ecommerce/features/cart/data/data_source/data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartDataSource)
class CartDataSourceImp implements CartDataSource {
  final Network network;

  CartDataSourceImp(this.network);

  @override
  Future<Response> getCart() async {
    return await network.get(path: "/api/v1/cart");
  }

  // إضافة دالة لتحديث سلة التسوق
  @override
  Future<Response> updateCart({required String count}) async {
    return await network.put(
        path: "/api/v1/cart/", data: {"count": count} // استدعاء تحديث السلة
        );
  }

  @override
  Future<Response> deleteCart({required String cartId}) async {
    return await network.delete(
        path: "/api/v1/cart/", data: {"cartId": cartId} // استدعاء تحديث السلة
        );
  }
}
