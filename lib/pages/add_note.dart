import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:notepad/components/add_note_header.dart';
import 'package:notepad/components/navbar.dart';
import 'package:notepad/components/text_button.dart';
import 'package:notepad/constants/colors.dart';
import 'package:notepad/contorllers/notes_controller.dart';
import 'package:notepad/contorllers/settings.dart';
import 'package:notepad/pages/note_page.dart';

class AddNotePage extends StatelessWidget {
  const AddNotePage({this.id, Key? key}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final id;

  @override
  Widget build(BuildContext context) {
    NotesController notesController = Get.put(NotesController());
    TextEditingController title = TextEditingController();
    TextEditingController content = TextEditingController();

    DateTime datetime = DateTime.now();
    String formatDate = DateFormat('yyyy-MM-dd').add_jm().format(datetime);

    if (id != null) {
      title.text = notesController.noteById[0]["title"];
      content.text = notesController.noteById[0]["content"];
    }

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
              notesController.deleteNote(notesController.noteById[0]["id"]);
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const NotePage()));
            },
            textColor: Colors.white,
            bgColor: Colors.red)
      ],
    );

    return Scaffold(
        body: Stack(
      children: [
        NavBar(),
        GetBuilder<NotesController>(
          init: NotesController(),
          builder: (_) => GetBuilder<MySettings>(
              init: MySettings(),
              builder: (color) {
                return Container(
                  color: color.secondaryBg,
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AddNoteHeader(),
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                id != null
                                    ? "${notesController.noteById[0]['timestamp']}"
                                    : formatDate,
                                style: const TextStyle(color: royalblue),
                              ),
                              SizedBox(
                                width: 260,
                                child: TextField(
                                  controller: title,
                                  onChanged: ((value) =>
                                      notesController.onTitleChange(value)),
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: color.primaryColor,
                                  ),
                                  textCapitalization: TextCapitalization.words,
                                  decoration: InputDecoration(
                                    hintText: "Title",
                                    hintStyle:
                                        TextStyle(color: color.primaryColor),
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 0),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 300,
                                child: TextField(
                                  controller: content,
                                  style: TextStyle(color: color.primaryColor),
                                  maxLines: 12,
                                  minLines: 1,
                                  onChanged: ((value) =>
                                      notesController.onContentChange(value)),
                                  decoration: InputDecoration(
                                    hintText: "Note here",
                                    border: InputBorder.none,
                                    hintStyle:
                                        TextStyle(color: color.primaryColor),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 0),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(10),
                              ),
                              (_.onEdit == true.obs && id == null)
                                  ? MyTextButton(
                                      text: "Save",
                                      icon: MdiIcons.contentSaveOutline,
                                      onClick: () async {
                                        await notesController.addNote();
                                        await notesController.getNote();
                                        // ignore: use_build_context_synchronously
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const NotePage()));
                                      },
                                      textColor: Colors.white,
                                      bgColor: Colors.green)
                                  : Container(),
                              id != null
                                  ? SizedBox(
                                      width: 220,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          MyTextButton(
                                              text: "Update",
                                              icon: MdiIcons.update,
                                              onClick: () {
                                                notesController.updateNote(
                                                    notesController.noteById[0]
                                                        ["id"]);
                                              },
                                              textColor: Colors.white,
                                              bgColor: royalblue),
                                          MyTextButton(
                                              text: "Delete",
                                              icon: MdiIcons.deleteOutline,
                                              onClick: () {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return deleteAlert;
                                                  },
                                                );
                                              },
                                              textColor: Colors.white,
                                              bgColor: Colors.red)
                                        ],
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    ));
  }
}
