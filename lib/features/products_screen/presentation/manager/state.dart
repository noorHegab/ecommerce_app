abstract class ProductState {}

class InitState extends ProductState {}

class GetProductSuccessState extends ProductState {}

class GetProductErrorState extends ProductState {}

class GetProductLoadingState extends ProductState {}

class AddWashListSuccessState extends ProductState {
  String message;
  AddWashListSuccessState(this.message);
}

class AddWashListErrorState extends ProductState {}

class AddWashListLoadingState extends ProductState {}

class AddCartSuccessState extends ProductState {
  String message;
  AddCartSuccessState(this.message);
}

class AddCartErrorState extends ProductState {}

class AddCartLoadingState extends ProductState {}
