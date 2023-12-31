import 'package:ecommerce_app/data/firebase/order_service.dart';
import 'package:ecommerce_app/data/firebase/products_service.dart';
import 'package:ecommerce_app/providers/auth_provider.dart';
import 'package:ecommerce_app/providers/category_provider.dart';
import 'package:ecommerce_app/providers/order_provider.dart';
import 'package:ecommerce_app/providers/products_provider.dart';
import 'package:ecommerce_app/providers/profiles_provider.dart';
import 'package:ecommerce_app/splash/splash_screen.dart';
import 'package:ecommerce_app/ui/route/routes.dart';
import 'package:ecommerce_app/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'data/firebase/auth_service.dart';
import 'data/firebase/category_service.dart';
import 'data/firebase/profile_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(firebaseServices: AuthService()),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (context) => ProductsProvider(ProductService()),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (context) =>
              ProfileProvider(profileService: ProfileService()),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (context) =>
              CategoryProvider(categoryService: CategoryService()),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (context) =>
              OrderProvider( OrderService()),
          lazy: true,
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          onGenerateRoute: AppRoute.generateRoute,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.myTheme,
          home: const SplashScreen(),
        );
      },
    );
  }
}
