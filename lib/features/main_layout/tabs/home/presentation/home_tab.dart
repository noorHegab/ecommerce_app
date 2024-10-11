import 'dart:async';

import 'package:ecommerce/features/main_layout/manager/cubit.dart';
import 'package:ecommerce/features/main_layout/manager/state.dart';
import 'package:ecommerce/features/main_layout/tabs/home/presentation/widgets/custom_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/routes_manager/routes.dart';
import '../../../../products_screen/presentation/screens/products_screen.dart';
import 'widgets/custom_ads_widget.dart';
import 'widgets/custom_section_bar.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _currentIndex = 0;
  late Timer _timer;

  final List<String> adsImages = [
    ImageAssets.carouselSlider1,
    ImageAssets.carouselSlider2,
    ImageAssets.carouselSlider3,
  ];

  @override
  void initState() {
    super.initState();
    _startImageSwitching();
  }

  void _startImageSwitching() {
    _timer = Timer.periodic(const Duration(milliseconds: 2500), (Timer timer) {
      _currentIndex = (_currentIndex + 1) % adsImages.length;
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = MainCubit.get(context)
      ..getAllCategories()
      ..getAllBrands();
    return SingleChildScrollView(
      child: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            children: [
              CustomAdsWidget(
                adsImages: adsImages,
                currentIndex: _currentIndex,
                timer: _timer,
              ),
              Column(
                children: [
                  CustomSectionBar(sectionNname: 'Categories', function: () {}),
                  if (state is GetCategorySuccessState ||
                      state is GetBrandsSuccessState)
                    SizedBox(
                      height: 270.h,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var category = cubit.categories[index];
                          return CustomCategoryWidget(
                            image: category.image ?? "",
                            title: category.name ?? "",
                          );
                        },
                        itemCount: cubit.categories.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                      ),
                    ),
                  CustomSectionBar(sectionNname: 'Brands', function: () {}),
                  if (state is GetCategorySuccessState ||
                      state is GetBrandsSuccessState)
                    SizedBox(
                      height: 270.h,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var brand = cubit.brands[index];
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.productsScreenRoute,
                                  arguments: ProductDataClass(
                                      null, brand.id.toString()));
                            },
                            child: CustomCategoryWidget(
                              image: brand.image ?? "",
                              title: brand.name ?? "",
                            ),
                          );
                        },
                        itemCount: cubit.brands.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                      ),
                    ),
                  SizedBox(height: 12.h),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
