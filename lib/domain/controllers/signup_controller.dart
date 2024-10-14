// ignore_for_file: avoid_print

import 'package:get/get.dart';

import '../../data/interfaces/auth_interfaces/auth_interface.dart';

class SignupController extends GetxController {
  final AuthInterface authServiceRepo;
  var isLoading = false.obs;

  SignupController({required this.authServiceRepo});

  //signup
  Future<void> signup(
    String email,
    String fullName,
    String phoneNumber,
    String password,
  ) async {
    try {
      isLoading.value = true;
      await authServiceRepo.signup(
        email,
        fullName,
        phoneNumber,
        password,
      );
      Get.snackbar('Success', "user signed up successfully");
    } catch (e) {
      Get.snackbar('Error', 'Failed to sign up');
      print("Error in the signup controller $e");
    } finally {
      isLoading.value = false;
    }
  }
}
