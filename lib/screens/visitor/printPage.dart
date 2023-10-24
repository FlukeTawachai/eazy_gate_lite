import 'dart:typed_data';

import 'package:eazy_gate_lite/screens/home.dart';
import 'package:eazy_gate_lite/styles/colors.dart';
import 'package:eazy_gate_lite/styles/containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PrintPage extends StatefulWidget {
  const PrintPage({super.key});

  @override
  State<PrintPage> createState() => _PrintPageState();
}

class _PrintPageState extends State<PrintPage> {
  double widthScreen = 0;
  var themeColor = ColorInTheme();
  var containerStyles = ContainerStyles();
  @override
  Widget build(BuildContext context) {
    widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Print Page"),
      ),
      body: PdfPreview(
        build: (format) => _generatePdf(format, "ชื่อโครงการ XXXXX"),
      ),
      bottomNavigationBar: Container(
        height: 54,
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => HomePage()),
                (Route<dynamic> route) => false);
          },
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              width: widthScreen * 0.3,
              height: 48,
              decoration: containerStyles.primaryBottom(),
              // ignore: prefer_const_constructors
              child: Center(
                  child: Text(
                "กลับหน้าหลัก",
                style: TextStyle(color: HexColor(themeColor.white)),
              )),
            ),
          ),
        ),
      ),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
    var myTheme = pw.ThemeData.withFont(
      base:
          pw.Font.ttf(await rootBundle.load("assets/fonts/TH_Niramit_AS.ttf")),
      bold: pw.Font.ttf(
          await rootBundle.load("assets/fonts/TH_Niramit_AS_Bold.ttf")),
    );
    final pdf = pw.Document(
        version: PdfVersion.pdf_1_5, compress: true, theme: myTheme);

    // ignore: unused_local_variable
    final double widthScreen = MediaQuery.of(context).size.width;
    var outputFormat = DateFormat('dd/MM/yyyy hh:mm a');
    var outputDate = outputFormat.format(DateTime.now());
    var textSmall = pw.TextStyle(fontSize: 24);
    var textNormal = pw.TextStyle(fontSize: 36);
    var textBold = pw.TextStyle(fontSize: 36, fontWeight: pw.FontWeight.bold);
    final ByteData image =
        await rootBundle.load('assets/images/QR_Code_Example.png');
    Uint8List imageData = (image).buffer.asUint8List();

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Column(
            children: [
              pw.Flexible(child: pw.FlutterLogo()),
              pw.SizedBox(height: 20),
              pw.SizedBox(
                width: widthScreen * 0.4,
                child: pw.FittedBox(
                  child: pw.Text(title, style: textBold),
                ),
              ),
              pw.SizedBox(
                width: widthScreen * 0.4,
                child: pw.FittedBox(
                  child: pw.Text("เลขที่ใบผ่าน เข้า-ออก", style: textNormal),
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Row(children: [
                pw.Container(
                    width: widthScreen * 0.3,
                    child: pw.Text("เวลาเข้า", style: textBold)),
                pw.Container(
                    width: widthScreen * 0.6,
                    child: pw.Text(outputDate, style: textNormal)),
              ]),
              pw.SizedBox(height: 20),
              pw.Row(children: [
                pw.Container(
                    width: widthScreen * 0.3,
                    child: pw.Text("ประเภท", style: textBold)),
                pw.Container(
                    width: widthScreen * 0.6,
                    child: pw.Text("ผู้มาติดต่อ", style: textNormal)),
              ]),
              pw.SizedBox(height: 20),
              pw.Row(children: [
                pw.Container(
                    width: widthScreen * 0.3,
                    child: pw.Text("ทะเบียน", style: textBold)),
                pw.Container(
                    width: widthScreen * 0.6,
                    child: pw.Text("กกก เชียงราย 45XX", style: textNormal)),
              ]),
              pw.SizedBox(height: 20),
              pw.Row(children: [
                pw.Container(
                    width: widthScreen * 0.3,
                    child: pw.Text("บ้านเลขที่", style: textBold)),
                pw.Container(
                    width: widthScreen * 0.6,
                    child: pw.Text("88/X", style: textNormal)),
              ]),
              pw.Divider(color: PdfColors.black),
              pw.SizedBox(height: 20),
              pw.Row(children: [
                pw.Spacer(),
                pw.Container(
                  width: 72,
                  height: 72,
                  decoration: pw.BoxDecoration(
                    borderRadius: pw.BorderRadius.circular(36),
                    border: pw.Border.all(),
                  ),
                ),
                pw.Spacer(),
                pw.Container(
                  width: widthScreen * 0.3,
                  height: 64,
                  decoration: pw.BoxDecoration(
                    border: pw.Border.all(),
                  ),
                ),
              ]),
              pw.SizedBox(height: 20),
              pw.Row(children: [
                pw.Spacer(),
                pw.Container(
                    width: widthScreen * 0.3,
                    child: pw.Center(
                        child: pw.Text("ประทับตรา", style: textSmall))),
                pw.Spacer(),
                pw.Container(
                    width: widthScreen * 0.3,
                    child: pw.Center(
                        child: pw.Text("เจ้าของบ้าน/ตัวแทน/เจ้าหน้าที่",
                            style: textSmall))),
              ]),
              pw.SizedBox(height: 20),
              pw.Container(
                  width: widthScreen * 0.2,
                  height: widthScreen * 0.2,
                  decoration: pw.BoxDecoration(
                    border: pw.Border.all(),
                  ),
                  child: pw.Center(child: pw.Image(pw.MemoryImage(imageData))))
            ],
          );
        },
      ),
    );

    return pdf.save();
  }
}
