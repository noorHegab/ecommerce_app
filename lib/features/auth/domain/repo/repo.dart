import 'package:ecommerce/features/auth/data/models/auth_model.dart';

abstract class AuthRepo {
  Future<AuthModel> login({required String email, required String password});
  Future<AuthModel> signUp(
      {required String email,
      required String password,
      required String name,
      required String phone,
      required String rePassword});

  Future<AuthModel> updateUserData({
    required String email,
    required String name,
    required String phone,
    required String password,
  });
}
