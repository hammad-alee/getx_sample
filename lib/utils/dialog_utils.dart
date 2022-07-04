import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class DialogUtils {
  static bool isProgressVisible = false;

  ///common method for showing progress dialog
  static void showProgressDialog(
      {isCancellable = false, text = "Loading Please Wait..."}) async {
    if (!isProgressVisible) {
      Get.dialog(
        Material(
          color: Colors.black26,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset('assets/anim/loading.json',
                    width: 150, height: 150),
                Text(
                  text,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        barrierDismissible: isCancellable,
      );
      isProgressVisible = true;
    }
  }

  ///common method for hiding progress dialog
  static void hideProgressDialog() {
    if (isProgressVisible) Get.back();
    isProgressVisible = false;
  }

  // success dialog method
  static void successDialog({description}) {
    Get.dialog(Material(

      child: Container(

        height: 280,
        //color: Colors.white,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 120,
              decoration: const BoxDecoration(
                  color: Color(0xff515c6f),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              //width: MediaQuery.of(context).size.width,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Lottie.asset(
                    'assets/anim/success.json',
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
            ),
            Text(
              'Success!!!',
              // style: GoogleFonts.notoSans(
              //   fontSize: 18,
              //   fontWeight: FontWeight.bold,
              //   color: textPrimaryColor,
              // ),
            ),
            Text(
              description,
              maxLines: 4,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              // style: GoogleFonts.notoSans(
              //   fontSize: 14,
              //   fontWeight: FontWeight.normal,
              //   color: textPrimaryColor,
              // ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: MaterialButton(
                  onPressed: () {
                    Get.back();
                  },
                  color: Colors.green,
                  height: 45,
                  minWidth: 150,
                  elevation: 6,
                  splashColor: Colors.red,
                  textColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Text(
                    "OK",
                    // style: GoogleFonts.notoSans(
                    //     fontSize: 15, fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  static void defaultD(){
    Get.defaultDialog(
         title: "Welcome to Flutter Dev'S",
        // middleText: "FlutterDevs is a protruding flutter app development company with "
        //     "an extensive in-house team of 30+ seasoned professionals who know "
        //     "exactly what you need to strengthen your business across various dimensions",
        // actions: [
        //   ElevatedButton(onPressed: (){}, child: Text('1')),
        //   ElevatedButton(onPressed: (){}, child: Text('2')),
        // ],
        // buttonColor: Colors.red,
        // cancel: ElevatedButton(onPressed: (){}, child: Icon(Icons.cancel)),
        // confirm: ElevatedButton(onPressed: (){}, child: Icon(Icons.tiktok)),
        content: Container(

          height: 280,
          //color: Colors.white,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 120,
                decoration: const BoxDecoration(
                    color: Color(0xff515c6f),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                //width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Lottie.asset(
                      'assets/anim/success.json',
                      width: 150,
                      height: 150,
                    ),
                  ),
                ),
              ),
              Text(
                'Success!!!',
                // style: GoogleFonts.notoSans(
                //   fontSize: 18,
                //   fontWeight: FontWeight.bold,
                //   color: textPrimaryColor,
                // ),
              ),
              Text(
                'description',
                maxLines: 4,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                // style: GoogleFonts.notoSans(
                //   fontSize: 14,
                //   fontWeight: FontWeight.normal,
                //   color: textPrimaryColor,
                // ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: MaterialButton(
                    onPressed: () {
                      Get.back();
                    },
                    color: Colors.green,
                    height: 45,
                    minWidth: 150,
                    elevation: 6,
                    splashColor: Colors.red,
                    textColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Text(
                      "OK",
                      // style: GoogleFonts.notoSans(
                      //     fontSize: 15, fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      contentPadding: EdgeInsets.zero,
      // custom: ElevatedButton(onPressed: (){}, child: Icon(Icons.facebook)),
      //   textConfirm: 'abc',
      //   backgroundColor: Colors.teal,
      //   titleStyle: TextStyle(color: Colors.white),
      //   middleTextStyle: TextStyle(color: Colors.white),
        radius: 20,

    );
  }
}
