import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entity/cart_data.dart';
import '../repo/repo.dart';

@injectable
class GetCartUseCase {
  CartRepo cartRepo;
  GetCartUseCase(this.cartRepo);

  Future<Either<String, CartData>> call() async {
    return cartRepo.getCart();
  }
}
