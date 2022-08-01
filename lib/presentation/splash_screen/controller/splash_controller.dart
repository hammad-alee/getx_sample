import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';
import 'package:getx_sample/presentation/login/login_scr.dart';
import 'package:getx_sample/presentation/splash_screen/splash_scr.dart';
class SplashController extends GetxController {
  Rx<Splash> homepageModelObj = const Splash().obs;

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
    Timer(const Duration(seconds: 6), ()
          {
            print('Navigate to Login');
            Get.off(()=> const Login());
          });
  }

    @override
    void onClose() {
      super.onClose();
      if (kDebugMode) {
        print('onClose');
      }
    }
  }

