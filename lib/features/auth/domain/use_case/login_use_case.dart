import 'package:ecommerce/features/auth/data/repo/repo_imp.dart';
import 'package:ecommerce/features/auth/domain/repo/repo.dart';

import '../../data/models/auth_model.dart';

class LoginUseCase {
  AuthRepo authRepo = AuthRepoImp();
  Future<AuthModel> call(
      {required String email, required String password}) async {
    return await authRepo.login(email: email, password: password);
  }
}
