import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCategoryWidget extends StatelessWidget {
  final String image, title;
  const CustomCategoryWidget(
      {required this.image, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          // CachedNetworkImage(
          //   height: 100,
          //   width: 100,
          //   fit: BoxFit.cover,
          //   imageUrl: ImageAssets.categoryHomeImage,
          //   placeholder: (context, url) =>
          //       const Center(child: CircularProgressIndicator()),
          //   errorWidget: (context, url, error) =>
          //       const Center(child: Icon(Icons.error)),
          //   imageBuilder: (context, imageProvider) {
          //     return Container(
          //       decoration: BoxDecoration(
          //         shape: BoxShape.circle,
          //         image: DecorationImage(
          //           image: imageProvider,
          //           fit: BoxFit.cover,
          //         ),
          //       ),
          //     );
          //   },
          // ),
          ClipRRect(
            borderRadius: BorderRadius.circular(100.r),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: CachedNetworkImage(
                height: 100.h,
                width: 100.w,
                imageUrl: image,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.error)),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Expanded(
            child: Text(
              title,
              style: getRegularStyle(
                  color: ColorManager.darkBlue, fontSize: 14.sp),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
