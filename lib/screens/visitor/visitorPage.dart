import 'package:eazy_gate_lite/screens/visitor/picturePage.dart';
import 'package:eazy_gate_lite/styles/colors.dart';
import 'package:eazy_gate_lite/styles/containers.dart';
import 'package:eazy_gate_lite/styles/text.dart';
import 'package:eazy_gate_lite/styles/textFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:search_choices/search_choices.dart';

class VisitorPage extends StatefulWidget {
  const VisitorPage({Key? key}) : super(key: key);

  @override
  State<VisitorPage> createState() => _VisitorPageState();
}

class _VisitorPageState extends State<VisitorPage> {
  var themeColor = ColorInTheme();
  var containerStyles = ContainerStyles();
  var textInTheme = TextInTheme();
  var inputTextFromField = InputTextFromField();
  double widthScreen = 0;

  final FocusNode _addressNo = FocusNode();
  final FocusNode inputNo01 = FocusNode();
  final FocusNode inputNo02 = FocusNode();
  final FocusNode inputNo03 = FocusNode();
  final FocusNode inputNo04 = FocusNode();
  final FocusNode inputNo05 = FocusNode();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController plateController01 = TextEditingController();
  final TextEditingController plateController02 = TextEditingController();
  final TextEditingController plateController03 = TextEditingController();
  final TextEditingController plateController04 = TextEditingController();
  final TextEditingController plateController05 = TextEditingController();
  var provinceList = [
    "เชียงใหม่",
    "เชียงราย",
    "พะเยา",
    "น่าน",
    "ลำพูน",
    "ลำปาง",
  ];

  List<DropdownMenuItem> provinceItems = [
    const DropdownMenuItem(
      value: "เชียงใหม่",
      child: Text("เชียงใหม่"),
    ),
    const DropdownMenuItem(
      value: "เชียงราย",
      child: Text("เชียงราย"),
    ),
    const DropdownMenuItem(
      value: "พะเยา",
      child: Text("พะเยา"),
    ),
    const DropdownMenuItem(
      value: "น่าน",
      child: Text("น่าน"),
    ),
    const DropdownMenuItem(
      value: "ลำพูน",
      child: Text("ลำพูน"),
    ),
    const DropdownMenuItem(
      value: "ลำปาง",
      child: Text("ลำปาง"),
    ),
  ];

