import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:notepad/components/icon_button.dart';
import 'package:notepad/components/text_button.dart';
import 'package:notepad/constants/colors.dart';
import 'package:notepad/contorllers/notes_controller.dart';
import 'package:notepad/contorllers/settings.dart';
import 'package:notepad/pages/add_note.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({Key? key, required this.data, required this.index})
      : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final data;
  // ignore: prefer_typing_uninitialized_variables
  final index;

  @override
  Widget build(BuildContext context) {
    NotesController notes = Get.put(NotesController());
    // print(data[index]["id"]);
    AlertDialog deleteAlert = AlertDialog(
      title: const Text("Delete Note"),
      content: const Text("Are you sure you want to delete this Note?"),
      actions: [
        MyTextButton(
            text: "No",
            icon: MdiIcons.bookCancelOutline,
            onClick: () {
              Navigator.of(context).pop();
            },
            textColor: Colors.white,
            bgColor: royalblue),
        MyTextButton(
            text: "Yes",
            icon: MdiIcons.deleteOutline,
            onClick: () async {
              await notes.deleteNote(data[index]["id"]);
              await notes.getNote();
              // ignore: use_build_context_synchronously
              Navigator.of(context).pop();
            },
            textColor: Colors.white,
            bgColor: Colors.red)
      ],
    );

    return GetBuilder<MySettings>(
        init: MySettings(),
        builder: (color) {
          return SizedBox(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
                // boxShadow: const [
                //   BoxShadow(
                //     offset: Offset(1, 1),
                //     spreadRadius: 1,
                //     blurRadius: 50,
                //     color: Color.fromARGB(20, 0, 0, 0),
                //   ),
                // ],
              ),
              margin: const EdgeInsets.only(bottom: 10),
              child: Material(
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data[index]['title'],
                                    style: const TextStyle(
                                      color: royalblue,
                                      fontSize: 25,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: color.whitesmoke,
                                    ),
                                    child: Text(
                                      data[index]['timestamp'],
                                      style: const TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 0.9),
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: SizedBox(
                                      width: 270,
                                      child: Text(
                                        data[index]['content'],
                                        style: TextStyle(
                                            color: color.primaryColor,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // width: 100,
                      // color: Colors.red,
                      margin: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 10),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: MyIconButton(
                                onClick: () async {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return deleteAlert;
                                    },
                                  );
                                },
                                icon: MdiIcons.deleteCircleOutline,
                                bgColor: color.whitesmoke,
                                color: color.red),
                          ),
                          MyIconButton(
                              onClick: () async {
                                await notes.getNoteById(data[index]["id"]);
                                // ignore: use_build_context_synchronously
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (builder) =>
                                        AddNotePage(id: data[index]["id"])));
                              },
                              icon: MdiIcons.noteEditOutline,
                              bgColor: color.whitesmoke,
                              color: color.royalblue)
                        ],
                      ),
                    ),
                    Container(
                      height: 0.5,
                      width: 300,
                      margin: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                      color:
                          color.darkMode ? color.whitesmoke : color.royalblue,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
