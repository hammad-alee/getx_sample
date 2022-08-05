
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';

import '../../../utils/color_constant.dart';
import '../signup.dart';

class SignupController extends GetxController
{
  Rx<Signup> homepageModelObj =  Signup().obs;
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


}