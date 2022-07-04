import 'package:get/get.dart';
import 'package:getx_sample/presentation/splash_screen/binding/splash_binding.dart';
import 'package:getx_sample/presentation/splash_screen/splash_scr.dart';

class AppRoutes {
  static String homepageScreen = '/homepage_screen';

  static String userProfileScreen = '/user_profile_screen';

  static String chatsScreen = '/chats_screen';

  static String appNavigationScreen = '/app_navigation_screen';

  static String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: initialRoute,
      page: () => Splash(),
      bindings: [
        SplashBinding(),
      ],
    ),

  ];
}
