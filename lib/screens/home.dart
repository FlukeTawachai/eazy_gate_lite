import 'package:eazy_gate_lite/screens/qrCode/qrCodePage.dart';
import 'package:eazy_gate_lite/screens/reports/reportsPage.dart';
import 'package:eazy_gate_lite/screens/visitor/visitorPage.dart';
import 'package:eazy_gate_lite/styles/colors.dart';
import 'package:eazy_gate_lite/screens/setting.dart';
import 'package:eazy_gate_lite/styles/containers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

import '../globalParams.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var themeColor = ColorInTheme();
  var containerStyles = ContainerStyles();
  double widthScreen = 0;
  @override
  Widget build(BuildContext context) {
    widthScreen = MediaQuery.of(context).size.width;
    GlobalParams.widthScreen = MediaQuery.of(context).size.width;
    GlobalParams.heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Spacer(),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.home,
                        color: HexColor(themeColor.grey03),
                      ),
                      Text(
                        "EasyGate",
                        style:
                            TextStyle(color: HexColor(themeColor.textPrimary)),
                      ),
                    ],
                  ),
                  Text(
                    "version ${GlobalParams.appVersion}",
                    style: TextStyle(
                        color: HexColor(themeColor.blue03), fontSize: 12),
                  ),
                ],
              ),
            ),
            Spacer(),
          ],
        ),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  Scaffold.of(context).openDrawer();
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: HexColor("#ffffff"),
                  shape: BoxShape.rectangle,
                ),
                child: Icon(Icons.format_list_bulleted,
                    color: HexColor(themeColor.grey03)),
              ),
            );
          },
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.campaign,
                color: HexColor(themeColor.grey03),
              )),
        ],
      ),
      drawer: const SettingBar(),
      body: content(),
      bottomNavigationBar: footer(),
    );
  }

  Widget content() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Container(
              width: widthScreen,
              height: 28,
              color: HexColor(themeColor.grey01),
              child: Text(
                "โครงการ แกรมบางกอกบูลเลอวาด วิกาวดี รังสิต (GBB-vp)",
                style: TextStyle(
                    color: HexColor(themeColor.textPrimary), fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          imageContent(),
          SizedBox(
            height: 24,
          ),
          bottomContent()
        ],
      ),
    );
  }

  Widget imageContent() {
    return Container(
      child: Row(
        children: [
          Spacer(),
          Container(
            width: widthScreen * 0.45,
            height: widthScreen * 0.45,
            decoration: containerStyles.normal(),
            child: Center(
                child: Image.asset(
              'assets/images/backCar.png',
              scale: 1.0,
            )),
          ),
          Spacer(),
          Container(
            width: widthScreen * 0.45,
            height: widthScreen * 0.45,
            decoration: containerStyles.normal(),
            child: Center(
                child: Image.asset(
              'assets/images/fontCar.png',
              scale: 1.0,
              // width: widthScreen * 0.45,
              // height: widthScreen * 0.45,
            )),
          ),
          Spacer(),
        ],
      ),
    );
  }

  Widget bottomContent() {
    return Container(
      child: Row(
        children: [
          Spacer(),
          Container(
            width: widthScreen * 0.4,
            height: widthScreen * 0.4,
            decoration: containerStyles.secondBottom(),
            child: Center(
                child: Row(
              children: [
                Spacer(),
                Icon(
                  FontAwesomeIcons.carRear,
                  color: HexColor(themeColor.yellow04),
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  "รถออก",
                  style: TextStyle(color: HexColor(themeColor.yellow04)),
                ),
                Spacer(),
              ],
            )),
          ),
          Spacer(),
          Container(
            width: widthScreen * 0.4,
            height: widthScreen * 0.4,
            decoration: containerStyles.primaryBottom(),
            child: Center(
                child: Row(
              children: [
                Spacer(),
                Icon(
                  FontAwesomeIcons.carRear,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  "รถเข้า",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Spacer(),
              ],
            )),
          ),
          Spacer(),
        ],
      ),
    );
  }

  Widget footer() {
    return Container(
      height: 64,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Spacer(),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const VisitorPage(),
                  ),
                );
              },
              child: Container(
                width: widthScreen * 0.3,
                height: 48,
                decoration: containerStyles.customBottom(
                    themeColor.red01, themeColor.red04),
                child: Center(
                    child: Row(
                  children: [
                    Spacer(),
                    Icon(
                      FontAwesomeIcons.carRear,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "ผู้ติดต่อ",
                      style: TextStyle(color: Colors.black),
                    ),
                    Spacer(),
                  ],
                )),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const ReportsPage(),
                  ),
                );
              },
              child: Container(
                width: widthScreen * 0.3,
                height: 48,
                decoration: containerStyles.customBottom(
                    themeColor.green01, themeColor.green04),
                child: Center(
                    child: Row(
                  children: [
                    Spacer(),
                    Icon(
                      FontAwesomeIcons.file,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "รายงาน",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                  ],
                )),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const QrCodePage(),
                  ),
                );
              },
              child: Container(
                width: widthScreen * 0.3,
                height: 48,
                decoration: containerStyles.customBottom(
                    themeColor.blue00, themeColor.blue02),
                child: Center(
                    child: Row(
                  children: [
                    Spacer(),
                    Icon(
                      FontAwesomeIcons.qrcode,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "สะแกน",
                      style: TextStyle(
                        color: Colors.black,
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
    );
  }
}
