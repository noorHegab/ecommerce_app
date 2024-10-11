import 'package:ecommerce/features/products_screen/domain/repo/repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddCartUseCase {
  ProductRepo repo;
  AddCartUseCase(this.repo);

  Future<String> call({required String id}) async {
    return await repo.addCart(id: id);
  }
}
