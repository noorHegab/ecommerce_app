sealed class CartState {}

class InitState extends CartState {}

class GetCartSuccessState extends CartState {}

class GetCartErrorState extends CartState {}

class GetCartLoadingState extends CartState {}
