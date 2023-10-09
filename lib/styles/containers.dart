import 'package:eazy_gate_lite/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ContainerStyles {
  var themeColor = ColorInTheme();
  BoxDecoration normal() {
    return BoxDecoration(
      color: HexColor(themeColor.yellow01),
      border: Border.all(width: 2, color: HexColor(themeColor.blow03)),
    );
  }

  BoxDecoration primaryBottom() {
    return BoxDecoration(
      color: HexColor(themeColor.blow03),
      border: Border.all(width: 2, color: HexColor(themeColor.blow03)),
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
    );
  }

  BoxDecoration secondBottom() {
    return BoxDecoration(
      color: HexColor(themeColor.blow01),
      border: Border.all(width: 2, color: HexColor(themeColor.blow03)),
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
    );
  }

  BoxDecoration customBottom(String color, String border) {
    return BoxDecoration(
      color: HexColor(color),
      border: Border.all(width: 2, color: HexColor(border)),
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
    );
  }
}
