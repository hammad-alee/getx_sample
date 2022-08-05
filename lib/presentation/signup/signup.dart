import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/presentation/signup/signup_util/signup_controller.dart';
import 'package:getx_sample/utils/color_constant.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:lottie/lottie.dart';
import '../../utils/dialog_utils.dart';
import '../../utils/helping_function.dart';
import '../../utils/image_constant.dart';

class Signup extends StatelessWidget {
   const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignupController signupController = Get.put(SignupController());
    return Scaffold(
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 90,
              ),
              Container(
                height: 180,
                child: Center(
                  child: Stack(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: ColorConstant.primary,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        child: Image.asset(ImageConstant.personIcon),
                      ),
                      // ClipOval(
                      //     child: Material(
                      //       color: Colors.transparent,
                      //       // child: imageFile != null
                      //       //     ? Image.file(
                      //       //   imageFile!,
                      //       //   width: 120,
                      //       //   height: 120,
                      //       //   fit: BoxFit.cover,
                      //       // )
                      //       //     : CachedNetworkImage(
                      //       //   height: 120,
                      //       //   width: 120,
                      //       //   fit: BoxFit.fill,
                      //       //   placeholder: (context, url) {
                      //       //     return Lottie.asset(
                      //       //         'assets/anim/load_image.json');
                      //       //   },
                      //       //   imageUrl: App.buyerImagesUrl,
                      //       //   errorWidget: (context, url, error) {
                      //       //     return Image.asset(
                      //       //       'assets/images/user.png',
                      //       //       fit: BoxFit.cover,
                      //       //       width: 120,
                      //       //       height: 120,
                      //       //     );
                      //       //   },
                      //       // ),
                      //     ),
                      //   ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () {
                              DialogUtils.infoTwoButtonDialog(
                                  context,
                                  'Choose Image Source!',
                                  'Capture Image From Camera OR Photo Library',
                                  () async {
                                Navigator.pop(context);
                                final imgFile = await Functions.pickMedia(
                                  isGallery: true,
                                );
                                if (imgFile == null) return;
                                signupController.imageFile = imgFile as File;
                                final bytes =
                                    File(imgFile.path).readAsBytesSync();

                                // img64 = base64Encode(bytes);
                                // updateProfilePicture();
                              }, () async {
                                Navigator.pop(context);
                                final imgFile = await Functions.pickMedia(
                                  isGallery: false,
                                );
                                if (imgFile == null) return;
                                //signupController.imageFile = imgFile as File;
                                final bytes =
                                    File(imgFile.path).readAsBytesSync();
                                // img64 = base64Encode(bytes);
                                // updateProfilePicture();
                              }, Platform.isIOS ? 'Photo Library' : 'Gallery',
                                  'Camera');
                            },
                            child: ClipOval(
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    border: Border.all(
                                        color: ColorConstant.primary),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color(0xff000000),
                                        offset: Offset(2, 2),
                                        blurRadius: 8,
                                      )
                                    ]),
                                child: Icon(
                                  Icons.add_a_photo,
                                  color: ColorConstant.secondary,
                                  size: 20,
                                ),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
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
                          "Register New Account!",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: ColorConstant.text1),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: signupController.nameController,
                          autocorrect: false,
                          showCursor: true,
                          cursorColor: ColorConstant.secondary,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Name',
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
                                CupertinoIcons.person,
                                size: 24,
                              ),
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Must Enter Name";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: signupController.emailController,
                          autocorrect: false,
                          showCursor: true,
                          textInputAction: TextInputAction.next,
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
                          controller: signupController.passwordController,
                          autocorrect: false,
                          showCursor: true,
                          textInputAction: TextInputAction.done,
                          cursorColor: ColorConstant.secondary,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: signupController.obscureText.value,
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
                                  signupController.obscureText.value
                                      ? CupertinoIcons.eye
                                      : CupertinoIcons.eye_slash,
                                  size: 26,
                                ),
                                onPressed: () {
                                  // print(loginController.obscureText.value);
                                  signupController.obscureText.value =
                                      !signupController.obscureText.value;
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
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () async {
                    try {
                      DialogUtils.showProgressDialog();
                      final response = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: signupController.emailController.text,
                              password:
                                  signupController.passwordController.text);
                      if (kDebugMode) {
                        print(response);
                      }
                      DialogUtils.hideProgressDialog();
                    } on FirebaseAuthException catch (e) {
                      DialogUtils.hideProgressDialog();
                      if (kDebugMode) {
                        print("Error: ${e.message}");
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
                          topRight: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: ColorConstant.gray100, spreadRadius: 2)
                        ]),
                    child: Center(
                        child: Text(
                      'Signup',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: ColorConstant.whiteA700),
                    )),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    TextButton(
                      onPressed: () {
                        // loginController.navigateSignup();
                        //Get.toNamed(AppRoutes.signup);
                      },
                      child: const Text(
                        'Login',
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
