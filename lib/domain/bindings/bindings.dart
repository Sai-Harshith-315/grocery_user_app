import 'package:get/get.dart';
import 'package:grocery_user_app/domain/controllers/signup_controller.dart';
import '../../data/interfaces/auth_interfaces/auth_interface.dart';
import '../../data/services/firebase_auth_repo.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthInterface>(() => FirebaseAuthRepo());

    Get.lazyPut<SignupController>(
        () => SignupController(authServiceRepo: Get.find()));
  }
}
