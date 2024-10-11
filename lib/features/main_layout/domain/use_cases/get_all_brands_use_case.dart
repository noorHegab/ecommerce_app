import 'package:injectable/injectable.dart';

import '../../data/models/brands_response.dart';
import '../repo/repo.dart';

@injectable
class GetBrandsUseCase {
  MainRepo mainRepo;
  GetBrandsUseCase(this.mainRepo);

  Future<List<BrandData>> call() async {
    return await mainRepo.getAllBrands();
  }
}
