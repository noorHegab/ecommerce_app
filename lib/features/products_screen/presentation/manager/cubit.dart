import 'package:ecommerce/features/products_screen/domain/use_case/add_cart_use_case.dart';
import 'package:ecommerce/features/products_screen/domain/use_case/add_washlist_use_case.dart';
import 'package:ecommerce/features/products_screen/domain/use_case/get_product_use_case.dart';
import 'package:ecommerce/features/products_screen/presentation/manager/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/product_response.dart';

@injectable
class ProductCubit extends Cubit<ProductState> {
  ProductCubit(
      this._productUseCase, this._addWashListUseCase, this._addCartUseCase)
      : super(InitState());

  final GetProductUseCase _productUseCase;
  final AddWashListUseCase _addWashListUseCase;
  final AddCartUseCase _addCartUseCase;

  static ProductCubit get(context) => BlocProvider.of(context);

  List<ProductData> products = [];

  Future<void> getProducts({String? categoryId, String? brandId}) async {
    Future.delayed(const Duration(seconds: 1), () async {
      emit(GetProductLoadingState());
      try {
        products = await _productUseCase.call(
            categoryId: categoryId, brandId: brandId);
        emit(GetProductSuccessState());
      } catch (e) {
        emit(GetProductErrorState());
      }
    });
  }

  Future<void> addWashList({required String id}) async {
    Future.delayed(const Duration(seconds: 1), () async {
      emit(AddWashListLoadingState());
      try {
        String message = await _addWashListUseCase.call(id: id);
        emit(AddWashListSuccessState(message));
      } catch (e) {
        print(e);
        emit(AddWashListErrorState());
      }
    });
  }

  Future<void> addCart({required String id}) async {
    Future.delayed(const Duration(seconds: 1), () async {
      emit(AddCartLoadingState());
      try {
        String message = await _addCartUseCase.call(id: id);
        emit(AddCartSuccessState(message));
      } catch (e) {
        emit(AddCartErrorState());
      }
    });
  }
}
