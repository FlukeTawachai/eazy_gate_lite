import 'package:eazy_gate_lite/screens/AdvancedSetting/addCustomer.dart';
import 'package:eazy_gate_lite/styles/colors.dart';
import 'package:eazy_gate_lite/styles/containers.dart';
import 'package:eazy_gate_lite/styles/dialog.dart';
import 'package:eazy_gate_lite/styles/text.dart';
import 'package:eazy_gate_lite/styles/textFormField.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class SettingBar extends StatefulWidget {
  const SettingBar({Key? key}) : super(key: key);

  @override
  State<SettingBar> createState() => _SettingBarState();
}

class _SettingBarState extends State<SettingBar> {
  var themeColor = ColorInTheme();
  var containerStyles = ContainerStyles();
  var textInTheme = TextInTheme();
  var inputTextFromField = InputTextFromField();
  bool selectGeneral = false;
  final FocusNode inputNo01 = FocusNode();
  final FocusNode inputNo02 = FocusNode();
  final FocusNode inputNo03 = FocusNode();
  final FocusNode passNode = FocusNode();

  final TextEditingController controller01 = TextEditingController();
  final TextEditingController controller02 = TextEditingController();
  final TextEditingController controller03 = TextEditingController();
  final TextEditingController passController = TextEditingController();
  double widthScreen = 0;

  @override
  Widget build(BuildContext context) {
    widthScreen = MediaQuery.of(context).size.width;
    return Drawer(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(),
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            Center(
              child: Container(
                padding:
                    const EdgeInsets.only(top: 10.0, left: 20.0, bottom: 10.0),
                child: Row(
                  children: [
                    Spacer(),
                    Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    Spacer(),
                    IconButton(onPressed: () {}, icon: Icon(Icons.search))
                  ],
                ),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.only(top: 10.0, left: 20.0, bottom: 10.0),
              child: Row(
                children: [
                  Text(
                    'General',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            const Divider(),
            general(),
            const Divider(),
            advanced(),
            const Divider(),
            // Container(),
            // const Divider(),
            // Container(),
          ],
        ),
      ),
    );
  }

  Widget general() {
    return InkWell(
      onTap: () {
        setState(() {
          selectGeneral = true;
        });
      },
      child: Container(
        padding: const EdgeInsets.only(top: 10.0, left: 20.0, bottom: 10.0),
        child: Column(
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                  child: Icon(Icons.monitor),
                ),
                const Text(
                  'Project Info',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                  child: Icon(selectGeneral == true
                      ? Icons.keyboard_arrow_down
                      : Icons.arrow_forward_ios),
                )
              ],
            ),
            selectGeneral == true ? generalFrom(true) : Container(),
          ],
        ),
      ),
    );
  }

  Widget generalFrom(bool enabled) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            "Advanced Setting",
            style: textInTheme.textCustomBold(themeColor.black, 18),
          ),
        ),
        inputTextFromField.generalFromFieldLabel(inputNo01, controller01,
            (value) {
          setState(() {
            print("******* $value");
            controller01.text = value;
            FocusScope.of(context).requestFocus(inputNo02);
          });
        }, (value) {}, textInTheme.text24Normal(themeColor.black),
            TextInputType.text, enabled, "ชื่อโครงการ", ""),
        inputTextFromField.generalFromFieldLabel(inputNo02, controller02,
            (value) {
          setState(() {
            print("******* $value");
            controller02.text = value;
            FocusScope.of(context).requestFocus(inputNo03);
          });
        }, (value) {}, textInTheme.text24Normal(themeColor.black),
            TextInputType.text, enabled, "รหัสโครงการ", ""),
        inputTextFromField.generalFromFieldLabelRemark(inputNo03, controller03,
            (value) {
          setState(() {
            print("******* $value");
            controller03.text = value;
            // FocusScope.of(context).requestFocus(inputNo02);
          });
        },
            (value) {},
            textInTheme.text24Normal(themeColor.black),
            TextInputType.text,
            enabled,
            "เลขหน้าบ้านเลขที่",
            "",
            "(ไม่ต้องใส่ /)"),
        generalFooter()
      ],
    );
  }

  Widget generalFooter() {
    return Container(
      height: 64,
      child: Row(
        children: [
          Spacer(),
          InkWell(
            onTap: () {
              setState(() {
                selectGeneral = false;
              });
            },
            child: Container(
              width: widthScreen * 0.15,
              height: 48,
              decoration: containerStyles.customBottom(
                  themeColor.grey02, themeColor.grey02),
              child: Center(
                child: Text(
                  "cancel",
                  style: TextStyle(
                      color: HexColor(themeColor.white), fontSize: 24),
                ),
              ),
            ),
          ),
          Spacer(),
          InkWell(
            onTap: () {
              setState(() {
                selectGeneral = false;
              });
            },
            child: Container(
              width: widthScreen * 0.15,
              height: 48,
              decoration: containerStyles.customBottom(
                  themeColor.grey03, themeColor.grey03),
              child: Center(
                child: Row(
                  children: [
                    Spacer(),
                    Text(
                      "seve",
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
          Spacer(),
        ],
      ),
    );
  }

  Widget advanced() {
    return InkWell(
      onTap: () {
        ThemeDialog.passwordDialog(
          context,
          'Password',
          Container(
            height: 48,
            decoration: containerStyles.customBottom(
                themeColor.white, themeColor.grey03),
            child: inputTextFromField.inputField(passNode, passController,
                (value) {
              setState(() {
                print("******* $value");
                passController.text = value;
              });
            }, (value) {}, textInTheme.text24Normal(themeColor.black),
                TextInputType.text),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const AddCustomers(),
                ),
              );
            },
            child: Container(
              width: widthScreen * 0.3,
              height: 48,
              decoration: containerStyles.customBottom(
                  themeColor.grey03, themeColor.grey03),
              child: Center(
                child: Row(
                  children: [
                    Spacer(),
                    Text(
                      "seve",
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
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: widthScreen * 0.3,
              height: 48,
              decoration: containerStyles.customBottom(
                  themeColor.grey02, themeColor.grey02),
              child: Center(
                child: Text(
                  "cancel",
                  style: TextStyle(
                      color: HexColor(themeColor.white), fontSize: 24),
                ),
              ),
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(top: 10.0, left: 20.0, bottom: 10.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
              child: Icon(FontAwesomeIcons.sliders),
            ),
            Text(
              'Advanced',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
              child: Icon(Icons.arrow_forward_ios),
            )
          ],
        ),
      ),
    );
  }
}
