import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySettings extends GetxController {
  var darkMode = false;

  saveDarkMode(val) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("darkmode", val);
  }

  var royalblue = const Color.fromARGB(255, 0, 110, 255);
  var white = Colors.white;
  var red = Colors.red;
  var green = Colors.green;
  var black = const Color.fromARGB(80, 0, 0, 0);
  var whitesmoke = const Color.fromARGB(255, 246, 246, 246);

  var primaryBg = const Color.fromARGB(255, 0, 110, 255);
  var secondaryBg = Colors.white;
  var primaryColor = const Color.fromARGB(100, 0, 0, 0);
  var secondaryColor = Colors.white;

  lightmode() {
    saveDarkMode(false);
    primaryBg = const Color.fromARGB(255, 0, 110, 255);
    secondaryBg = Colors.white;
    primaryColor = const Color.fromARGB(100, 0, 0, 0);
    secondaryColor = Colors.white;
    darkMode = false;
    update();
  }

  darkmode() {
    saveDarkMode(true);
    primaryBg = const Color.fromARGB(255, 18, 17, 17);
    primaryColor = const Color.fromARGB(225, 255, 255, 255);
    secondaryColor = const Color.fromARGB(225, 255, 255, 255);
    secondaryBg = Colors.black;
    // whitesmoke = const Color.fromARGB(255, 214, 214, 214);
    darkMode = true;
    update();
  }

  getColorMode() async {
    final prefs = await SharedPreferences.getInstance();
    var mode = prefs.getBool("darkmode");
    if (mode == null || mode == false) {
      darkMode = false;
      lightmode();
    } else {
      darkMode = true;
      darkmode();
    }
    update();
  }
}
