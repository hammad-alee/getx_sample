import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/utils/color_constant.dart';
import 'package:getx_sample/utils/text_style.dart';
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
  static void successDialog(context, description) {
    AlertDialog alert = const AlertDialog();
    alert = AlertDialog(
      insetPadding: const EdgeInsets.all(0.0),
      titlePadding: const EdgeInsets.all(0.0),
      contentPadding: const EdgeInsets.all(0.0),
      backgroundColor: Colors.transparent,
      content: Container(
        width: MediaQuery.of(context).size.width - 40 > 400
            ? 500
            : MediaQuery.of(context).size.width - 30,
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
              width: MediaQuery.of(context).size.width,
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
              'Success!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: ColorConstant.black9007f,
              ),
            ),
            FittedBox(
              fit: BoxFit.contain,
              alignment: Alignment.center,
              child: Text(
                description,
                maxLines: 4,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: ColorConstant.black900,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.green,
                  height: 45,
                  minWidth: 150,
                  elevation: 6,
                  splashColor: ColorConstant.secondary,
                  textColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Text(
                    "OK",
                    style: TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => alert,
    );
  }

  static void errorDialog(context, description) {
    AlertDialog alert = const AlertDialog();
    alert = AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(0.0),
      titlePadding: const EdgeInsets.all(0.0),
      contentPadding: const EdgeInsets.all(0.0),
      content: Container(
        width: MediaQuery.of(context).size.width - 40 > 400
            ? 500
            : MediaQuery.of(context).size.width - 30,
        height: 280,
        //color: Colors.red,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 120,
              decoration: const BoxDecoration(
                  color: Color(0xff515c6f),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Lottie.asset(
                    'assets/anim/error.json',
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
            ),
            Text(
              'Oops...',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: ColorConstant.text1,
              ),
            ),
            Text(
              description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: ColorConstant.text1,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.red,
                  height: 45,
                  minWidth: 150,
                  elevation: 6,
                  splashColor: ColorConstant.secondary,
                  textColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Text(
                    "OK",
                    style: TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => alert,
    );
  }

  static void infoDialog(context, desc) {
    showDialog(
        builder: (context) => AlertDialog(
          insetPadding: const EdgeInsets.all(0.0),
          titlePadding: const EdgeInsets.all(0.0),
          contentPadding: const EdgeInsets.all(0.0),
          backgroundColor: Colors.transparent,
          content: Container(
            width: MediaQuery.of(context).size.width - 40 > 400
                ? 500
                : MediaQuery.of(context).size.width - 30,
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
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Lottie.asset(
                        'assets/lottie_files/info.json',
                        width: 150,
                        height: 150,
                      ),
                    ),
                  ),
                ),
                Text(
                  'Info!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ColorConstant.text1,
                  ),
                ),
                Text(
                  desc,
                  maxLines: 4,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: ColorConstant.text1,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: const Color(0xffF19734),
                      height: 45,
                      minWidth: 150,
                      elevation: 6,
                      splashColor: ColorConstant.secondary,
                      textColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(30))),
                      child: Text(
                        "OK",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        context: context);
  }

  static void infoTwoButtonDialog(context, title, desc, onTap1, onTap2, text1, text2) {
    showDialog(
        builder: (context) => AlertDialog(
          insetPadding: const EdgeInsets.all(0.0),
          titlePadding: const EdgeInsets.all(0.0),
          contentPadding: const EdgeInsets.all(0.0),
          backgroundColor: Colors.transparent,
          content: Container(
            width: MediaQuery.of(context).size.width - 40 > 400
                ? 500
                : MediaQuery.of(context).size.width - 30,
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
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Lottie.asset('assets/anim/info.json',
                          width: 150, height: 150, repeat: false),
                    ),
                  ),
                ),
                Text(
                  title,
                  style: TextStyleUtil.titleStyle,
                ),
                Text(
                  desc,
                  maxLines: 4,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyleUtil.normalText,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 16, right: 8, bottom: 10),
                        child: MaterialButton(
                          onPressed: onTap1,
                          color: ColorConstant.primary,
                          height: 45,
                          minWidth: 150,
                          elevation: 6,
                          splashColor: ColorConstant.secondary,
                          textColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(30))),
                          child: Text(
                            text1,
                            style: TextStyleUtil.miniTitleText,
                        ),
                      ),
                    ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 16, bottom: 10),
                        child: MaterialButton(
                          onPressed: onTap2,
                          color: ColorConstant.primary,
                          height: 45,
                          minWidth: 150,
                          elevation: 6,
                          splashColor: ColorConstant.secondary,
                          textColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(30))),
                          child: Text(
                            text2,
                            style: TextStyleUtil.miniTitleText,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        context: context);
  }



}
