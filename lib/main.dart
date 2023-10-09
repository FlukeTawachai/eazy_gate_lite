import 'package:eazy_gate_lite/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeColor(),
      home: const HomePage(),
    );
  }

    themeColor() {
    return ThemeData(
      scaffoldBackgroundColor: HexColor('#ffffff'),
      appBarTheme: AppBarTheme(
        backgroundColor: HexColor('#ffffff'),
        elevation: 0.0,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
    );
  }
}
