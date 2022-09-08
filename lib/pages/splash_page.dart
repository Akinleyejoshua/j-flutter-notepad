import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:notepad/contorllers/settings.dart';
import 'package:notepad/pages/dashboard.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () => {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const DashBoardPage(),
          ),
        )
      },
    );

    MySettings mySettings = Get.put(MySettings());
    mySettings.getColorMode();

    return GetBuilder<MySettings>(
      init: MySettings(),
      builder: (_) => Scaffold(
        body: Container(
          color: _.secondaryBg,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: _.secondaryBg,
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(1, 1),
                        spreadRadius: 1,
                        blurRadius: 10,
                        color: _.darkMode ? const Color.fromARGB(198, 29, 29, 29) : const Color.fromARGB(20, 0, 0, 0),
                      ),
                    ],
                  ),
                  child: Icon(
                    MdiIcons.noteTextOutline,
                    color: _.royalblue,
                    size: 100,
                  ),
                ),
                Text(
                  "NotePad",
                  style: TextStyle(
                    fontSize: 20,
                    color: _.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
