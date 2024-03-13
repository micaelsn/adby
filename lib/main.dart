import 'package:defasio1_adby/src/core/app/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'src/presentation/pages/signup_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final controller = AppController();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: controller.lightTheme,
        builder: (_, value, w) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: value ? Colors.grey : Colors.blue,
            ),
            home: const SignupPage(),
          );
        });
  }
}
