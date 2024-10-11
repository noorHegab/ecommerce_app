import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/widget/loading.dart';
import 'package:ecommerce/features/products_screen/presentation/manager/cubit.dart';
import 'package:ecommerce/features/products_screen/presentation/manager/state.dart';
import 'package:ecommerce/features/products_screen/presentation/widgets/custom_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/get_it/get_it.dart';
import '../../../../core/widget/home_screen_app_bar.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    ProductDataClass ids =
        ModalRoute.of(context)!.settings.arguments as ProductDataClass;
    return BlocProvider(
      create: (context) => getIt<ProductCubit>()
        ..getProducts(categoryId: ids.categoryId, brandId: ids.brandId),
      child: Scaffold(
        appBar: const HomeScreenAppBar(
          automaticallyImplyLeading: true,
        ),
        body: BlocConsumer<ProductCubit, ProductState>(
          buildWhen: (previous, current) {
            if (current is GetProductSuccessState) {
              return true;
            }
            return false;
          },
          listener: (context, state) {
            if (state is GetProductLoadingState) {
              Loading.show(context);
            }
            if (state is GetProductSuccessState) {
              Loading.hide(context);
            }
          },
          builder: (context, state) {
            var cubit = ProductCubit.get(context);
            return Padding(
              padding: const EdgeInsets.all(AppPadding.p16),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      itemCount: cubit.products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 7 / 10,
                      ),
                      itemBuilder: (context, index) {
                        var product = cubit.products[index];
                        return CustomProductWidget(
                          height: height,
                          width: width,
                          productData: product,
                          cubit: cubit,
                        );
                      },
                      scrollDirection: Axis.vertical,
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProductDataClass {
  String? categoryId;
  String? brandId;

  ProductDataClass(this.categoryId, this.brandId);
}
