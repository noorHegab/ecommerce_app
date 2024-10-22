import 'package:injectable/injectable.dart';

import '../repo/repo.dart';

@injectable
class DeleteCartUseCase {
  final CartRepo cartRepo;

  DeleteCartUseCase(this.cartRepo);

  Future<String> call({required String cartId}) async {
    return await cartRepo.deleteCart(cartId: cartId);
  }
}
