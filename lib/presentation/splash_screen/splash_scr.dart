import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/utils/dialog_utils.dart';
import '../../utils/get_controller.dart';

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
                     DialogUtils.defaultD()
                }),
              ],
            )),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add), onPressed: c.increment));
  }
}

class Other extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller c = Get.find();

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
