import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/presentation/login/controller/login_controller.dart';
import 'package:getx_sample/presentation/signup/signup.dart';
import 'package:getx_sample/routes/app_routes.dart';
import 'package:getx_sample/utils/color_constant.dart';
import 'package:getx_sample/utils/dialog_utils.dart';
import 'package:getx_sample/utils/image_constant.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put( LoginController());
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Obx(()=> SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 90,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Hero(
                    tag: 'splash',
                    child: Image.asset(
                      ImageConstant.appLogo,
                      height: 150,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: PhysicalModel(
                  color: Colors.white,
                  elevation: 6,
                  shadowColor: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(13),
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 16, top: 8, right: 8, bottom: 8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          stops: const [0.02, 0.02],
                          colors: [ColorConstant.primary, Colors.white]),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(6.0),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome!",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: ColorConstant.text1),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: emailController,
                          autocorrect: false,
                          showCursor: true,
                          cursorColor: ColorConstant.secondary,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(color: ColorConstant.text1),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(
                                width: 2,
                                color: Colors.grey,
                              ),
                              //gapPadding: 10,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: ColorConstant.primary,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            suffixIcon: const Padding(
                              padding: EdgeInsets.only(right: 8.0, left: 8.0),
                              child: Icon(
                                CupertinoIcons.envelope,
                                size: 24,
                              ),
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (!GetUtils.isEmail(value!)) {
                              return "Enter Valid Email";
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: passwordController,
                          autocorrect: false,
                          showCursor: true,
                          cursorColor: ColorConstant.secondary,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: loginController.obscureText.value,
                          obscuringCharacter: '●',
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: ColorConstant.text1),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(
                                width: 2,
                                color: Colors.grey,
                              ),
                              //gapPadding: 10,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: ColorConstant.primary,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            suffixIcon: Padding(
                              padding:
                              const EdgeInsets.only(right: 0.0, left: 0.0),
                              child: IconButton(
                                icon: Icon(
                                  loginController.obscureText.value
                                      ? CupertinoIcons.eye_fill
                                      : CupertinoIcons.eye_slash_fill,
                                  size: 26,
                                ),
                                onPressed: () {
                                  print(loginController.obscureText.value);
                                  loginController.obscureText.value = !loginController.obscureText.value;

                                },
                              ),
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (!GetUtils.isLengthBetween(value!, 6, 100)) {
                              return "Enter Valid Password";
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                              onPressed: () async {
                                DialogUtils.errorDialog(
                                  context,
                                  'Must Enter Valid Email ',
                                );
                              },
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: ColorConstant.text1,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () async {
                    try {
                      DialogUtils.showProgressDialog();
                      final response = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                          email: emailController.text,
                          password: emailController.text);
                      print(response);
                      DialogUtils.hideProgressDialog();
                    } on FirebaseAuthException catch (e) {
                      DialogUtils.hideProgressDialog();
                      if (e.code == 'user-not-found') {
                        DialogUtils.errorDialog(
                            context, "No user found for that email.");
                      } else if (e.code == 'wrong-password') {
                        print('Wrong password provided for that user.');
                      }
                    } finally {}
                  },
                  child: Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            ColorConstant.primary,
                            ColorConstant.secondary,
                          ],
                        ),
                        color: ColorConstant.primary,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          bottomLeft: Radius.circular(40),
                        ),
                        boxShadow: [
                          BoxShadow(color: ColorConstant.gray100, spreadRadius: 2)
                        ]),
                    child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: ColorConstant.whiteA700),
                        )),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: const [
                    Expanded(
                      flex: 3,
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          'OR',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(
                    Icons.facebook,
                    color: Colors.blueAccent,
                    size: 50,
                  ),
                  Icon(
                    Icons.android_rounded,
                    color: Colors.green,
                    size: 50,
                  ),
                  Icon(
                    Icons.apple_rounded,
                    color: Colors.black,
                    size: 50,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('New Here?'),
                    TextButton(
                      onPressed: () {

                         loginController.navigateSignup();
                        //Get.toNamed(AppRoutes.signup);
                      },
                      child: const Text(
                        'Signup',
                        style: TextStyle(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
