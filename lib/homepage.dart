import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/todo_list_widget.dart';
import 'package:todo/todo_provider.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This is Todo App"),
      ),
      body: Column(
        children: [
          Expanded(
            child: TodoListWidget(),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(hintText: "add a new todo"),
                ),
              ),
              IconButton(
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      Provider.of<TodoProvider>(context, listen: false)
                          .addTodo(_controller.text);
                      _controller.clear();
                    }
                  },
                  icon: Icon(Icons.add))
            ],
          )
        ],
      ),
    );
  }
}
