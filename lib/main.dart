import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:image_genius/app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();

  runApp(const MyApp());
}
