import 'package:dio/dio.dart';

abstract class CartDataSource {
  Future<Response> getCart();
}
