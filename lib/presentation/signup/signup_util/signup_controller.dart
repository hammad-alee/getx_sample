
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../signup.dart';

class SignupController extends GetxController
{
  Rx<Signup> homepageModelObj = const Signup().obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
   RxBool obscureText = true.obs;
  @override
  void onInit() {

  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
  @override
  // TODO: implement onStart
  InternalFinalCallback<void> get onStart => super.onStart;
}