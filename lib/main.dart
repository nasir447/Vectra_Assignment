import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ventracom/src/Screens/bottom_nav.dart';

void main() => runApp(
      GetMaterialApp(
        home: BottomNav(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
          primaryColor: Colors.white,
          backgroundColor: Color(0xffF1F5FB),
          indicatorColor: Color(0xffCBDCF8),
          buttonColor: Color(0xffF1F5FB),
          hintColor: Color(0xffEECED3),
          highlightColor: Color(0xffFCE192),
          hoverColor: Color(0xff4285F4),
          focusColor: Color(0xffA8DAB5),
          disabledColor: Colors.grey,
          textSelectionColor: Colors.black,
          cardColor: Colors.white,
          canvasColor: Colors.grey[50],
          brightness: Brightness.light,
        ),
      ),
    );
