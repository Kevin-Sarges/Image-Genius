import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_genius/app/features/home/domain/inject/inject_dependency.dart';
import 'package:image_genius/app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  await dotenv.load(fileName: '.env');

  InjectDependency.init();
  runApp(const MyApp());
}
