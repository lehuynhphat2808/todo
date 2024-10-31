import 'package:flutter/widgets.dart';
import 'package:todo/todo.dart';

class TodoProvider with ChangeNotifier {
  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  void addTodo(String title) {
    _todos.add(Todo(title: title));
    notifyListeners();
  }

  void removeTodo(int index) {
    _todos.removeAt(index);
    notifyListeners();
  }

  void toggleTodoStatus(int index) {
    _todos[index].isComplete = !todos[index].isComplete;
    notifyListeners();
  }
}
