import 'package:get/get.dart';
import 'package:grocery_user_app/controllers/login_controller.dart';
import 'package:grocery_user_app/controllers/signup_controller.dart';
import '../data/interfaces/interfaces.dart';
import '../data/repository/firebase_auth_repo.dart';
import '../data/services/firebase_auth_services.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Interfaces>(() => FirebaseAuthServices());
    Get.lazyPut<FirebaseAuthRepo>(
        () => FirebaseAuthRepo(interfaces: Get.find<Interfaces>()));

    Get.lazyPut<SignupController>(
        () => SignupController(firebaseAuthRepo: Get.find<FirebaseAuthRepo>()));
    Get.lazyPut<LoginController>(
        () => LoginController(firebaseAuthRepo: Get.find<FirebaseAuthRepo>()));
  }
}
