import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user_app/controllers/login_controller.dart';
import 'package:grocery_user_app/presentation/constants/colors.dart';
import 'package:grocery_user_app/routing/app_routes.dart';

import '../../../widgets/my_textFormField.dart';
import '../../../widgets/my_text_wiget.dart';
import '../../Home/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  final LoginController loginController = Get.find<LoginController>();
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
                  GestureDetector(
                    onTap: () {
                      //forgot password screen
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MyText(
                          text: 'Forgot password?',
                          color: grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        )
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
                        () => loginController.isLoading.value
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
                                      userPassword.text != '') {
                                    await loginController.login(
                                        userEmail.text, userPassword.text);
                                    // Get.to(() => const HomeScreen());
                                    Get.toNamed(AppRoutes.homeScreen);
                                  } else {
                                    print('Something went wrong');
                                  }
                                },
                                child: MyText(
                                  text: 'Login',
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
                        text: "Don't have an account? ",
                        color: grey,
                        fontSize: 14,
                      ),
                      //Login In
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.signupScreen);
                        },
                        child: MyText(
                          text: 'Signup',
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
