import 'package:ecommerce/features/auth/data/models/auth_model.dart';
import 'package:ecommerce/features/auth/data/repo/repo_imp.dart';
import 'package:ecommerce/features/auth/domain/repo/repo.dart';

class UpdateUserDataUseCase {
  AuthRepo authRepo = AuthRepoImp();
  Future<AuthModel> call({
    required String email,
    required String name,
    required String phone,
    required String password,
  }) async {
    return await authRepo.updateUserData(
        email: email, name: name, phone: phone, password: password);
  }
}
