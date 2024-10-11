import 'package:ecommerce/features/auth/data/data_source/data_source.dart';
import 'package:ecommerce/features/auth/data/data_source/remote_data_source.dart';
import 'package:ecommerce/features/auth/data/models/auth_model.dart';
import 'package:ecommerce/features/auth/domain/repo/repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepoImp implements AuthRepo {
  AuthDataSource dataSource = RemoteAuthDataSource();
  @override
  Future<AuthModel> login(
      {required String email, required String password}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      var response = await dataSource.login(email: email, password: password);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var authModel = AuthModel.fromJson(response.data);
        prefs.setString("token", authModel.token ?? "");
        return authModel;
      } else {
        throw response.data["message"];
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthModel> signUp(
      {required String email,
      required String password,
      required String name,
      required String phone,
      required String rePassword}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      var response = await dataSource.signUp(
          email: email,
          password: password,
          name: name,
          phone: phone,
          rePassword: rePassword);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var authModel = AuthModel.fromJson(response.data);
        prefs.setString("token", authModel.token ?? "");

        return authModel;
      } else {
        throw response.data["message"];
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthModel> updateUserData({
    required String email,
    required String name,
    required String phone,
    required String password,
  }) async {
    // تحديث بيانات المستخدم
    var response = await dataSource.updateUserData(
      email: email,
      name: name,
      phone: phone,
      password: password,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      var authModel = AuthModel.fromJson(response.data);
      // تحديث التوكن في SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("token", authModel.token ?? "");
      return authModel;
    } else {
      throw response.data["message"];
    }
  }
}
