import 'package:get/get.dart';
import 'package:grocery_user_app/controllers/signup_controller.dart';
import '../data/interfaces/interfaces.dart';
import '../data/services/firebase_auth_repo.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Interfaces>(() => FirebaseAuthServices());

    Get.lazyPut<SignupController>(
        () => SignupController(interfaces: Get.find<Interfaces>()));
  }
}
