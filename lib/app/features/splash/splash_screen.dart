import 'package:flutter/material.dart';
import 'package:image_genius/app/common/color/app_colors.dart';
import 'package:image_genius/app/common/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _carregandoApp();
    });
  }

  void _carregandoApp() async {
    Future.delayed(
        const Duration(
          seconds: 2,
        ), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.home,
        (_) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 30),
            CircularProgressIndicator(
              color: AppColors.white,
            )
          ],
        ),
      ),
    );
  }
}
