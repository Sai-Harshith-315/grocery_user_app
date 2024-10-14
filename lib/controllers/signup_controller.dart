// ignore_for_file: avoid_print

import 'package:get/get.dart';

import '../data/interfaces/interfaces.dart';

class SignupController extends GetxController {
  final Interfaces interfaces;
  var isLoading = false.obs;
  var toggleIcon = false.obs;

  SignupController({required this.interfaces});

  //signup
  Future<void> signup(
    String email,
    String fullName,
    String phoneNumber,
    String password,
  ) async {
    try {
      isLoading.value = true;
      await interfaces.signup(
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
