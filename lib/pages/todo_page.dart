import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:notepad/components/add_todo_bar.dart';
import 'package:notepad/components/list_todo.dart';
import 'package:notepad/components/navbar.dart';
import 'package:notepad/components/note_header.dart';
import 'package:notepad/contorllers/navbar_controller.dart';
import 'package:notepad/contorllers/settings.dart';
import 'package:notepad/contorllers/todo_controller.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TodoController todoController = Get.put(TodoController());
    todoController.getTodos();

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
                  builder: (color) {
                    return Container(
                      // height: _.toggleNavBar == true.obs ? 300 : null,
                      decoration: BoxDecoration(
                        color: color.secondaryBg,
                        borderRadius: BorderRadius.circular(
                          _.toggleNavBar == true.obs ? 20.0 : 0.0,
                        ),
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
                          children: const [
                            NoteHeader(
                              title: "Todo",
                            ),
                            ListTodo(),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
          GetBuilder<TodoController>(
            init: TodoController(),
            builder: (data) =>
                data.toggleTodo == true ? AddToDoBar(data: data) : Container(),
          ),
        ],
      ),
      floatingActionButton: GetBuilder<TodoController>(
        init: TodoController(),
        builder: (_) => _.toggleTodo == false
            ? FloatingActionButton(
                onPressed: () => _.toggleTodoBar(true),
                child: const Icon(MdiIcons.plusOutline),
              )
            : FloatingActionButton(
                onPressed: () => _.toggleTodoBar(false),
                child: const Icon(
                  MdiIcons.cancel,
                ),
              ),
      ),
    );
  }
}
