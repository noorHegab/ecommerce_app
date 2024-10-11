import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/features/auth/presentation/manager/cubit.dart';
import 'package:ecommerce/features/auth/presentation/manager/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/widget/main_text_field.dart';
import '../../../../../core/widget/validators.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  ProfileTabState createState() => ProfileTabState();
}

class ProfileTabState extends State<ProfileTab> {
  final Map<String, bool> readOnlyFields = {
    'fullName': true,
    'email': true,
    'password': true,
    'mobileNumber': true,
    'address': true,
  };

  @override
  void initState() {
    super.initState();
    final cubit = AuthCubit.get(context);
    cubit.loadUserData(); // Load user data on initialization
  }

  void toggleReadOnly(String field) {
    setState(() {
      readOnlyFields[field] = !readOnlyFields[field]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cubit = AuthCubit.get(context);

    return Padding(
      padding: const EdgeInsets.all(AppPadding.p20),
      child: SafeArea(
        child: SingleChildScrollView(
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is UpdateProfileSuccessState) {
                // Show success message
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Profile updated successfully")),
                );
              } else if (state is UpdateProfileErrorState) {
                // Show error message
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Error: ${state.error}")),
                );
              }
            },
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    SvgAssets.routeLogo,
                    height: AppSize.s40,
                    color: ColorManager.primary,
                  ),
                  SizedBox(height: AppSize.s20.h),
                  Text(
                    cubit.userName ?? "Nour",
                    style: getSemiBoldStyle(
                      color: ColorManager.primary,
                      fontSize: FontSize.s18,
                    ),
                  ),
                  Text(
                    cubit.userEmail ?? "Nour_hegab@gmail.com",
                    style: getRegularStyle(
                      color: ColorManager.primary.withOpacity(.5),
                      fontSize: FontSize.s14,
                    ),
                  ),
                  SizedBox(height: AppSize.s18.h),
                  BuildTextField(
                    borderBackgroundColor: ColorManager.primary.withOpacity(.5),
                    readOnly: readOnlyFields['fullName']!,
                    backgroundColor: ColorManager.white,
                    label: 'Full Name',
                    controller: cubit.nameController,
                    labelTextStyle: getMediumStyle(
                      color: ColorManager.primary,
                      fontSize: FontSize.s18,
                    ),
                    suffixIcon: IconButton(
                      icon: SvgPicture.asset(SvgAssets.edit),
                      onPressed: () => toggleReadOnly('fullName'),
                    ),
                    textInputType: TextInputType.text,
                    validation: AppValidators.validateFullName,
                    hintTextStyle: getRegularStyle(color: ColorManager.primary)
                        .copyWith(fontSize: 18.sp),
                  ),
                  SizedBox(height: AppSize.s18.h),
                  BuildTextField(
                    borderBackgroundColor: ColorManager.primary.withOpacity(.5),
                    readOnly: readOnlyFields['email']!,
                    backgroundColor: ColorManager.white,
                    label: 'E-mail address',
                    controller: cubit.emailController,
                    labelTextStyle: getMediumStyle(
                      color: ColorManager.primary,
                      fontSize: FontSize.s18,
                    ),
                    suffixIcon: IconButton(
                      icon: SvgPicture.asset(SvgAssets.edit),
                      onPressed: () => toggleReadOnly('email'),
                    ),
                    textInputType: TextInputType.emailAddress,
                    validation: AppValidators.validateEmail,
                    hintTextStyle: getRegularStyle(color: ColorManager.primary)
                        .copyWith(fontSize: 18.sp),
                  ),
                  SizedBox(height: AppSize.s18.h),
                  BuildTextField(
                    controller: cubit.passwordController,
                    borderBackgroundColor: ColorManager.primary.withOpacity(.5),
                    readOnly: readOnlyFields['password']!,
                    backgroundColor: ColorManager.white,
                    label: 'Password',
                    isObscured: true,
                    labelTextStyle: getMediumStyle(
                      color: ColorManager.primary,
                      fontSize: FontSize.s18,
                    ),
                    suffixIcon: IconButton(
                      icon: SvgPicture.asset(SvgAssets.edit),
                      onPressed: () => toggleReadOnly('password'),
                    ),
                    textInputType: TextInputType.text,
                    validation: AppValidators.validatePassword,
                    hintTextStyle: getRegularStyle(color: ColorManager.primary)
                        .copyWith(fontSize: 18.sp),
                  ),
                  SizedBox(height: AppSize.s18.h),
                  BuildTextField(
                    controller: cubit.phoneController,
                    borderBackgroundColor: ColorManager.primary.withOpacity(.5),
                    readOnly: readOnlyFields['mobileNumber']!,
                    backgroundColor: ColorManager.white,
                    label: 'Your mobile number',
                    labelTextStyle: getMediumStyle(
                      color: ColorManager.primary,
                      fontSize: FontSize.s18,
                    ),
                    suffixIcon: IconButton(
                      icon: SvgPicture.asset(SvgAssets.edit),
                      onPressed: () => toggleReadOnly('mobileNumber'),
                    ),
                    textInputType: TextInputType.phone,
                    validation: AppValidators.validatePhoneNumber,
                    hintTextStyle: getRegularStyle(color: ColorManager.primary)
                        .copyWith(fontSize: 18.sp),
                  ),
                  SizedBox(height: AppSize.s18.h),
                  BuildTextField(
                    controller: cubit
                        .emailController, // Corrected: use address controller
                    borderBackgroundColor: ColorManager.primary.withOpacity(.5),
                    readOnly: readOnlyFields['address']!,
                    backgroundColor: ColorManager.white,
                    label: 'Your Address',
                    labelTextStyle: getMediumStyle(
                      color: ColorManager.primary,
                      fontSize: FontSize.s18,
                    ),
                    suffixIcon: IconButton(
                      icon: SvgPicture.asset(SvgAssets.edit),
                      onPressed: () => toggleReadOnly('address'),
                    ),
                    textInputType: TextInputType.streetAddress,
                    validation: AppValidators.validateFullName,
                    hintTextStyle: getRegularStyle(color: ColorManager.primary)
                        .copyWith(fontSize: 18.sp),
                  ),
                  SizedBox(height: AppSize.s18.h),
                  ElevatedButton(
                    onPressed: () {
                      if (readOnlyFields.values
                          .every((isReadOnly) => isReadOnly)) {
                        // If all fields are read-only, enable them
                        toggleReadOnly('fullName');
                        toggleReadOnly('email');
                        toggleReadOnly('password');
                        toggleReadOnly('mobileNumber');
                        toggleReadOnly('address');
                      } else {
                        // If not all fields are read-only, update the user data
                        cubit.updateUserData(
                          email: cubit.emailController.text,
                          name: cubit.nameController.text,
                          phone: cubit.phoneController.text,
                          password: cubit.passwordController.text,
                        );
                      }
                    },
                    child: Text("Update Profile"),
                  ),
                  SizedBox(height: AppSize.s50.h),
                  ElevatedButton(
                    onPressed: () {
                      cubit.signOut(context);
                    },
                    child: Text("LOGOUT"),
                  ),
                  SizedBox(height: AppSize.s50.h),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
