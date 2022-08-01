import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/presentation/login/controller/login_controller.dart';
import 'package:getx_sample/presentation/login/login_scr.dart';
import 'package:getx_sample/routes/app_routes.dart';
import 'package:getx_sample/utils/image_constant.dart';

import '../../utils/get_controller.dart';
import 'controller/splash_controller.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {


  @override
  Widget build(BuildContext context) {

    final SplashController c = Get.put(SplashController());
    //Controller yourController = Get.find<Controller>();
    return Scaffold(
      // appBar: AppBar(title: Obx(() => Text(c.count.toString()))),
      // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Hero(tag: 'splash', child: Image.asset(ImageConstant.appLogo))
            /* ElevatedButton(
                    child: Text("Go to Other"), onPressed: () => Get.to(Other())),
                SizedBox.fromSize(size: Size(100, 20)),
                ElevatedButton(
                    child: Text("Success Dialog"), onPressed: () => {
                     DialogUtils.successDialog(context, "Signup Successfully! Login to use App features.")
                }),
                ElevatedButton(onPressed: ()
                async {
                  var jsonData = {
                    'DocType': 'GetCountSum',
                    'DocDate': DateTime.now().toString(),
                    'AppType': Platform.isIOS ? 'IOS' : 'Android',
                    'UserName': '042784255379',
                    'Password': '042784255379',
                    'LastDate': '1970-01-01 00:00:00'
                  };

                  var req = await Functions.sendJson(jsonData,  'splashcountget');
                  print(req);

                }, child: Text('Send Request'))*/
          ],
        ),
      ),
    );
  }
  //
  // Future<void> simulateStartUp() async {
  //   // if (await App.isConnected() == false) {
  //   //   App.errorDialog(
  //   //     context,
  //   //     'Internet Connection not Available. Please Check Wifi or Mobile Data.',
  //   //   );
  //   //   return;
  //   // }
  //   // await App.instance.database;
  //   // App.userName = '042784255379';
  //   // App.password = '042784255379';
  //   // var msgResult = "start";
  //   // var db = await App.instance.database;
  //   // var currencyR = await db.rawQuery(
  //   //     'SELECT SettingValue FROM AppSetting WHERE SettingName = "CurrencyName" ');
  //   // var currencyID = await db.rawQuery(
  //   //     'SELECT SettingValue FROM AppSetting WHERE SettingName = "CurrencyID" ');
  //   // setState(() {
  //   //   if ((currencyR[0]['SettingValue']).toString() != '') {
  //   //     App.currencyName.value = (currencyR[0]['SettingValue']).toString();
  //   //     var zz = App.currencyName.value;
  //   //     var name = zz.split(' ');
  //   //     var name2 = name[1];
  //   //     App.currencySymbol = name2.substring(1, name2.length - 1);
  //   //   } else {
  //   //     App.currencyName.value = 'GBP (£)';
  //   //     App.currencySymbol = '£';
  //   //   }
  //   //   App.currencyID = int.parse(currencyID[0]["SettingValue"].toString());
  //   //   //print(App.currencyID);
  //   // });
  //   // msgResult = await getCountSum();
  //   // if (msgResult == "Count_Done") {
  //   //   if (totalCount > 0) {
  //   //     progresAboveH = (totalCount / 100.0).round();
  //   //     progressBelowH = (100.0 / totalCount).round();
  //   //     msgResult = await subCatGet(0);
  //   //     if (msgResult == "SubCategory_Done") {
  //   //       msgResult = await countryGet(0);
  //   //       if (msgResult == "Country_Done") {
  //   //         msgResult = await currencyGet(0);
  //   //         if (msgResult == "Currency_Done") {
  //   //           setState(() {
  //   //             if (_progressStringV < 100) {
  //   //               _progressStringV = 100;
  //   //               progressValueWidget = 1.0;
  //   //             }
  //   //             Navigator.pushAndRemoveUntil(
  //   //               context,
  //   //               PageRouteBuilder(
  //   //                 transitionDuration: const Duration(seconds: 1),
  //   //                 reverseTransitionDuration: const Duration(seconds: 1),
  //   //                 transitionsBuilder:
  //   //                     (context, animation, secondaryAnimation, child) {
  //   //                   return FadeTransition(
  //   //                     opacity: animation,
  //   //                     child: child,
  //   //                   );
  //   //                 },
  //   //                 pageBuilder: (_, __, ___) => const Home(),
  //   //               ),
  //   //               (Route<dynamic> route) => false,
  //   //             );
  //   //           });
  //   //         }
  //   //       }
  //   //     } else {
  //   //       App.errorDialog(context, msgResult);
  //   //     }
  //   //   } else {
  //       Timer.periodic(const Duration(seconds: 6), (timer)
  //       {
  //         Get.offUntil(GetPageRoute(page: () => const Login()),
  //             ModalRoute.withName(AppRoutes.login));
  //       });
  //         //setState(() {
  //          // Get.off(() => const Login());
  //           // if (_progressStringV < 100) {
  //           //   _progressStringV += 1;
  //           //   progressValueWidget = _progressStringV / 100.0;
  //           // }
  //           // if (_progressStringV >= 100) {
  //           //   Navigator.pushAndRemoveUntil(
  //           //     context,
  //           //     PageRouteBuilder(
  //           //       transitionDuration: const Duration(seconds: 1),
  //           //       reverseTransitionDuration: const Duration(seconds: 1),
  //           //       transitionsBuilder:
  //           //           (context, animation, secondaryAnimation, child) {
  //           //         return FadeTransition(
  //           //           opacity: animation,
  //           //           child: child,
  //           //         );
  //           //       },
  //           //       pageBuilder: (_, __, ___) => const Home(),
  //           //     ),
  //           //     (Route<dynamic> route) => false,
  //           //   );
  //           //
  //           //   timer.cancel();
  //           //   return;
  //           // }
  //         //});
  //     //  });
  //     //}
  //   //}
  // }
}

