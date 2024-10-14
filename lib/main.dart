import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user_app/data/firebase_options.dart';
import 'package:grocery_user_app/routing/app_routes.dart';
import 'bindings/bindings.dart';

Future<void> main(List<String> args) async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AppBindings(),
      initialRoute: AppRoutes.signupScreen,
      getPages: AppRoutes.routes,

      // home: SignupScreen(),
    );
  }
}
