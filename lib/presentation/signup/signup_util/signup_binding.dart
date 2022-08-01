
import 'package:get/get.dart';
import 'package:getx_sample/presentation/signup/signup_util/signup_controller.dart';

class SignupBinding extends Bindings
{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SignupController());
  }

}