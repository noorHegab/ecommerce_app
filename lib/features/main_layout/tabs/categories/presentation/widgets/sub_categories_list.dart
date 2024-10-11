import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/features/main_layout/data/models/category_response.dart';
import 'package:ecommerce/features/main_layout/tabs/categories/presentation/widgets/category_card_item.dart';
import 'package:ecommerce/features/products_screen/presentation/screens/products_screen.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/routes_manager/routes.dart';
import 'sub_category_item.dart';

class SubCategoriesList extends StatelessWidget {
  final List<CategoryData> categories;
  const SubCategoriesList({required this.categories, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: CustomScrollView(
        slivers: <Widget>[
          // category title
          SliverToBoxAdapter(
            child: Text(
              'Laptops & Electronics',
              style: getBoldStyle(
                  color: ColorManager.primary, fontSize: FontSize.s14),
            ),
          ),
          // the category card
          SliverToBoxAdapter(
            child: CategoryCardItem("Laptops & Electronics",
                ImageAssets.categoryCardImage, goToCategoryProductsListScreen),
          ),
          // the grid view of the subcategories
          SliverGrid(
              delegate: SliverChildBuilderDelegate(
                childCount: categories.length,
                (context, index) => SubCategoryItem(
                    categories[index].name ?? "", categories[index].image ?? "",
                    () {
                  Navigator.pushNamed(context, Routes.productsScreenRoute,
                      arguments: ProductDataClass(
                          categories[index].id.toString(), null));
                }),
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.75,
                mainAxisSpacing: AppSize.s8,
                crossAxisSpacing: AppSize.s8,
              ))
        ],
      ),
    );
  }

  goToCategoryProductsListScreen() {
    // todo implement this function
  }
}
