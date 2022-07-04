import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import '../network/network_info.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    //Get.put(PrefUtils());
    //Get.put(ApiClient());
    Connectivity connectivity = Connectivity();
    Get.put(NetworkInfo(connectivity));
  }
}
