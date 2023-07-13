import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:image_genius/app/features/home/domain/inject/inject_dependency.dart';
import 'package:image_genius/app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  await FlutterConfig.loadEnvVariables();

  InjectDependency.init();
  runApp(const MyApp());
}
