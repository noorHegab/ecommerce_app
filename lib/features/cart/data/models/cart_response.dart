import 'package:ecommerce/features/cart/domain/entity/cart_data.dart';

class CartResponse extends CartData {
  CartResponse({
    required super.numOfCartItems,
    required super.cart,
  });

  factory CartResponse.fromJson(dynamic json) {
    return CartResponse(
        numOfCartItems: json['numOfCartItems'],
        cart: Cart.fromJson(json["data"]));
  }
}

class Cart extends CartEnti {
  Cart({
    required super.products,
    required super.totalCartPrice,
  });

  factory Cart.fromJson(dynamic json) {
    List<Product> products = [];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products.add(Product.fromJson(v));
      });
    }
    return Cart(products: products, totalCartPrice: json['totalCartPrice']);
  }
}

class Product extends ProductDataEnt {
  Product({
    required super.id,
    required super.title,
    required super.quantity,
    required super.imageCover,
    required super.ratingsAverage,
    required super.count,
    required super.price,
  });

  factory Product.fromJson(dynamic json) {
    return Product(
        id: json['product']['_id'],
        title: json['product']['title'],
        quantity: json['product']['quantity'],
        imageCover: json['product']['imageCover'],
        ratingsAverage: json['product']['ratingsAverage'],
        count: json['count'],
        price: json['price']);
  }
}
