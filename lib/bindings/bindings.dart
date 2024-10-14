import 'package:get/get.dart';
import 'package:grocery_user_app/controllers/signup_controller.dart';
import '../data/services/firebase_auth_repo.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirebaseAuthServices>(() => FirebaseAuthServices());

    Get.lazyPut<SignupController>(
        () => SignupController(interfaces: Get.find<FirebaseAuthServices>()));
  }
}
