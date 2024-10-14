import 'package:get/get.dart';
import 'package:grocery_user_app/domain/controllers/signup_controller.dart';
import '../../data/repository/firebase_auth_repo.dart';
import '../repository/auth_service_repo.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthServiceRepo>(() => FirebaseAuthRepo());

    Get.lazyPut<SignupController>(
        () => SignupController(authServiceRepo: Get.find()));
  }
}
