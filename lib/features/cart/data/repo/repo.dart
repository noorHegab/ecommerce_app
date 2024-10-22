import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/cart/data/data_source/data_source.dart';
import 'package:ecommerce/features/cart/data/models/cart_response.dart';
import 'package:ecommerce/features/cart/domain/entity/cart_data.dart';
import 'package:ecommerce/features/cart/domain/repo/repo.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRepo)
class CartRepoImp implements CartRepo {
  final CartDataSource dataSource;

  CartRepoImp(this.dataSource);

  @override
  Future<Either<String, CartData>> getCart() async {
    try {
      var response = await dataSource.getCart();

      if (response.statusCode == 200) {
        CartData data = CartResponse.fromJson(response.data);
        return Right(data);
      } else {
        return Left(response.data["message"] ?? "");
      }
    } catch (e, s) {
      if (kDebugMode) {
        print(e);
        print(s);
      }

      return Left(e.toString());
    }
  }

  @override
  Future<String> updateCart({required String count}) async {
    try {
      var response = await dataSource.updateCart(count: count);
      if (response.statusCode == 200) {
        return response.data["message"] ?? "";
      } else {
        throw response.data["message"];
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> deleteCart({required String cartId}) async {
    try {
      var response = await dataSource.deleteCart(cartId: cartId);
      if (response.statusCode == 200) {
        return response.data["message"] ?? "";
      } else {
        throw response.data["message"];
      }
    } catch (e) {
      rethrow;
    }
  }
}
