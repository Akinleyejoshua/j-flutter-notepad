import 'package:get/get.dart';
import 'package:notepad/model/todo_model.dart';
import 'package:notepad/services/sqlite_service.dart';

class TodoController extends GetxController {
  late SqliteService handler = SqliteService();

  var todos = [];
  var toggleTodo = false;
  var content = "";
  var onEdit = false;

  onContentChange(val) {
    content = val;
    onEdit = true;

    if (val == "") {
      onEdit = false;
    }
    update();
  }

  getTodos() async {
    var data = await handler.getTodos();
    todos = data;
    update();
  }

  toggleTodoBar(val) async {
    toggleTodo = val;
    update();
  }

  addTodo() async {
    var todo = Todo(content: content);
    await handler.insertTodo([todo]);
    toggleTodo = false;
    onEdit = false;
    content = "";
    getTodos();
    update();
  }

  deleteTodo(id) async {
    await handler.deleteTodo(id);
    getTodos();
    update();
  }
}
