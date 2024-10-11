import 'package:ecommerce/core/get_it/get_it.dart';
import 'package:ecommerce/core/routes_manager/route_generator.dart';
import 'package:ecommerce/core/routes_manager/routes.dart';
import 'package:ecommerce/core/services/network_service.dart';
import 'package:ecommerce/features/auth/presentation/manager/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;
final GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerFactory<AuthCubit>(() => AuthCubit());
  // Register other dependencies here...
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  prefs = await SharedPreferences.getInstance();
  Network.init();
  configureDependencies();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    String token = prefs.getString('token') ?? "";
    print("My token : $token");
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: child,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: token.isEmpty ? Routes.signInRoute : Routes.mainRoute,
      ),
    );
  }
}
