import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/widget/home_screen_app_bar.dart';
import 'package:ecommerce/features/auth/presentation/manager/cubit.dart';
import 'package:ecommerce/features/main_layout/manager/cubit.dart';
import 'package:ecommerce/features/main_layout/tabs/categories/presentation/categories_tab.dart';
import 'package:ecommerce/features/main_layout/tabs/favourite/presentation/favourite_screen.dart';
import 'package:ecommerce/features/main_layout/tabs/home/presentation/home_tab.dart';
import 'package:ecommerce/features/main_layout/tabs/profile_tab/presentation/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/get_it/get_it.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;
  List<Widget> tabs = [
    const HomeTab(),
    const CategoriesTab(),
    const FavouriteScreen(),
    const ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<AuthCubit>()),
        BlocProvider(create: (context) => getIt<MainCubit>()), // MainCubit
        // AuthCubit
      ],
      child: Scaffold(
        appBar: const HomeScreenAppBar(),
        extendBody: false,
        body: tabs[currentIndex],
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (value) => changeSelectedIndex(value),
              backgroundColor: ColorManager.primary,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: ColorManager.primary,
              unselectedItemColor: ColorManager.white,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                CustomBottomNavBarItem(IconsAssets.icHome, "Home"),
                CustomBottomNavBarItem(IconsAssets.icCategory, "Category"),
                CustomBottomNavBarItem(IconsAssets.icWithList, "WishList"),
                CustomBottomNavBarItem(IconsAssets.icProfile, "Profile"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void changeSelectedIndex(int selectedIndex) {
    setState(() {
      currentIndex = selectedIndex;
    });
  }
}

class CustomBottomNavBarItem extends BottomNavigationBarItem {
  final String iconPath;
  final String title;

  CustomBottomNavBarItem(this.iconPath, this.title)
      : super(
          label: title,
          icon: ImageIcon(
            AssetImage(iconPath),
            color: ColorManager.white,
          ),
          activeIcon: CircleAvatar(
            backgroundColor: ColorManager.white,
            child: ImageIcon(
              AssetImage(iconPath),
              color: ColorManager.primary,
            ),
          ),
        );
}
