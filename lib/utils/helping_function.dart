import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:getx_sample/utils/constants.dart';
import 'package:http/http.dart' as http;
class Functions{
  static sendJson(jsonMap, page) async {
    var jsonData;
    var response;
    var isSuccess = false;
    var jsonError = {
      'DocType'   : 'Error',
      'DocDate'   : DateTime.now().toString(),
      'Message'   : 'Check Internet Connection & try again - Server Error!'
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
        try{
          jsonData = json.decode(response.body);
          isSuccess = true;
        } on FormatException catch(e){
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
    }
    finally{
      if(isSuccess == false){
        return jsonError;
      }
      else
      {
        return jsonData;
      }
    }
  }

}