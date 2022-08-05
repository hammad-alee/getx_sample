import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../signup/signup.dart';
import '../login_scr.dart';

class LoginController extends GetxController {
  Rx<Login> homepageModelObj = const Login().obs;
  RxBool obscureText = true.obs;

  void navigateSignup() {
    Get.to(()=>  const Signup());
  }

  @override
  void onReady() {
    super.onReady();
    if (kDebugMode) {
      print('onReady');
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if (kDebugMode) {
      print('onInit -->');
    }
  }

  @override
  void onClose() {
    super.onClose();
    if (kDebugMode) {
      print('onClose');
    }
  }
}
