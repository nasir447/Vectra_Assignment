import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ventracom/src/Screens/home.dart';
import 'package:ventracom/src/Screens/login.dart';
import 'package:ventracom/src/Screens/settings.dart';
import 'package:ventracom/src/models/animals.dart';
import 'package:ventracom/src/service/api_calls.dart';

class Controller extends GetxController {
  bool isDark = false;
  int index = 0;
  Database db = Database();
  List<Animal> animals = [];
  bool noData = true;
  int pos = 0;

  void apiCall() async {
    dynamic result = await db.getAnimals();
    animals.clear();
    for (var r in result) {
      animals.add(Animal.fromJson(r));
    }
    if (animals.isNotEmpty) {
      noData = false;
    }
    update();
  }

  void changePos(ind) {
    pos = ind;
    update();
  }

  void changePage(number) {
    if (number == 0) {
      index = 0;
    } else if (number == 1) {
      index = 1;
    } else if (number == 2) {
      index = 2;
    }
    update();
  }

  page() {
    if (index == 0) {
      return Login();
    } else if (index == 1) {
      return Home();
    } else if (index == 2) {
      return Settings();
    }
    update();
  }

  void changeTheme(state) {
    if (state) {
      isDark = true;
      Get.changeTheme(ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Colors.black,
        backgroundColor: Colors.black,
        indicatorColor: Color(0xff0E1D36),
        buttonColor: Color(0xff3B3B3B),
        hintColor: Color(0xff280C0B),
        highlightColor: Color(0xff372901),
        hoverColor: Color(0xff3A3A3B),
        focusColor: Color(0xff0B2512),
        disabledColor: Colors.grey,
        textSelectionColor: Colors.white,
        cardColor: Color(0xFF151515),
        canvasColor: Colors.black,
        brightness: Brightness.dark,
      ));
    } else {
      isDark = false;
      Get.changeTheme(ThemeData(
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
      ));
    }
    update();
  }
}
