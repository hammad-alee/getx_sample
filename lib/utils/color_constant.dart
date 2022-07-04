import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color black9007f = fromHex('#7f000000');

  static Color gray600 = fromHex('#828282');

  static Color redA200 = fromHex('#ff655b');

  static Color gray800 = fromHex('#4f4f4f');

  static Color gray200 = fromHex('#efefef');

  static Color gray100 = fromHex('#f2f2f2');

  static Color bluegray700 = fromHex('#355c7d');

  static Color black900Cc = fromHex('#cc000000');

  static Color black900 = fromHex('#000000');

  static Color bluegray400 = fromHex('#888888');

  static Color black90028 = fromHex('#28000000');

  static Color pink300 = fromHex('#f15a87');

  static Color black90014 = fromHex('#14000000');

  static Color whiteA700 = fromHex('#ffffff');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
