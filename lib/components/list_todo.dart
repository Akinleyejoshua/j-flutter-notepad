import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:notepad/components/todo_item.dart';
import 'package:notepad/constants/colors.dart';
import 'package:notepad/contorllers/todo_controller.dart';

class ListTodo extends StatelessWidget {
  const ListTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodoController>(
      init: TodoController(),
      builder: (_) => _.todos.isEmpty
          ? Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    MdiIcons.checkboxMarkedOutline,
                    size: 80,
                    color: royalblue,
                  ),
                  Text("No To-dos"),
                ],
              ),
            )
          : GetBuilder<TodoController>(
              init: TodoController(),
              builder: (data) => Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: _.todos.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => TodoItem(
                    data: data.todos,
                    index: index,
                  ),
                ),
              ),
            ),
    );
  }
}
