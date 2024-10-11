import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/widget/custom_elevated_button.dart';
import 'package:ecommerce/features/product_details/presentation/widgets/product_description.dart';
import 'package:ecommerce/features/product_details/presentation/widgets/product_item.dart';
import 'package:ecommerce/features/product_details/presentation/widgets/product_label.dart';
import 'package:ecommerce/features/product_details/presentation/widgets/product_rating.dart';
import 'package:ecommerce/features/product_details/presentation/widgets/product_slider.dart';
import 'package:ecommerce/features/products_screen/data/models/product_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var product = ModalRoute.of(context)!.settings.arguments as ProductData;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Product Details',
          style: getMediumStyle(color: ColorManager.appBarTitleColor)
              .copyWith(fontSize: 20.sp),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: ImageIcon(
                AssetImage(IconsAssets.icSearch),
                color: ColorManager.primary,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: ColorManager.primary,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 50.h),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ProductSlider(
                items: product.images!
                    .map((e) => ProductItem(
                          imageUrl: e,
                          id: product.id ?? "",
                        ))
                    .toList(),
                initialIndex: 0),
            SizedBox(
              height: 24.h,
            ),
            ProductLabel(
                productName: product.title ?? "",
                productPrice: 'EGP ${product.price ?? ""}'),
            SizedBox(
              height: 16.h,
            ),
            ProductRating(
                productBuyers: '${product.sold ?? ""}',
                productRating:
                    '${product.ratingsAverage ?? ""} (${product.ratingsQuantity ?? ""})'),
            SizedBox(
              height: 16.h,
            ),
            ProductDescription(productDescription: product.description ?? ""),
            // ProductSize(
            //   size: const [35, 38, 39, 40],
            //   onSelected: () {},
            // ),
            // SizedBox(
            //   height: 20.h,
            // ),
            // Text('Color',
            //     style: getMediumStyle(color: ColorManager.appBarTitleColor)
            //         .copyWith(fontSize: 18.sp)),
            // ProductColor(color: const [
            //   Colors.red,
            //   Colors.blueAccent,
            //   Colors.green,
            //   Colors.yellow,
            // ], onSelected: () {}),
            SizedBox(
              height: 48.h,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      'Total price',
                      style: getMediumStyle(
                              color: ColorManager.primary.withOpacity(.6))
                          .copyWith(fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text('EGP ${product.price ?? ""}',
                        style:
                            getMediumStyle(color: ColorManager.appBarTitleColor)
                                .copyWith(fontSize: 18.sp))
                  ],
                ),
                SizedBox(
                  width: 33.w,
                ),
                Expanded(
                  child: CustomElevatedButton(
                    label: 'Add to cart',
                    onTap: () {},
                    prefixIcon: Icon(
                      Icons.add_shopping_cart_outlined,
                      color: ColorManager.white,
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
