import 'package:ecommerce/features/auth/data/repo/repo_imp.dart';
import 'package:ecommerce/features/auth/domain/repo/repo.dart';

import '../../data/models/auth_model.dart';

class SignUpUseCase {
  AuthRepo authRepo = AuthRepoImp();
  Future<AuthModel> call(
      {required String email,
      required String password,
      required String name,
      required String phone,
      required String rePassword}) async {
    return await authRepo.signUp(
        email: email,
        password: password,
        name: name,
        phone: phone,
        rePassword: rePassword);
  }
}
