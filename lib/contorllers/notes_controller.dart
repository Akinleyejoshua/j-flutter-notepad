import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:notepad/model/note_model.dart';
import 'package:notepad/services/sqlite_service.dart';

class NotesController extends GetxController {
  late SqliteService handler = SqliteService();
  var onEdit = false.obs;
  var title = "";
  var content = "";
  var note = [];
  var searchFiltered = [];
  // ignore: prefer_typing_uninitialized_variables
  var noteById;

  getTimestamp() {
    DateTime datetime = DateTime.now();
    String formatDate = DateFormat('yyyy-MM-dd').add_jm().format(datetime);
    return formatDate;
  }

  initialState() {
    onEdit = false.obs;
    title = "";
    content = "";
    update();
  }

  void onTitleChange(val) {
    onEdit = true.obs;
    if (val == "") {
      onEdit = false.obs;
    }
    title = val;
    update();
  }

  void onContentChange(val) {
    onEdit = true.obs;
    if (val == "") {
      onEdit = false.obs;
    }
    content = val;
    update();
  }

  addNote() async {
    onEdit = false.obs;
    var timestamp = getTimestamp();

    Note note = Note(title: title, content: content, timestamp: timestamp);

    handler.insertNote([note]);
    return;
  }

  getNote() async {
    var data = await handler.getNotes();
    note = data;
    update();
    return true;
  }

  deleteNote(id) async {
    await handler.deleteNote(id);
    initialState();
    return true;
  }

  updateNote(id) async {
    var timestamp = getTimestamp();
    await handler.updateNote(id, title, content, timestamp);
    update();
    return true;
  }

  getNoteById(id) async {
    noteById = await handler.getNote(id);
    update();
  }

  searchNote(val) {
    var filter = note
        .where((item) => item["title"].toString().toLowerCase().contains(val))
        .toList();
    searchFiltered = filter;
  }
}
