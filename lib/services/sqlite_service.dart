import 'package:notepad/model/note_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqliteService {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();

    return openDatabase(
      join(path, 'notepad.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE Notes(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, content TEXT NOT NULL, timestamp TEXT NOT NULL)",
        );
        await database.execute(
          "CREATE TABLE Todos(id INTEGER PRIMARY KEY AUTOINCREMENT, content TEXT NOT NULL)",
        );
      //  await database.execute(
      //     "CREATE TABLE Settings(darkmode TEXT NOT NULL)",
      //   );
      },
      version: 1,
    );
  }

  Future<int> insertNote(List<Note> notes) async {
    int result = 0;
    final Database db = await initializeDB();
    for (var note in notes) {
      result = await db.insert("Notes", note.toMap());
    }
    return result;
  }

  Future<List<Map>> getNotes() async {
    final Database db = await initializeDB();
    List<Map> queryResult = await db.rawQuery("SELECT * FROM Notes");
    return queryResult;
  }

  deleteNote(id) async {
    final Database db = await initializeDB();
    var count = db.rawDelete("DELETE FROM Notes WHERE id = ?", [id]);
    return count;
  }

  updateNote(id, title, content, timestamp) async {
    final Database db = await initializeDB();
    var count = db.rawUpdate(
        "UPDATE Notes SET title=?, content=?, timestamp=? WHERE id=?",
        [title, content, timestamp, id]);
    return count;
  }

  getNote(id) async {
    final Database db = await initializeDB();
    var result = await db.rawQuery("SELECT * FROM Notes WHERE id=?", [id]);
    return result;
  }

  getTodos() async {
    final Database db = await initializeDB();
    List<Map> result = await db.rawQuery("SELECT * FROM Todos");
    return result;
  }

  insertTodo(todos) async {
    int result = 0;
    final Database db = await initializeDB();
    for (var todo in todos) {
      result = await db.insert("Todos", todo.toMap());
    }
    return result;
  }

  deleteTodo(id) async {
    final Database db = await initializeDB();
    var count = db.rawDelete("DELETE FROM Todos WHERE id=?", [id]);
    return count;
  }

  // setSettings(settings) async {
  //   int result = 0;
  //   final Database db = await initializeDB();
  //   for (var setting in settings) {
  //     result = await db.insert("Settings", setting.toMap());
  //   }
  //   return result;
  // }

  // getColorMode() async {
  //   final Database db = await initializeDB();
  //   var result = await db.rawQuery("SELECT darkmode from Settings");
  //   return result;
  // }
}
