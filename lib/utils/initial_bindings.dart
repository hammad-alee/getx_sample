import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:getx_sample/presentation/login/controller/login_controller.dart';
import 'package:getx_sample/presentation/signup/signup_util/signup_controller.dart';
import '../network/network_info.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    //Get.put(PrefUtils());
    //Get.put(LoginController());
    //Get.put(SignupController());
    Connectivity connectivity = Connectivity();
    Get.put(NetworkInfo(connectivity));
  }
}
