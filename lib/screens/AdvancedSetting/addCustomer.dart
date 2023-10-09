import 'package:eazy_gate_lite/screens/home.dart';
import 'package:eazy_gate_lite/styles/colors.dart';
import 'package:eazy_gate_lite/styles/containers.dart';
import 'package:eazy_gate_lite/styles/dialog.dart';
import 'package:eazy_gate_lite/styles/text.dart';
import 'package:eazy_gate_lite/styles/textFormField.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class AddCustomers extends StatefulWidget {
  const AddCustomers({Key? key}) : super(key: key);

  @override
  State<AddCustomers> createState() => _AddCustomersState();
}

class _AddCustomersState extends State<AddCustomers> {
  var themeColor = ColorInTheme();
  var containerStyles = ContainerStyles();
  var textInTheme = TextInTheme();
  var inputTextFromField = InputTextFromField();
  double widthScreen = 0;
  double heightScreen = 0;
  List<CustomerModel> dataList = [
    CustomerModel(id: "1", homeNo: "88/1", plateNo: "กศ4586"),
    CustomerModel(id: "2", homeNo: "88/2", plateNo: "ษม875"),
    CustomerModel(id: "3", homeNo: "88/3", plateNo: "บบ895"),
    CustomerModel(id: "4", homeNo: "88/4", plateNo: "รวย99"),
    CustomerModel(id: "5", homeNo: "88/5", plateNo: "อส874"),
  ];
  @override
  Widget build(BuildContext context) {
    widthScreen = MediaQuery.of(context).size.width;
    heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("การจัดการลูกบ้าน"),
        centerTitle: true,
      ),
      body: content(),
      bottomNavigationBar: footer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.person_add_sharp,
          color: HexColor(themeColor.white),
        ),
        backgroundColor: HexColor(themeColor.blow03),
      ),
    );
  }

  Widget content() {
    return Center(
      child: Container(
        width: widthScreen * 0.9,
        height: heightScreen * 0.6,
        decoration:
            containerStyles.customBottom(themeColor.white, themeColor.grey03),
        child: Stack(
          children: [
            containerRow(
                "#",
                "บ้านเลขที่",
                "ทะเบียน",
                Container(
                    width: widthScreen * 0.1,
                    child: Center(
                        child: Text(
                      "",
                      style:
                          textInTheme.textCustomNormal(themeColor.grey03, 18),
                    ))),
                themeColor.black),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 48, 0, 0),
              child: ListView.builder(
                  itemCount: dataList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return containerRow(
                        dataList[index].id!,
                        dataList[index].homeNo!,
                        dataList[index].plateNo!,
                        InkWell(
                          onTap: () {
                            ThemeDialog.infoDialog(
                                context,
                                'Delete',
                                'Are you sure to delete ${dataList[index].homeNo!} ?',
                                deleteOkButton(dataList[index].id!),
                                deleteCancelButton());
                          },
                          child: Container(
                              width: widthScreen * 0.1,
                              child: Center(
                                  child: Icon(
                                Icons.delete,
                                color: HexColor(themeColor.blow03),
                              ))),
                        ),
                        themeColor.grey03);
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget containerRow(
      String col1, String col2, String col3, Widget col4, String color) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: HexColor(themeColor.grey02),
            width: 1.0,
          ),
        ),
      ),
      height: 48,
      child: Row(
        children: [
          Container(
              width: widthScreen * 0.1,
              child: Center(
                  child: Text(
                col1,
                style: textInTheme.textCustomNormal(color, 18),
              ))),
          Container(
              width: widthScreen * 0.4,
              child: Text(
                col2,
                style: textInTheme.textCustomNormal(color, 18),
              )),
          Container(
              width: widthScreen * 0.25,
              child: Center(
                  child: Text(
                col3,
                style: textInTheme.textCustomNormal(color, 18),
              ))),
          col4,
        ],
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

  Widget deleteOkButton(String id) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        setState(() {
          for (int i = 0; i < dataList.length; i++) {
            if (dataList[i].id! == id) {
              dataList.removeAt(i);
            }
          }
        });
      },
      child: Container(
        width: widthScreen * 0.35,
        height: 48,
        decoration:
            containerStyles.primaryBottom(),
        child: Center(
          child: Row(
            children: [
              Spacer(),
              Text(
                "Confirm",
                style:
                    TextStyle(color: HexColor(themeColor.white), fontSize: 18),
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
    );
  }

  Widget deleteCancelButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: widthScreen * 0.35,
        height: 48,
        decoration:
            containerStyles.secondBottom(),
        child: Center(
          child: Text(
            "Cancel",
            style: TextStyle(color: HexColor(themeColor.blow03), fontSize: 18),
          ),
        ),
      ),
    );
  }
}

class CustomerModel {
  String? id;
  String? homeNo;
  String? plateNo;

  CustomerModel({this.id, this.homeNo, this.plateNo});

  CustomerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    homeNo = json['homeNo'];
    plateNo = json['plateNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['homeNo'] = this.homeNo;
    data['plateNo'] = this.plateNo;
    return data;
  }
}
