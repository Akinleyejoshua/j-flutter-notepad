import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notepad/components/note_item.dart';
import 'package:notepad/contorllers/notes_controller.dart';
import 'package:notepad/contorllers/settings.dart';
import 'package:notepad/pages/note_page.dart';

class SearchNotePage extends StatelessWidget {
  const SearchNotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MySettings>(
      init: MySettings(),
      builder: (color) {
        return Scaffold(
          body: Container(
            color: color.secondaryBg,
            child: GetBuilder<NotesController>(
              init: NotesController(),
              builder: (notes) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: MediaQuery.of(context).padding),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: IconButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const NotePage(),
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: color.royalblue,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(5),
                          ),
                          SizedBox(
                            width: 240,
                            height: null,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              margin:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: color.whitesmoke,
                              ),
                              child: TextField(
                                onChanged: (value) {
                                  notes.searchNote(value);
                                },
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Search Note & Todo",
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: ListView.builder(
                          padding: const EdgeInsets.all(0),
                          itemCount: notes.searchFiltered.length,
                          itemBuilder: ((context, index) => NoteItem(
                              data: notes.searchFiltered, index: index)),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
