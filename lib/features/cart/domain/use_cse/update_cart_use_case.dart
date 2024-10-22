import 'package:injectable/injectable.dart';

import '../repo/repo.dart';

@injectable
class UpdateCartUseCase {
  final CartRepo cartRepo;

  UpdateCartUseCase(this.cartRepo);

  Future<String> call({required String count}) async {
    return await cartRepo.updateCart(count: count);
  }
}
