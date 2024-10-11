import 'package:ecommerce/features/main_layout/data/models/brands_response.dart';
import 'package:ecommerce/features/main_layout/data/models/category_response.dart';
import 'package:ecommerce/features/main_layout/domain/use_cases/get_all_brands_use_case.dart';
import 'package:ecommerce/features/main_layout/domain/use_cases/get_categories_use_case.dart';
import 'package:ecommerce/features/main_layout/domain/use_cases/get_wash_lsit_use_case.dart';
import 'package:ecommerce/features/main_layout/manager/state.dart';
import 'package:ecommerce/features/products_screen/data/models/product_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class MainCubit extends Cubit<MainState> {
  MainCubit(
      this._categoriesUseCase, this._brandsUseCase, this._getWashListUseCase)
      : super(InitState());
  static MainCubit get(context) => BlocProvider.of(context);

  final GetCategoriesUseCase _categoriesUseCase;
  final GetBrandsUseCase _brandsUseCase;
  final GetWashListUseCase _getWashListUseCase;
  List<CategoryData> categories = [];
  List<BrandData> brands = [];
  List<ProductData> washListProduct = [];

  Future<void> getAllCategories() async {
    emit(GetCategoryLoadingState());
    try {
      categories = await _categoriesUseCase.call();
      emit(GetCategorySuccessState());
    } catch (e) {
      emit(GetCategoryErrorState());
    }
  }

  Future<void> getAllBrands() async {
    emit(GetBrandsLoadingState());
    try {
      brands = await _brandsUseCase.call();
      emit(GetBrandsSuccessState());
    } catch (e) {
      emit(GetBrandsErrorState());
    }
  }

  Future<void> getWashList() async {
    emit(GetWashListLoadingState());
    try {
      washListProduct = await _getWashListUseCase.call();
      emit(GetWashListSuccessState());
    } catch (e) {
      emit(GetWashListErrorState());
    }
  }
}
