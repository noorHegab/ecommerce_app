import 'package:dio/dio.dart';

abstract class MainDataSource {
  Future<Response> getAllCategory();
  Future<Response> getAllBrands();
  Future<Response> getWashList();
}
