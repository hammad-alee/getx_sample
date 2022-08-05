import 'package:get/get.dart';
import 'package:getx_sample/presentation/login/login_scr.dart';
import 'package:getx_sample/presentation/signup/signup.dart';
import 'package:getx_sample/presentation/signup/signup_util/signup_binding.dart';
import 'package:getx_sample/presentation/splash_screen/binding/splash_binding.dart';
import 'package:getx_sample/presentation/splash_screen/splash_scr.dart';
import '../presentation/login/binding/login_binding.dart';

class AppRoutes {
  static String login = '/login_screen';

  static String signup = '/register_screen';

  static String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: initialRoute,
      page: () => const Splash(),
      bindings: [
        SplashBinding(),
      ],
      transition: Transition.rightToLeft,
      //transitionDuration: Duration(seconds: 2),
    ),
    GetPage(
      name: login,
      page: () => const Login(),
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: signup,
      page: () => const Signup(),
      bindings: [
        SignupBinding(),
      ],
    ),

  ];
}
