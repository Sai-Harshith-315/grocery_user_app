import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user_app/domain/controllers/signup_controller.dart';
import 'package:grocery_user_app/presentation/features/Home/screens/home_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final SignupController signupController = Get.find<SignupController>();

  TextEditingController userEmail = TextEditingController();
  TextEditingController userFullName = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  TextEditingController userPhoneNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Sign up screen",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //full name
            TextField(
              controller: userFullName,
              decoration: const InputDecoration(
                hintText: 'Full Name',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //email
            TextField(
              controller: userEmail,
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            //phone number

            TextField(
              controller: userPhoneNumber,
              decoration: const InputDecoration(
                hintText: 'Phone Number',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //password
            TextField(
              controller: userPassword,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(
              () => signupController.isLoading.value
                  ? const CupertinoActivityIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        if (userEmail.text != '' &&
                            userFullName.text != '' &&
                            userPassword != '' &&
                            userPhoneNumber != '') {
                          await signupController.signup(
                            userFullName.text.trim(),
                            userEmail.text.trim(),
                            userPhoneNumber.text.trim(),
                            userPassword.text.trim(),
                          );
                          Get.to(() => HomeScreen());
                        } else {
                          print('Something went wrong');
                        }
                      },
                      child: const Text('Sign up'),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
