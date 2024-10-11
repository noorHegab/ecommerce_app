import 'package:ecommerce/features/products_screen/domain/repo/repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddWashListUseCase {
  ProductRepo repo;
  AddWashListUseCase(this.repo);

  Future<String> call({required String id}) async {
    return await repo.addWashList(id: id);
  }
}
