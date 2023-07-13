import 'package:flutter/material.dart';
import 'package:image_genius/app/common/routes/app_routes.dart';
import 'package:image_genius/app/features/home/presenter/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Genius',
      routes: {
        AppRoutes.initial: (context) => const HomeScreen(),
      },
    );
  }
}
