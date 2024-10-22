import 'package:ecommerce/features/cart/domain/use_cse/delete_cart_use_case.dart';
import 'package:ecommerce/features/cart/domain/use_cse/get_cart_use_case.dart';
import 'package:ecommerce/features/cart/domain/use_cse/update_cart_use_case.dart';
import 'package:ecommerce/features/cart/presntaion/manager/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entity/cart_data.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  CartCubit(
      this._getCartUseCase, this._updateCartUseCase, this._deleteCartUseCase)
      : super(InitState());

  static CartCubit get(context) => BlocProvider.of(context);

  final GetCartUseCase _getCartUseCase;
  final UpdateCartUseCase _updateCartUseCase;
  final DeleteCartUseCase _deleteCartUseCase;

  CartData? cartData;

  // Get Cart
  Future<void> getCart() async {
    emit(GetCartLoadingState());
    var result = await _getCartUseCase.call();
    result.fold((fail) {
      emit(GetCartErrorState());
    }, (data) {
      cartData = data;
      emit(GetCartSuccessState());
    });
  }

  // Update Cart
  Future<void> updateCart(String count) async {
    emit(CartUpdateLoadingState());

    try {
      var message = await _updateCartUseCase.call(count: count);
      emit(CartUpdateSuccessState(message.toString()));
    } catch (e) {
      emit(CartUpdateErrorState(e.toString()));
    }
  }

  // Delete Cart Item

  Future<void> deleteCart(String cartId) async {
    emit(CartDeleteLoadingState());

    try {
      var message = await _deleteCartUseCase.call(cartId: cartId);
      emit(CartDeleteSuccessState(message.toString()));

      if (cartData != null) {
        var productToRemove = cartData!.cart.products.firstWhere(
            (product) => product.id == cartId,
            orElse: () => ProductDataEnt(
                count: 0,
                title: '',
                ratingsAverage: 0,
                price: 0,
                quantity: 0,
                imageCover: '',
                id: ''));

        if (productToRemove.count > 0) {
          cartData!.cart.products.remove(productToRemove);

          cartData!.cart.totalCartPrice -= productToRemove.price;
          cartData!.numOfCartItems -= 1;

          emit(GetCartSuccessState());
        } else {
          emit(CartDeleteErrorState("Product not found in cart"));
        }
      }
    } catch (e) {
      emit(CartDeleteErrorState(e.toString()));
    }
  }
}

// void onDeleteCartItem(String cartId) {
//   deleteCart(cartId);
// }
