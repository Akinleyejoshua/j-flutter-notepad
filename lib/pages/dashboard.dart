import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:notepad/components/dashboard_metrics.dart';
import 'package:notepad/components/navbar.dart';
import 'package:notepad/components/note_header.dart';
import 'package:notepad/contorllers/settings.dart';
import 'package:notepad/contorllers/navbar_controller.dart';
import 'package:notepad/contorllers/notes_controller.dart';
import 'package:notepad/contorllers/todo_controller.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NotesController notesController = Get.put(NotesController());
    TodoController todoController = Get.put(TodoController());

    void initState() async {
      await notesController.getNote();
      await todoController.getTodos();
    }

    initState();
    return Scaffold(
      body: Stack(
        children: [
          NavBar(),
          GetBuilder<NavBarController>(
            init: NavBarController(),
            builder: (_) => AnimatedPositioned(
              right: _.toggleNavBar == true.obs ? -260.0 : 0.0,
              left: _.toggleNavBar == true.obs ? 260.0 : 0.0,
              top: _.toggleNavBar == true.obs ? 80.0 : 0.0,
              bottom: _.toggleNavBar == true.obs ? 80.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: GetBuilder<MySettings>(
                init: MySettings(),
                builder: (color) => Container(
                  // height: _.toggleNavBar == true.obs ? 300 : null,
                  decoration: BoxDecoration(
                    color: color.secondaryBg,
                    borderRadius: BorderRadius.circular(
                        _.toggleNavBar == true.obs ? 20.0 : 0.0),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(1, 1),
                        spreadRadius: 1,
                        blurRadius: 10,
                        color: Color.fromARGB(100, 0, 0, 0),
                      ),
                    ],
                  ),
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const NoteHeader(
                          title: "Dashboard",
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Text(
                            "Hi, welcome",
                            style: TextStyle(
                                fontSize: 25, color: color.primaryColor),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: Text(
                            "Categories",
                            style: TextStyle(
                                fontSize: 15, color: color.primaryColor),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 0, left: 15, right: 15, bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GetBuilder<NotesController>(
                                init: NotesController(),
                                builder: (_) => DashboardMetrics(
                                    label: "notes",
                                    amount: "${_.note.length}",
                                    icon: MdiIcons.noteOutline),
                              ),
                              GetBuilder<TodoController>(
                                init: TodoController(),
                                builder: (_) => DashboardMetrics(
                                    label: "to-dos",
                                    amount: "${_.todos.length}",
                                    icon: MdiIcons.checkboxMarkedOutline),
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
          ),
        ],
      ),
    );
  }
}
