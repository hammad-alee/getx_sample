import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:getx_sample/utils/color_constant.dart';
import 'package:getx_sample/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class Functions {

  static sendJson(jsonMap, page) async {
    var jsonData;
    var response;
    var isSuccess = false;
    var jsonError = {
      'DocType': 'Error',
      'DocDate': DateTime.now().toString(),
      'Message': 'Check Internet Connection & try again - Server Error!'
    };
    try {
      response = await http.post(
        Uri.parse(Constants.serverUrl + page + '.php'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(jsonMap),
      );
      if (kDebugMode) {
        //print(response.body);
      }
      if (response.statusCode == 200) {
        try {
          jsonData = json.decode(response.body);
          isSuccess = true;
        } on FormatException catch (e) {
          isSuccess = false;
          return jsonError;
        }
      } else {
        isSuccess = false;
        return jsonError;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      isSuccess = false;
      return jsonError;
    } finally {
      if (isSuccess == false) {
        return jsonError;
      } else {
        return jsonData;
      }
    }
  }

  static bool isMobile(String number) {
    return RegExp(r'^04([0-9]{8})$').hasMatch(number);
  }

  static bool isEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }

  static bool validatePassword(String value) {
    return RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
        .hasMatch(value);
  }

  static Future<bool> isConnected() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }

  static Future<File?> pickMedia({
    required bool isGallery,
    required Future<File?> Function(File file) cropImage,
  }) async {
    final source = isGallery ? ImageSource.gallery : ImageSource.camera;
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile == null) return null;

    if (cropImage == null) {
      return File(pickedFile.path);
    } else {
      final file = File(pickedFile.path);
      return cropImage(file);
    }
  }

  static String formatDate({String pattern = 'dd-MMM-yyyy hh:mm:ss a', required String date}) {
    return DateFormat().format(DateTime.parse(date));
  }

  static Widget loadImage({required double height, double width = double.infinity, url})
  {
    return CachedNetworkImage(
     // color: ColorConstant.secondary,
      height: height,
      width: width,
      fit: BoxFit.fitWidth,
      placeholder: (context, url) {
        return CircularProgressIndicator.adaptive();
      },
      imageUrl: url,
      errorWidget: (context, url, error) {
        return Icon(Icons.error_outline_rounded, size: 60, color: ColorConstant.secondary,);
      },
    );
  }

}