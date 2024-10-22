import 'package:dio/dio.dart';

abstract class CartDataSource {
  Future<Response> getCart();
  Future<Response> updateCart({required String count});
  Future<Response> deleteCart({required String cartId});
}
