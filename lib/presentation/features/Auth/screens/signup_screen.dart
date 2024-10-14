// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user_app/controllers/signup_controller.dart';
import 'package:grocery_user_app/presentation/constants/colors.dart';
import 'package:grocery_user_app/presentation/features/Home/screens/home_screen.dart';
import 'package:grocery_user_app/presentation/widgets/my_textFormField.dart';
import 'package:grocery_user_app/presentation/widgets/my_text_wiget.dart';
import 'package:grocery_user_app/routing/app_routes.dart';

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
        backgroundColor: white,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //sign up text
                  MyText(
                    text: 'Sign Up',
                    color: black,
                    fontSize: 20,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyText(
                    text: 'Enter your credentials to continue',
                    color: grey,
                    fontSize: 14,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  //full name
                  CustomTextFormField(
                    controller: userFullName,
                    hintText: 'Enter Name',
                    label: MyText(
                      text: 'Username',
                      color: grey,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //email
                  CustomTextFormField(
                    controller: userEmail,
                    hintText: 'Enter Email',
                    label: MyText(
                      text: 'Email',
                      color: grey,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  //password
                  CustomTextFormField(
                    controller: userPassword,
                    hintText: 'Enter Password',
                    label: MyText(
                      text: 'Password',
                      color: grey,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  RichText(
                    text: const TextSpan(
                      text: 'By Continuing you agree to our ', // Default text
                      style: TextStyle(
                        color: grey,
                        fontSize: 14,
                      ), // Default style
                      children: [
                        TextSpan(
                          text: 'Terms of Service', // First clickable text
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 14,
                          ), // Make it green
                        ),
                        TextSpan(
                          text: ' and ', // Default text
                          style: TextStyle(
                            color: grey,
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: 'Privacy Policy', // Second clickable text
                          style:
                              TextStyle(color: Colors.green), // Make it green
                        ),
                        TextSpan(
                          text: '.', // Default text
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(
                        () => signupController.isLoading.value
                            ? const CupertinoActivityIndicator()
                            : MaterialButton(
                                height: 70,
                                minWidth:
                                    MediaQuery.of(context).size.width * .85,
                                color: greencolor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                onPressed: () async {
                                  if (userEmail.text != '' &&
                                      userFullName.text != '' &&
                                      userPassword != '' &&
                                      userPhoneNumber != '') {
                                    await signupController.signup(
                                      userEmail.text.trim(),
                                      userFullName.text.trim(),
                                      userPhoneNumber.text.trim(),
                                      userPassword.text.trim(),
                                    );
                                    // Get.to(() => const HomeScreen());
                                    Get.toNamed(AppRoutes.homeScreen);
                                  } else {
                                    print('Something went wrong');
                                  }
                                },
                                child: MyText(
                                  text: 'Sign up',
                                  color: white,
                                  fontSize: 14,
                                ),
                              ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyText(
                        text: 'Already have an account? ',
                        color: grey,
                        fontSize: 14,
                      ),
                      //Login In
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.loginScreen);
                        },
                        child: MyText(
                          text: 'Login',
                          color: greencolor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
