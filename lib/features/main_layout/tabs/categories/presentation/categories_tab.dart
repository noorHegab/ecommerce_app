import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../manager/cubit.dart';
import 'widgets/sub_categories_list.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = MainCubit.get(context);
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p12, vertical: AppPadding.p12),
          child: Row(
            children: [
              // CategoriesList(),
              // SizedBox(
              //   width: AppSize.s16,
              // ),
              SubCategoriesList(
                categories: cubit.categories,
              )
            ],
          ),
        );
      },
    );
  }
}