  String province = "";

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
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Text(
              "บ้านเลขที่",
              style: textInTheme.head36Bold(themeColor.black),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            width: widthScreen * 0.8,
            height: 128,
            decoration: containerStyles.secondBottom(),
            child: Center(
                child: Row(
              children: [
                Spacer(),
                Text(
                  "88/",
                  style: TextStyle(
                      color: HexColor(themeColor.red04), fontSize: 48),
                ),
                Spacer(),
                Container(
                  width: widthScreen * 0.35,
                  height: 108,
                  decoration: containerStyles.customBottom(
                      themeColor.white, themeColor.white),
                  child: inputTextFromField
                      .inputField(_addressNo, addressController, (value) {
                    setState(() {
                      print("******* $value");
                      addressController.text = value;
                    });
                  },
                          (value) {},
                          textInTheme.textCustomNormal(themeColor.black, 48),
                          TextInputType.number),
                ),
                Spacer(),
              ],
            )),
          ),
          SizedBox(
            height: 24,
          ),
          plateWidget()
        ],
      ),
    );
  }

  Widget plateWidget() {
    return Container(
      width: widthScreen * 0.9,
      height: 240,
      decoration:
          containerStyles.customBottom(themeColor.blow01, themeColor.white),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "ทะเบียนรถ",
                style: textInTheme.head36Bold(themeColor.black),
              ),
            ),
            Container(
              height: 72,
              decoration: containerStyles.customBottom(
                  themeColor.white, themeColor.red04),
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                  child: SearchChoices.single(
                    items: provinceItems,
                    value: province,
                    hint: "เลือกจังหวัด",
                    searchHint: "เลือกจังหวัด",
                    onChanged: (value) {
                      setState(() {
                        province = value.toString();
                        print(province);
                      });
                    },
                    isExpanded: true,
                    displayClearIcon: false,
                    style: textInTheme.text24Normal(themeColor.black),
                    underline: Container(
                      height: 1.0,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: HexColor(themeColor.white),
                                  width: 0.0))),
                    ),
                    displayItem: (item, selected) {
                      return (Row(children: [
                        selected
                            ? const Icon(
                                Icons.check,
                                color: Colors.green,
                              )
                            : const Icon(
                                Icons.check_box_outline_blank,
                                color: Colors.grey,
                              ),
                        const SizedBox(width: 7),
                        Expanded(
                          child: item,
                        ),
                      ]));
                    },
                  )),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 48,
              alignment: Alignment.centerLeft,
              child: Center(
                child: Row(
                  children: [
                    // #1
                    Container(
                      width: widthScreen * 0.2,
                      height: 48,
                      decoration: containerStyles.customBottom(
                          themeColor.white, themeColor.red04),
                      child: inputTextFromField
                          .inputField(inputNo01, plateController01, (value) {
                        setState(() {
                          print("******* $value");
                          plateController01.text = value;
                          FocusScope.of(context).requestFocus(inputNo02);
                        });
                      }, (value) {}, textInTheme.text24Normal(themeColor.black),
                              TextInputType.text),
                    ),
                    Container(
                      width: widthScreen * 0.1,
                      height: 48,
                      child: Center(
                        child: Text(
                          "-",
                          style: textInTheme.head36Bold(themeColor.red04),
                        ),
                      ),
                    ),
                    // #2
                    Container(
                      width: widthScreen * 0.1,
                      height: 48,
                      decoration: containerStyles.customBottom(
                          themeColor.white, themeColor.red04),
                      child: inputTextFromField.inputFieldLimit(
                          inputNo02, plateController02, (value) {}, (value) {
                        setState(() {
                          print("******* $value");
                          plateController02.text = value;
                          FocusScope.of(context).requestFocus(inputNo03);
                        });
                      }, textInTheme.text24Normal(themeColor.black), 1,
                          TextInputType.number),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    // #3
                    Container(
                      width: widthScreen * 0.1,
                      height: 48,
                      decoration: containerStyles.customBottom(
                          themeColor.white, themeColor.red04),
                      child: inputTextFromField.inputFieldLimit(
                          inputNo03, plateController03, (value) {}, (value) {
                        setState(() {
                          print("******* $value");
                          plateController03.text = value;
                          FocusScope.of(context).requestFocus(inputNo04);
                        });
                      }, textInTheme.text24Normal(themeColor.black), 1,
                          TextInputType.number),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    // #4
                    Container(
                      width: widthScreen * 0.1,
                      height: 48,
                      decoration: containerStyles.customBottom(
                          themeColor.white, themeColor.red04),
                      child: inputTextFromField.inputFieldLimit(
                          inputNo04, plateController04, (value) {
                        setState(() {
                          print("******* $value");
                          plateController04.text = value;
                        });
                      }, (value) {
                        setState(() {
                          print("******* $value");
                          plateController04.text = value;
                          FocusScope.of(context).requestFocus(inputNo05);
                        });
                      }, textInTheme.text24Normal(themeColor.black), 1,
                          TextInputType.number),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    // #5
                    Container(
                      width: widthScreen * 0.1,
                      height: 48,
                      decoration: containerStyles.customBottom(
                          themeColor.white, themeColor.red04),
                      child: inputTextFromField.inputFieldLimit(
                          inputNo05, plateController05, (value) {
                        setState(() {
                          print("******* $value");
                          plateController05.text = value;
                        });
                      }, (value) {}, textInTheme.text24Normal(themeColor.black),
                          1, TextInputType.number),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget footer() {
    return Container(
      height: 64,
      child: Row(
        children: [
          Spacer(),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: widthScreen * 0.4,
              height: 48,
              decoration: containerStyles.customBottom(
                  themeColor.grey02, themeColor.grey02),
              child: Center(
                child: Text(
                  "ยกเลิก",
                  style: TextStyle(
                      color: HexColor(themeColor.white), fontSize: 24),
                ),
              ),
            ),
          ),
          Spacer(),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const PicturePage(),
                ),
              );
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
          Spacer(),
        ],
      ),
    );
  }
}
