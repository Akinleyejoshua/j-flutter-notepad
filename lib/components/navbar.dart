import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:notepad/contorllers/settings.dart';
import 'package:notepad/contorllers/navbar_controller.dart';
import 'package:notepad/pages/dashboard.dart';
import 'package:notepad/pages/note_page.dart';
import 'package:notepad/pages/todo_page.dart';

// ignore: must_be_immutable
class NavBar extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  NavBar({Key? key}) : super(key: key);
  NavBarController navBarController = Get.put(NavBarController());
  MySettings mySettings = Get.put(MySettings());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MySettings>(
      init: MySettings(),
      builder: (_) => SizedBox(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: _.primaryBg,
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "NotePad",
                  style: TextStyle(
                    color: _.secondaryColor,
                    fontSize: 35,
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const DashBoardPage(),
                      ),
                    );
                    navBarController.toggle(false.obs);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Icon(
                          MdiIcons.viewDashboardOutline,
                          color: _.secondaryColor,
                          size: 20,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Dashboard",
                            style: TextStyle(
                                color: _.secondaryColor, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const NotePage(),
                      ),
                    );
                    navBarController.toggle(false.obs);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Icon(
                          MdiIcons.notebookPlusOutline,
                          color: _.secondaryColor,
                          size: 20,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Notes",
                            style: TextStyle(
                                color: _.secondaryColor, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const TodoPage(),
                      ),
                    );
                    navBarController.toggle(false.obs);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Icon(
                          MdiIcons.checkboxMarkedOutline,
                          color: _.secondaryColor,
                          size: 20,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Todos",
                            style: TextStyle(
                                color: _.secondaryColor, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 0.5,
                color: _.whitesmoke,
                margin: const EdgeInsets.only(top: 10),
              ),
              SizedBox(
                width: 250,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: _.darkMode
                        ? () {
                            _.lightmode();
                          }
                        : () {
                            _.darkmode();
                          },
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(
                                MdiIcons.themeLightDark,
                                color: _.secondaryColor,
                              ),
                              const Padding(
                                padding: EdgeInsets.all(5),
                              ),
                              Text(
                                "Darkmode",
                                style: TextStyle(
                                    color: _.secondaryColor, fontSize: 18),
                              )
                            ],
                          ),
                          Container(
                            width: 50,
                            height: 24,
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: _.whitesmoke),
                            child: Stack(
                              children: [
                                AnimatedPositioned(
                                  right: _.darkMode ? 0.0 : 25.0,
                                  duration: const Duration(milliseconds: 500),
                                  child: Container(
                                    width: 20,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: _.darkMode
                                          ? _.secondaryBg
                                          : _.royalblue,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
