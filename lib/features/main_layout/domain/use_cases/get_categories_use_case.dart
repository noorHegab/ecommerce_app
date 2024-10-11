import 'package:ecommerce/features/main_layout/data/models/category_response.dart';
import 'package:injectable/injectable.dart';

import '../repo/repo.dart';

@injectable
class GetCategoriesUseCase {
  MainRepo mainRepo;
  GetCategoriesUseCase(this.mainRepo);

  Future<List<CategoryData>> call() async {
    return await mainRepo.getAllCategory();
  }
}
