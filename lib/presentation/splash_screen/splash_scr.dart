import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/utils/dialog_utils.dart';
import '../../utils/constants.dart';
import '../../utils/get_controller.dart';
import '../../utils/helping_function.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());

    return Scaffold(
        appBar: AppBar(title: Obx(() => Text(c.count.toString()))),
        // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
        body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
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

                }, child: Text('Send Request'))
              ],
            )),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add), onPressed: c.increment));
  }
}

class Other extends StatelessWidget with WidgetsBindingObserver {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller c = Get.find();
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
    if (state == AppLifecycleState.resumed) {
      print('abc');
    }
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("${c.count}"),
          MaterialButton(
            child: Text('Show Dialog'.tr),
              onPressed: (){
           DialogUtils.showProgressDialog(isCancellable: true);

          })
        ],
      ),
    );
  }
}
