sealed class CartState {}

class InitState extends CartState {}

class GetCartSuccessState extends CartState {}

class GetCartErrorState extends CartState {}

class GetCartLoadingState extends CartState {}

class CartUpdateSuccessState extends CartState {
  final String message; // رسالة النجاح
  CartUpdateSuccessState(this.message);
}

class CartUpdateErrorState extends CartState {
  String error;
  CartUpdateErrorState(this.error);
}

class CartUpdateLoadingState extends CartState {}

class CartDeleteSuccessState extends CartState {
  final String message; // رسالة النجاح
  CartDeleteSuccessState(this.message);
}

class CartDeleteErrorState extends CartState {
  String error;
  CartDeleteErrorState(this.error);
}

class CartDeleteLoadingState extends CartState {}
