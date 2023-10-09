import 'dart:io';

import 'package:eazy_gate_lite/screens/home.dart';
import 'package:eazy_gate_lite/styles/colors.dart';
import 'package:eazy_gate_lite/styles/containers.dart';
import 'package:eazy_gate_lite/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

class PicturePage extends StatefulWidget {
  const PicturePage({Key? key}) : super(key: key);

  @override
  State<PicturePage> createState() => _PicturePageState();
}

class _PicturePageState extends State<PicturePage> {
  late PickedFile imageFile;
  late File _image;
  var themeColor = ColorInTheme();
  var containerStyles = ContainerStyles();
  var textInTheme = TextInTheme();
  double widthScreen = 0;
  bool imgIsEntity = true;

  @override
  Widget build(BuildContext context) {
    widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("บันทึกผู้มาติดต่อ"),
        centerTitle: true,
      ),
      body: content(),
      bottomNavigationBar: footer(),
    );
  }

  Widget content() {
    return Center(
      child: Container(
        width: widthScreen * 0.8,
        height: widthScreen * 0.8,
        decoration:
            containerStyles.customBottom(themeColor.white, themeColor.blow03),
        child: InkWell(
          onTap: () {
            _openCamera();
          },
          child: imgIsEntity == false
              ? Container(
                  width: 500,
                  height: 300,
                  child: Image.file(
                    File(_image.path),
                    fit: BoxFit.cover,
                  ),
                )
              : Icon(
                  FontAwesomeIcons.camera,
                  color: HexColor(themeColor.blow03),
                  size: 100.0,
                ),
        ),
      ),
    );
  }

  Widget footer() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => HomePage()),
              (Route<dynamic> route) => false);
        },
        child: Container(
          width: widthScreen * 0.4,
          height: 48,
          decoration: containerStyles.primaryBottom(),
          child: Center(
            child: Row(
              children: [
                Spacer(),
                Text(
                  "ตกลง",
                  style: TextStyle(
                      color: HexColor(themeColor.white), fontSize: 24),
                ),
                SizedBox(
                  width: 8,
                ),
                Icon(
                  FontAwesomeIcons.check,
                  color: HexColor(themeColor.white),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _openCamera() async {
    print("_openCamera()");
    var image = await ImagePicker.platform.pickImage(
        source: ImageSource.camera, maxHeight: 1000.0, maxWidth: 1000.0);
    setState(() {
      imageFile = image!;
      _image = File(imageFile.path);
      imgIsEntity = false;
    });
  }
}
