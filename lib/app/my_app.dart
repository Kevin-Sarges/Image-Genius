import 'package:flutter/material.dart';
import 'package:image_genius/app/common/color/app_colors.dart';
import 'package:image_genius/app/common/routes/app_routes.dart';
import 'package:image_genius/app/features/home/presenter/home_screen.dart';
import 'package:image_genius/app/features/splash/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Genius',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.bluePrimary,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.initial: (context) => const SplashScreen(),
        AppRoutes.home: (context) => const HomeScreen(),
      },
    );
  }
}
