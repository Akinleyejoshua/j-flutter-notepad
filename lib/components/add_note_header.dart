import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:notepad/constants/colors.dart';
import 'package:notepad/contorllers/navbar_controller.dart';
import 'package:notepad/contorllers/notes_controller.dart';
import 'package:notepad/pages/note_page.dart';

class AddNoteHeader extends StatelessWidget {
  const AddNoteHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NotesController notesController = Get.put(NotesController());

    return GetBuilder<NavBarController>(
      init: NavBarController(),
      builder: (_) => Container(
        padding: const EdgeInsets.only(top: 40, right: 0, left: 0, bottom: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      notesController.getNote();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const NotePage(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: const Icon(
                        MdiIcons.arrowLeft,
                        color: royalblue,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    "Add Note",
                    style: TextStyle(color: royalblue, fontSize: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
