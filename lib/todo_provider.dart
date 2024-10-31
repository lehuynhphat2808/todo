import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/todo.dart';

class TodoProvider with ChangeNotifier {
  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  TodoProvider() {
    _loadTodos();
  }

  Future<void> _loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final String? todoString = prefs.getString('todos');
    if (todoString != null) {
      Iterable decoded = jsonDecode(todoString);
      _todos = List<Todo>.from(decoded.map(
        (e) => Todo.fromJson(e),
      ));
      notifyListeners();
    }
  }

  Future<void> _saveTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final String todosString = jsonEncode(_todos
        .map(
          (e) => e.toJson(),
        )
        .toList());
    prefs.setString('todos', todosString);
  }

  void addTodo(String title) {
    _todos.add(Todo(title: title));
    _saveTodos();
    notifyListeners();
  }

  void removeTodo(int index) {
    _todos.removeAt(index);
    _saveTodos();
    notifyListeners();
  }

  void toggleTodoStatus(int index) {
    _todos[index].isComplete = !todos[index].isComplete;
    _saveTodos();
    notifyListeners();
  }
}
