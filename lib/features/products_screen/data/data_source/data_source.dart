import 'package:dio/dio.dart';

abstract class ProductDataSource {
  Future<Response> getProducts({String? categoryId, String? brandId});
  Future<Response> addWashList({required String id});
  Future<Response> addCart({required String id});
}
