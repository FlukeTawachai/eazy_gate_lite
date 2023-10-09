import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'colors.dart';
import 'containers.dart';
import 'text.dart';
import 'textFormField.dart';

class ThemeDialog {
  var themeColor = ColorInTheme();
  var containerStyles = ContainerStyles();
  var textInTheme = TextInTheme();
  var inputTextFromField = InputTextFromField();
  //-------Dialog Info........
  static Future<dynamic> infoDialog(
    BuildContext context,
    String title,
    String detail,
    Widget acceptButton,
    Widget cancelButton,
  ) {
    return showDialog<String>(
      useSafeArea: true,
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(
                  left: 10, top: 10 + 10, right: 10, bottom: 10),
              margin: const EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: HexColor("#5b9bd5"),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(top: 15.0, left: 10.0),
                    child: Text(
                      title,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(
                      10.0,
                    ),
                    child: Text(
                      detail,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Spacer(),
                        cancelButton,
                        Spacer(),
                        acceptButton,
                        Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //-------Dialog success........
  static Future<dynamic> successDialog(
    BuildContext context,
    String title,
    String detail,
    Widget okButton,
  ) {
    return showDialog<String>(
      useSafeArea: true,
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(
                  left: 10, top: 10 + 10, right: 10, bottom: 10),
              margin: const EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: HexColor("#5b9bd5"),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(top: 15.0, left: 10.0),
                    child: Text(
                      title,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(
                      10.0,
                    ),
                    child: Text(
                      detail,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        okButton,
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 10,
              right: 10,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 25,
                child: CircleAvatar(
                  child: const Icon(
                    Icons.check,
                    size: 40.0,
                    color: Colors.white,
                  ),
                  backgroundColor: HexColor("#70ad47"),
                  maxRadius: 25.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //-------Dialog Error........
  static Future<dynamic> errorDialog(
    BuildContext context,
    String title,
    String detail,
    Widget okButton,
  ) {
    return showDialog<String>(
      useSafeArea: true,
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(
                  left: 10, top: 10 + 10, right: 10, bottom: 10),
              margin: const EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: HexColor("#5b9bd5"),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(top: 15.0, left: 10.0),
                    child: Text(
                      title,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(
                      10.0,
                    ),
                    child: Text(
                      detail,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        okButton,
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 10,
              right: 10,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 25,
                child: CircleAvatar(
                  child: const Icon(
                    Icons.close,
                    size: 45.0,
                    color: Colors.white,
                  ),
                  backgroundColor: HexColor("#ff0000"),
                  maxRadius: 25.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //-------Dialog Password........
  static Future<dynamic> passwordDialog(
    BuildContext context,
    String title,
    Widget detail,
    Widget acceptButton,
    Widget cancelButton,
  ) {
    return showDialog<String>(
      useSafeArea: true,
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(
                  left: 10, top: 10 + 10, right: 10, bottom: 10),
              margin: const EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: HexColor("#5b9bd5"),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(top: 15.0, left: 10.0),
                    child: Center(
                      child: Text(
                        title,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(
                      10.0,
                    ),
                    child: detail,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Spacer(),
                        cancelButton,
                        Spacer(),
                        acceptButton,
                        Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
