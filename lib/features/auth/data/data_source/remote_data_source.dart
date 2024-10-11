import 'package:dio/dio.dart';
import 'package:ecommerce/features/auth/data/data_source/data_source.dart';

import '../../../../core/services/network_service.dart';

class RemoteAuthDataSource implements AuthDataSource {
  final Network network = Network();

  @override
  Future<Response> login(
      {required String email, required String password}) async {
    return await network.post(
        path: "/api/v1/auth/signin",
        data: {"email": email, "password": password});
  }

  @override
  Future<Response> signUp(
      {required String email,
      required String password,
      required String name,
      required String phone,
      required String rePassword}) async {
    return await network.post(path: "/api/v1/auth/signup", data: {
      "name": name,
      "email": email,
      "password": password,
      "rePassword": rePassword,
      "phone": phone
    });
  }

  @override
  Future<Response> updateUserData({
    required String password,
    required String email,
    required String name,
    required String phone,
  }) async {
    // Use the put method for updating user data
    return await network.put(
        path: "/api/v1/users/changeMyPassword",
        data: {"name": name, "email": email, "phone": phone});
  }
}
