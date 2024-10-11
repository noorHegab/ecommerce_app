import 'package:dio/dio.dart';
import 'package:ecommerce/core/services/network_service.dart';
import 'package:ecommerce/features/main_layout/data/data_source/data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MainDataSource)
class MainDataSourceImp implements MainDataSource {
  Network network;
  MainDataSourceImp(this.network);
  @override
  Future<Response> getAllCategory() async {
    return await network.get(path: "/api/v1/categories");
  }

  @override
  Future<Response> getAllBrands() async {
    return await network.get(path: "/api/v1/brands");
  }

  @override
  Future<Response> getWashList() async {
    return await network.get(path: "/api/v1/wishlist");
  }
}
