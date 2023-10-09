import 'package:eazy_gate_lite/styles/colors.dart';
import 'package:eazy_gate_lite/styles/containers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({Key? key}) : super(key: key);

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  var themeColor = ColorInTheme();
  var containerStyles = ContainerStyles();
  double widthScreen = 0;
  @override
  Widget build(BuildContext context) {
    widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("รายงานสถิติ"),
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
          child: ListView(
            children: [
              SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: widthScreen * 0.3,
                  height: 128,
                  decoration: containerStyles.customBottom(
                      themeColor.green01, themeColor.green04),
                  child: Center(
                      child: Row(
                    children: [
                      Spacer(),
                      Text(
                        "รถเข้า",
                        style: TextStyle(
                            color: HexColor(themeColor.green04), fontSize: 48),
                      ),
                      Spacer(),
                      Container(
                        width: widthScreen * 0.3,
                        height: 108,
                        decoration: containerStyles.customBottom(
                            themeColor.white, themeColor.white),
                        child: Center(
                          child: Text(
                            "9999",
                            style: TextStyle(
                                color: HexColor(themeColor.green04),
                                fontSize: 48),
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  )),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: widthScreen * 0.3,
                  height: 128,
                  decoration: containerStyles.customBottom(
                      themeColor.yellow01, themeColor.yellow04),
                  child: Center(
                      child: Row(
                    children: [
                      Spacer(),
                      Text(
                        "รถออก",
                        style: TextStyle(
                            color: HexColor(themeColor.yellow04), fontSize: 48),
                      ),
                      Spacer(),
                      Container(
                        width: widthScreen * 0.3,
                        height: 108,
                        decoration: containerStyles.customBottom(
                            themeColor.white, themeColor.white),
                        child: Center(
                          child: Text(
                            "9999",
                            style: TextStyle(
                                color: HexColor(themeColor.yellow04),
                                fontSize: 48),
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  )),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: widthScreen * 0.3,
                  height: 128,
                  decoration: containerStyles.customBottom(
                      themeColor.blue00, themeColor.blue02),
                  child: Center(
                      child: Row(
                    children: [
                      Spacer(),
                      Text(
                        "ผู้ติดต่อ",
                        style: TextStyle(
                            color: HexColor(themeColor.blue03), fontSize: 48),
                      ),
                      Spacer(),
                      Container(
                        width: widthScreen * 0.3,
                        height: 108,
                        decoration: containerStyles.customBottom(
                            themeColor.white, themeColor.white),
                        child: Center(
                          child: Text(
                            "9999",
                            style: TextStyle(
                                color: HexColor(themeColor.blue03),
                                fontSize: 48),
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  )),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Container(
            width: widthScreen * 0.8,
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
      ),
    );
  }
}
