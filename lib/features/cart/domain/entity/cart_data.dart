class CartData {
  num numOfCartItems;
  CartEnti cart;
  CartData({required this.numOfCartItems, required this.cart});
}

class CartEnti {
  List<ProductDataEnt> products;
  num totalCartPrice;
  CartEnti({required this.products, required this.totalCartPrice});
}

class ProductDataEnt {
  num count;
  String title;
  num ratingsAverage;
  num price;
  num quantity;
  String imageCover;
  String id;

  ProductDataEnt(
      {required this.count,
      required this.title,
      required this.ratingsAverage,
      required this.price,
      required this.quantity,
      required this.imageCover,
      required this.id}) {
    price = price * count;
  }
}
