// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user_app/controllers/signup_controller.dart';
import 'package:grocery_user_app/presentation/features/Home/screens/home_screen.dart';
import 'package:grocery_user_app/presentation/widgets/my_textFormField.dart';
import 'package:grocery_user_app/presentation/widgets/my_text_wiget.dart';

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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: MyText(
            text: "Sign up screen",
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //full name
              CustomTextFormField(
                controller: userFullName,
                hintText: 'Full Name',
              ),
              const SizedBox(
                height: 10,
              ),
              //email
              CustomTextFormField(
                controller: userEmail,
                hintText: 'Email',
              ),
              const SizedBox(
                height: 10,
              ),
              //phone number
              CustomTextFormField(
                controller: userPhoneNumber,
                hintText: 'Phone Number',
              ),
              const SizedBox(
                height: 10,
              ),
              //password
              CustomTextFormField(
                controller: userPassword,
                hintText: 'Password',
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
      ),
    );
  }
}
