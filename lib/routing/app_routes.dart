import 'package:get/get.dart';
import 'package:grocery_user_app/presentation/features/Auth/screens/signup_screen.dart';

// Define your routes
class AppRoutes {
  static const String splashScreen = '/';
  static const String welcomeScreen = '/WelcomeScreen';
  static const String signupScreen = '/SignupScren';
  static const String homeScreen = '/HomeScreen';
  // static const String cartScreen = '/CartScreen';

  static final List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => const SignupScreen()),
  ];
}
