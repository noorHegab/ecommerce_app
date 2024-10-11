import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/cart/domain/entity/cart_data.dart';

abstract class CartRepo {
  Future<Either<String, CartData>> getCart();
}
