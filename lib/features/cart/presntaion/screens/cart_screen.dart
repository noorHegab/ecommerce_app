import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/features/cart/presntaion/manager/cubit.dart';
import 'package:ecommerce/features/cart/presntaion/manager/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/get_it/get_it.dart';
import '../widgets/cart_item_widget.dart';
import '../widgets/total_price_and_checkout_botton.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CartCubit>()..getCart(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Cart',
            style: getMediumStyle(fontSize: 20, color: ColorManager.textColor),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: ImageIcon(
                AssetImage(IconsAssets.icSearch),
                color: ColorManager.primary,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: ImageIcon(
                AssetImage(IconsAssets.icCart),
                color: ColorManager.primary,
              ),
            ),
          ],
        ),
        body: BlocConsumer<CartCubit, CartState>(
          listener: (context, state) {
            if (state is CartDeleteSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Item deleted successfully')),
              );
              // إذا كنت بحاجة إلى تحديث قائمة العناصر بعد الحذف، يمكنك استدعاء getCart() مرة أخرى
              // Cubit.get(context).getCart();
            } else if (state is CartDeleteErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Failed to delete item')),
              );
            }
          },
          builder: (context, state) {
            var cubit = CartCubit.get(context);
            if (state is GetCartLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is GetCartSuccessState) {
              return Padding(
                padding: const EdgeInsets.all(AppPadding.p14),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) => CartItemWidget(
                          imagePath:
                              cubit.cartData?.cart.products[index].imageCover ??
                                  "",
                          title:
                              cubit.cartData?.cart.products[index].title ?? "",
                          price: cubit.cartData!.cart.products[index].price
                              .toInt(),
                          quantity: cubit
                              .cartData!.cart.products[index].quantity
                              .toInt(),
                          onDeleteTap: () {
                            cubit.deleteCart(
                                cubit.cartData!.cart.products[index].id);
                          },
                          onDecrementTap: (value) {},
                          onIncrementTap: (value) {},
                          size: 40,
                          color: Colors.black,
                          colorName: 'Black',
                        ),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: AppSize.s12.h),
                        itemCount: cubit.cartData!.cart.products.length,
                      ),
                    ),
                    TotalPriceAndCheckoutBotton(
                      totalPrice:
                          cubit.cartData?.cart?.totalCartPrice?.toInt() ?? 0,
                      checkoutButtonOnTap: () {},
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              );
            }
            return Center(child: Text('No items in the cart.'));
          },
        ),
      ),
    );
  }
}
