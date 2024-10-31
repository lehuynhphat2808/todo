import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/todo_provider.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (context, todoProvider, child) {
        return ListView.builder(
          itemCount: todoProvider.todos.length,
          itemBuilder: (context, index) {
            if (todoProvider.todos.isNotEmpty) {
              final todo = todoProvider.todos[index];
              return ListTile(
                title: Text(
                  todo.title,
                  style: TextStyle(
                    decoration:
                        todo.isComplete ? TextDecoration.lineThrough : null,
                  ),
                ),
                leading: Checkbox(
                  value: todo.isComplete,
                  onChanged: (value) {
                    todoProvider.toggleTodoStatus(index);
                  },
                ),
                trailing: IconButton(
                  onPressed: () {
                    todoProvider.removeTodo(index);
                  },
                  icon: Icon(Icons.delete),
                ),
              );
            } else {
              return Text("You don't have any todo");
            }
          },
        );
      },
    );
  }
}
