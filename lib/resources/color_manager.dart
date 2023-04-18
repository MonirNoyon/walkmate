import 'package:flutter/material.dart';

class ColorManager{
  static Color primary = HexColor.fromHex('#20C56C');
  static Color dark = HexColor.fromHex('#1E1E1E');

}

extension HexColor on Color{
  static Color fromHex(String hexColor){
    hexColor = hexColor.replaceAll('#', '');
    if(hexColor.length == 6){
      hexColor = 'FF$hexColor';
    }
    return Color(int.parse(hexColor,radix: 16));
  }
}