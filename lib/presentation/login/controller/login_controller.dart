import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:getx_sample/presentation/splash_screen/splash_scr.dart';

import '../login_scr.dart';
class LoginController extends GetxController {
  Rx<Login> homepageModelObj = Login().obs;

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
    //if (kDebugMode) {
      print('onInit -->');
    //}
  }

    @override
    void onClose() {
      super.onClose();
      if (kDebugMode) {
        print('onClose');
      }
    }
  }

