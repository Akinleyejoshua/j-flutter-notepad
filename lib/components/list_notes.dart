import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:notepad/components/note_item.dart';
import 'package:notepad/constants/colors.dart';
import 'package:notepad/contorllers/notes_controller.dart';

class ListNote extends StatelessWidget {
  const ListNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotesController>(
      builder: (_) => _.note.isEmpty
          ? Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    MdiIcons.noteOutline,
                    size: 80,
                    color: royalblue,
                  ),
                  Text("No Notes"),
                ],
              ),
            )
          : GetBuilder<NotesController>(
              init: NotesController(),
              builder: (_) => Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: _.note.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => NoteItem(
                    data: _.note,
                    index: index,
                  ),
                ),
              ),
            ),
    );
  }
}
