import 'package:ecommerce/core/routes_manager/routes.dart';
import 'package:ecommerce/features/auth/domain/use_case/login_use_case.dart';
import 'package:ecommerce/features/auth/domain/use_case/update_user_data_use_case.dart';
import 'package:ecommerce/features/auth/presentation/manager/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart'; // استيراد SharedPreferences

import '../../../../main.dart';
import '../../domain/use_case/sign_up_use_case.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(InitState());

  static AuthCubit get(context) => BlocProvider.of(context);

  LoginUseCase loginUseCase = LoginUseCase();
  SignUpUseCase signUpUseCase = SignUpUseCase();
  UpdateUserDataUseCase updateUserDataUseCase = UpdateUserDataUseCase();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  String? userEmail;
  String? userPassword;
  String? userName;
  String? userPhone;

  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    userEmail = prefs.getString('userEmail');
    userPassword = prefs.getString('userPassword');
    userName = prefs.getString('userName');
    userPhone = prefs.getString('userPhone');

    // Set the text for the controllers
    emailController.text = userEmail ?? '';
    passwordController.text = userPassword ?? '';
    nameController.text = userName ?? '';
    phoneController.text = userPhone ?? '';

    print("This is my email : $userEmail");
    print("This is my email : $userName");
    emit(
        AuthLoadedState()); // Update the state to AuthLoadedState after loading data
  }

  Future<void> login() async {
    emit(LoginLoadingState());
    try {
      await loginUseCase.call(
          email: emailController.text, password: passwordController.text);

      // حفظ البيانات في SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('userEmail', emailController.text);
      prefs.setString('userPassword', passwordController.text);

      // تخزين البيانات في المتغيرات المحلية
      userEmail = emailController.text;
      userPassword = passwordController.text;

      emit(LoginSuccessState());
    } catch (e) {
      emit(LoginErrorState(e.toString()));
    }
  }

  Future<void> signUp() async {
    emit(SignUpLoadingState());
    try {
      userEmail = emailController.text;
      userPassword = passwordController.text;
      userName = nameController.text;
      userPhone = phoneController.text;

      await signUpUseCase.call(
          email: userEmail!,
          password: userPassword!,
          name: userName!,
          phone: userPhone!,
          rePassword: rePasswordController.text);

      // حفظ البيانات في SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('userEmail', userEmail!);
      prefs.setString('userPassword', userPassword!);
      prefs.setString('userName', userName!);
      prefs.setString('userPhone', userPhone!);

      emit(SignUpSuccessState());
    } catch (e) {
      emit(SignUpErrorState(e.toString()));
    }
  }

  Future<void> updateUserData({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    emit(UpdateProfileLoadingState());
    try {
      print('Updating user data: $name, $email, $phone, $password');

      await updateUserDataUseCase.call(
        email: email,
        name: name,
        phone: phone,
        password: password,
      );

      // Save data in SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('userEmail', email);
      prefs.setString('userName', name);
      prefs.setString('userPhone', phone);

      emit(UpdateProfileSuccessState());
    } catch (e) {
      print('Error updating user data: ${e.toString()}');
      emit(UpdateProfileErrorState(e.toString()));
    }
  }

  void signOut(context) {
    prefs.remove('token').then((value) {
      if (value) {
        Navigator.pushNamed(context, Routes.signInRoute);
      }
    });
  }
}
