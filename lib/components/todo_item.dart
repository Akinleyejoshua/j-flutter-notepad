import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:notepad/components/icon_button.dart';
import 'package:notepad/components/text_button.dart';
import 'package:notepad/constants/colors.dart';
import 'package:notepad/contorllers/settings.dart';
import 'package:notepad/contorllers/todo_controller.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({Key? key, required this.data, required this.index})
      : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final data;
  // ignore: prefer_typing_uninitialized_variables
  final index;

  @override
  Widget build(BuildContext context) {
    TodoController todoController = Get.put(TodoController());

    AlertDialog deleteAlert = AlertDialog(
      title: const Text("Delete"),
      content: const Text("Are you sure you want to delete this to-do"),
      actions: [
        MyTextButton(
          text: "No",
          icon: MdiIcons.bookCancelOutline,
          onClick: () {
            Navigator.of(context).pop();
          },
          textColor: Colors.white,
          bgColor: royalblue,
        ),
        MyTextButton(
            text: "Yes",
            icon: MdiIcons.deleteOutline,
            onClick: () async {
              await todoController.deleteTodo(data[index]["id"]);
              // ignore: use_build_context_synchronously
              Navigator.of(context).pop();
            },
            textColor: Colors.white,
            bgColor: Colors.red)
      ],
    );

    return GetBuilder<MySettings>(builder: (color) {
      return SizedBox(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
            boxShadow: [
              BoxShadow(
                offset: const Offset(1, 1),
                spreadRadius: 1,
                blurRadius: 5,
                color: color.darkMode
                    ? const Color.fromARGB(200, 29, 29, 29)
                    : const Color.fromARGB(10, 0, 0, 0),
              ),
            ],
          ),
          margin: const EdgeInsets.only(bottom: 10),
          child: Material(
            borderRadius: BorderRadius.circular(10),
            color: color.secondaryBg,
            child: InkWell(
              radius: 10,
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                        child: Row(
                      children: [
                        const Icon(
                          MdiIcons.checkboxMarkedCircleOutline,
                          color: Colors.green,
                          size: 20,
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: Text(
                                  data[index]['content'],
                                  style: TextStyle(
                                      color: color.primaryColor, fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                    MyIconButton(
                        onClick: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return deleteAlert;
                            },
                          );
                        },
                        icon: MdiIcons.deleteEmptyOutline,
                        bgColor: Colors.transparent,
                        color: color.red),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
