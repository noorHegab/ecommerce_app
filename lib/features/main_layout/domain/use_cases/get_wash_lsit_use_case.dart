import 'package:ecommerce/features/products_screen/data/models/product_response.dart';
import 'package:injectable/injectable.dart';

import '../repo/repo.dart';

@injectable
class GetWashListUseCase {
  MainRepo mainRepo;
  GetWashListUseCase(this.mainRepo);

  Future<List<ProductData>> call() async {
    return await mainRepo.getWashList();
  }
}
