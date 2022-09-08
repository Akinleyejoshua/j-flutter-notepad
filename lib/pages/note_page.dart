import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:notepad/components/list_notes.dart';
import 'package:notepad/components/navbar.dart';
import 'package:notepad/components/note_header.dart';
import 'package:notepad/contorllers/navbar_controller.dart';
import 'package:notepad/contorllers/notes_controller.dart';
import 'package:notepad/contorllers/settings.dart';
import 'package:notepad/pages/add_note.dart';

class NotePage extends StatelessWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NotesController notesController = Get.put(NotesController());
    notesController.getNote();

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
                      children: const [
                        NoteHeader(
                          title: "Notes",
                        ),
                        ListNote(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddNotePage(),
            ),
          );
        },
        child: const Icon(MdiIcons.plusOutline),
      ),
    );
  }
}
