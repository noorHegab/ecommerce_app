import 'package:ecommerce/core/get_it/get_it.dart';
import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/features/products_screen/presentation/manager/cubit.dart';
import 'package:ecommerce/features/products_screen/presentation/manager/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

class HeartButton extends StatelessWidget {
  final String id;
  HeartButton({super.key, required this.id});

  String heartIcon = IconsAssets.icHeart;

  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductCubit>(),
      child: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {
          if (state is AddWashListSuccessState) {
            toastification.show(
              context: context,
              title: Text(state.message),
              type: ToastificationType.success,
            );
          }
          print(state);
        },
        builder: (context, state) {
          var cubit = ProductCubit.get(context);
          return InkWell(
            // radius: 25,
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            onTap: () async {
              await cubit.addWashList(id: id);
              isClicked = !isClicked;
              heartIcon =
                  !isClicked ? IconsAssets.icHeart : IconsAssets.icClickedHeart;
            },
            child: Material(
              // borderRadius: BorderRadius.circular(2),
              color: ColorManager.white,
              elevation: 5,
              shape: const StadiumBorder(),
              shadowColor: ColorManager.black,
              child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: ImageIcon(
                    AssetImage(heartIcon),
                    color: ColorManager.primary,
                  )),
            ),
          );
        },
      ),
    );
  }
}
