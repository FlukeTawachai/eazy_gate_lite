import 'package:eazy_gate_lite/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';

class TextInTheme {
  var themeColor = ColorInTheme();
  TextStyle head36Bold(String color) {
    return TextStyle(
        color: HexColor(color), fontSize: 36, fontWeight: FontWeight.bold);
  }

  TextStyle text24Normal(String color) {
    return TextStyle(color: HexColor(color), fontSize: 24);
  }

  TextStyle textCustomNormal(String color, double fontSize) {
    return TextStyle(color: HexColor(color), fontSize: fontSize);
  }

  TextStyle textCustomBold(String color, double fontSize) {
    return TextStyle(color: HexColor(color), fontSize: fontSize, fontWeight: FontWeight.bold);
  }
}
