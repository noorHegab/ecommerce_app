import 'package:dio/dio.dart';

abstract class AuthDataSource {
  Future<Response> login({required String email, required String password});
  Future<Response> signUp(
      {required String email,
      required String password,
      required String name,
      required String phone,
      required String rePassword});

  Future<Response> updateUserData({
    required String password,
    required String email,
    required String name,
    required String phone,
  });
}
